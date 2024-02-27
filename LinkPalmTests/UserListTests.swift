//
//  UserListTests.swift
//  LinkPalmTests
//
//  Created by Denis Ureke on 2024-02-27.
//

import XCTest
@testable import LinkPalm



final class UserListTests: XCTestCase {

    // check if list doesn't take duplicates based on ID
    
    func testCheckDuplicateEntriesToList() throws {
        
        let list = UserDesignList()
        let model = UserDesignModel(userID: "1234", typeOfContact: "person")
        let components = ["1234","John", "Doe", "Person"]
        
        XCTAssertFalse(list.checkIfContactExists(components: components))
        list.userList.append(model)
        
        XCTAssertTrue(list.checkIfContactExists(components: components))
        XCTAssertEqual(list.userList.count, 1)
        
        let components2 = ["4321","John", "Doe", "person"]
        XCTAssertFalse(list.checkIfContactExists(components: components2))
    }
    
    //Make sure list is correctly populated
    
    func testIfListIsPopulatedcorrectly() throws {
        
        let expectation = XCTestExpectation(description: "Populate userList")
        let list = UserDesignList()
        let components = ["1234", "John", "Doe", "person"]
        list.createAndPopulate(components: components)
        
        expectation.isInverted = true
        wait(for: [expectation], timeout: 5.0)

        XCTAssertNotNil(list.userList.first?.personData, "personData should be populated")
        XCTAssertNotNil(list.userList.first?.productData, "productData should be populated")
    }
    
    //Measure the effectivness of the populate function
    
    func testTimeForPopulatingFunction() throws {
        
        let list = UserDesignList()
        let components = ["1234","John", "Doe", "person"]
        
        self.measure{
            list.createAndPopulate(components: components)
        }
        
    }
}
