//
//  PersonData.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import Foundation

struct PersonData: Codable {
    var results: [Result]
}

struct Result: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob, registered: Dob
    let phone, cell: String
    let picture: Picture
    let nat: String
}

struct Dob: Codable {
    let date: String
    let age: Int
}

struct Location: Codable {
    let street: Street
    let city, state, country: String
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Coordinates: Codable {
    let latitude, longitude: String
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Timezone: Codable {
    let offset, description: String
}

struct Name: Codable {
    let title, first, last: String
}
struct Picture: Codable {
    let large, medium, thumbnail: String
}

// Call API --- https://randomuser.me/api/?results=10
