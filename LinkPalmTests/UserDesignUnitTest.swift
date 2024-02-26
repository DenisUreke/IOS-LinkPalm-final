//
//  UserDesignUnitTest.swift
//  LinkPalmTests
//
//  Created by Denis Ureke on 2024-02-26.
//

import XCTest
@testable import LinkPalm

final class UserDesignUnitTest: XCTestCase {

    func testingUserDesign() throws {
        
        var model = UserDesignModel(userID: "1234", typeOfContact: "person")
        XCTAssertEqual(model.typeOfContact, .person)
    }
    
    func test_fakeTest() {
        XCTAssertTrue(1 == 1)
    }

    /*func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/

}
