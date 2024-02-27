//
//  QRScaneTests.swift
//  LinkPalmTests
//
//  Created by Denis Ureke on 2024-02-27.
//

import XCTest
@testable import LinkPalm

final class QRScaneTests: XCTestCase {
    
    // Check the sorting of data when QR is read is done properly
    
    func testQRScanInData() throws {
        
        let list = UserDesignList()
        
        let components : [String] = ["1234", "Joe", "Moe", "person"]
        let message = checkQRCode(userDesign: list, components: components)
        XCTAssertEqual(message, "New Contact Added")
        
        let components2 : [String] = ["12345", "house", "door", "item"]
        let message2 = checkQRCode(userDesign: list, components: components2)
        XCTAssertEqual(message2, "New Product Added")
        
        let components3 : [String] = ["12346", "Apple", "Inc", "company"]
        let message3 = checkQRCode(userDesign: list, components: components3)
        XCTAssertEqual(message3, "New Company Added")
        
        let components4 : [String] = ["123467", "Apple", "Inc", "SomethingODD"]
        let message4 = checkQRCode(userDesign: list, components: components4)
        XCTAssertEqual(message4, "Invalid Contact Data")
        
    }
    
    // Check if the are read properly
    func testCapitalLettersonCreation() throws{
        
        let list = UserDesignList()
        
        let components : [String] = ["1234", "Joe", "Moe", "PerSon"]
        let message = checkQRCode(userDesign: list, components: components)
        XCTAssertEqual(message, "New Contact Added")
        
        let components2 : [String] = ["12345", "house", "door", "itEm"]
        let message2 = checkQRCode(userDesign: list, components: components2)
        XCTAssertEqual(message2, "New Product Added")
        
        let components3 : [String] = ["12346", "Apple", "Inc", "COMPANY"]
        let message3 = checkQRCode(userDesign: list, components: components3)
        XCTAssertEqual(message3, "New Company Added")
        
        let components4 : [String] = ["123467", "Apple", "Inc", "SomethingODD"]
        let message4 = checkQRCode(userDesign: list, components: components4)
        XCTAssertEqual(message4, "Invalid Contact Data")
        
    }
    
    // Check if the items are appended with Wrong Syntax in QR Code
    func testThatItemsAreAppended() throws {
        
        let expectation = XCTestExpectation(description: "Check if populated correctly")
        let list = UserDesignList()
        
        let components : [String] = ["1234", "Joe", "Moe", "PerSon"]
        let _ = checkQRCode(userDesign: list, components: components)
        
        let components2 : [String] = ["12345", "house", "door", "itEm"]
        let _ = checkQRCode(userDesign: list, components: components2)
        
        let components3 : [String] = ["12346", "Apple", "Inc", "COMPANY"]
        let _ = checkQRCode(userDesign: list, components: components3)
        
        let components4 : [String] = ["123467", "Apple", "Inc", "SomethingODD"] // should not append wrong Type
        let _ = checkQRCode(userDesign: list, components: components4)
        
        expectation.isInverted = true
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertEqual(list.userList.count, 3)
        
    }
    
    // Check if the items are appended
    
    func testCorrectAppend() throws {
        
        let expectation = XCTestExpectation(description: "Check and Populate userList")
        let list = UserDesignList()
        
        let components : [String] = ["1234", "Joe", "Moe", "person"]
        let message = checkQRCode(userDesign: list, components: components)
        XCTAssertEqual(message, "New Contact Added")
        
        expectation.isInverted = true
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertEqual(list.userList.count, 1)
    }
    
    func testCheckAndPopulateTime() throws {
        
        let components : [String] = ["1234", "Joe", "Moe", "person"]
        let list = UserDesignList()
        
        self.measure {
            _ = checkQRCode(userDesign: list, components: components)
        }
    }
    
    
}
