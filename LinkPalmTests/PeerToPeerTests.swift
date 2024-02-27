//
//  PeerToPeerTests.swift
//  LinkPalmTests
//
//  Created by Denis Ureke on 2024-02-27.
//

import XCTest
@testable import LinkPalm
import SwiftUI

final class PeerToPeerTests: XCTestCase {

    // Check if password are correctly updates and state of bool when using functions
    
    func testPeerInitWithPassword() throws {

        let password = "12345"
        let list = UserDesignList()
        let session = ExchangeSession(password: password, userList: list)
        XCTAssertEqual(session.password, password)
        
        let newPassword = "54321"
        session.resetpasswordsDoNotMatch(newPassword: newPassword)
        XCTAssertEqual(session.password, newPassword)
        XCTAssertFalse(session.passwordsDoNotMatch)
        
    }
    
    // Measure Time to initiate the peer to peer object
    
    func testMeasureTimeForConnecting() throws {
        let password = "12345"
        let list = UserDesignList()
        
        self.measure {
            _ = ExchangeSession(password: password, userList: list)
        }
    }

}
