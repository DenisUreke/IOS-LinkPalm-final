//
//  MultiPeer.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-20.
//

import MultipeerConnectivity
import Observation
import os

@Observable
class ExchangeSession: NSObject, ObservableObject {
    
    let serviceType = "exchange"
    let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    let serviceAdvertiser: MCNearbyServiceAdvertiser
    let serviceBrowser: MCNearbyServiceBrowser
    let session: MCSession
    var password: String
    var passwordsDoNotMatch: Bool = false
    var connectedPeers: [MCPeerID] = []
    var userID: String = "" // check this later
    var scannedCode: String?
    var userList: UserDesignList
    var messageSent: String = ""
    
    init(password: String, userList: UserDesignList) {
        self.userList = userList
        self.password = password
        session = MCSession(peer: myPeerId, securityIdentity: nil, encryptionPreference: .none)
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: serviceType)
        serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: serviceType)
        
        super.init()
        
        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self
        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        serviceAdvertiser.stopAdvertisingPeer()
        serviceBrowser.stopBrowsingForPeers()
    }
}

extension ExchangeSession{
    //
    func send(userID: String, firstName: String, lastName: String, typeOfContact: String, password: String) {
        
        self.userID = userID
        
        self.messageSent = "\(userID) \(firstName) \(lastName) \(typeOfContact) \(password)"
        print(messageSent)

        guard let data = messageSent.data(using: .utf8) else {
            print("Failed to convert userID to Data")
            return
        }

        if !session.connectedPeers.isEmpty {
            do {
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error for sending: \(error)")
            }
        }
    }
    func sendError(errorMessage: String) {
        
        let message = errorMessage

        guard let data = message.data(using: .utf8) else {
            print("Failed to convert userID to Data")
            return
        }

        if !session.connectedPeers.isEmpty {
            do {
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                print("Error for sending: \(error)")
            }
        }
    }
    
    func resetpasswordsDoNotMatch(newPassword: String){
        self.password = newPassword
        self.passwordsDoNotMatch = false
    }
    
}

extension ExchangeSession: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
    }

    //Invite!!!!
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String: String]?) {
        
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 10)//<----------------------
    }

    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
    }
}

extension ExchangeSession: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
    }

    // Accept invitiation
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        invitationHandler(true, session)//<----------------------
    }
}
extension ExchangeSession: MCSessionDelegate {
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        DispatchQueue.main.async {
            self.connectedPeers = session.connectedPeers
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        if let receivedUserID = String(data: data, encoding: .utf8) {
            
            DispatchQueue.main.async {
            
                if let receivedString = String(data: data, encoding: .utf8) {
                    
                    let components = receivedString.split(separator: " ", omittingEmptySubsequences: true).map(String.init)
                 
                    if components.count > 1{
                        let recievedPassword = components[4]
                        let recievedUserID = components[0]
                        
                        if recievedPassword == self.password{
                            self.userID = recievedUserID
                            if self.userList.checkIfContactExists(components: components){
                                self.scannedCode = "Contact already exists"
                                return
                            }
                            else{
                                self.userList.createAndPopulate(components: components)
                                self.scannedCode = "New Contact Added"
                            }
                        }
                        else{
                            print("Entered the last area in > 1")
                            self.sendError(errorMessage: "Error")
                            self.passwordsDoNotMatch = true
                        }
                    }
                    else{
                        self.passwordsDoNotMatch = true
                    }
                }
            }
        } else {
            print("Received data is not a valid userID")
        }
    }
    
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    }

    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
    }

    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }

}

