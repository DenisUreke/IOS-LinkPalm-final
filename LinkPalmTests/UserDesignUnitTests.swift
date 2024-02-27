//
//  UserDesignUnitTest.swift
//  LinkPalmTests
//
//  Created by Denis Ureke on 2024-02-26.
//

import XCTest
@testable import LinkPalm


final class UserDesignUnitTest: XCTestCase {
    
    //Check if The init correclty asign typeofContact depending on the passed information QR and Peer

    func testUserHasCorrectType() throws {
        
        let model = UserDesignModel(userID: "1234", typeOfContact: "person")
        XCTAssertEqual(model.typeOfContact, .person)
        
        let model2 = UserDesignModel(userID: "1234", typeOfContact: "company")
        XCTAssertEqual(model2.typeOfContact, .company)
        
        let model3 = UserDesignModel(userID: "1234", typeOfContact: "item")
        XCTAssertEqual(model3.typeOfContact, .item)
        
        let model4 = UserDesignModel(userID: "1234", typeOfContact: "something fake")
        XCTAssertEqual(model4.typeOfContact, .none)
    }

}
