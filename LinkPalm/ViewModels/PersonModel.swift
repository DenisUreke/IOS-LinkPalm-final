//
//  PersonModel.swift
//  LinkPalm
//
//  Created by Denis Ureke on 2024-02-07.
//

import Foundation
import Observation

@Observable
class PictureModel{
    
    let large: String
    let medium: String
    let thumbnail: String
    
    init(imageURL: Picture){
        self.large = imageURL.large
        self.medium = imageURL.medium
        self.thumbnail = imageURL.thumbnail
    }
}

@Observable
class NameModel{
    
    let title: String
    let first: String
    let last: String
    
    init(name: Name){
        self.title = name.title
        self.first = name.first
        self.last = name.last
    }
    
}

@Observable
class TimeZoneModel{
    
    let offset: String
    let description: String
    
    init(timeZone: Timezone){
        self.offset = timeZone.offset
        self.description = timeZone.description
    }
}

@Observable
class StreetModel{
    
    let number: Int
    let name: String
    
    init(street: Street){
        self.number = street.number
        self.name = street.name
    }
}

@Observable
class CoordinatesModel{
    
    let latitude: String
    let longitude: String
    
    init(coordinates: Coordinates){
        self.latitude = coordinates.latitude
        self.longitude = coordinates.longitude
    }
}

@Observable
class LocationModel{
    
    let street: StreetModel
    let city: String
    let state: String
    let country: String
    //let postcode: String
    let coordinates: CoordinatesModel
    let timezone: TimeZoneModel
    
    init(location: Location, street: StreetModel, coordinates: CoordinatesModel, timezone: TimeZoneModel){
        self.street = street
        self.city = location.city
        self.state = location.state
        self.country = location.country
        //self.postcode = location.postcode
        self.coordinates = coordinates
        self.timezone = timezone
    }
    
}

@Observable
class DobModel{
    
    let date: String
    let age: Int
    
    init(dob: Dob){
        self.date = dob.date
        self.age = dob.age
    }
}

@Observable
class ResultModel{
    
    let gender: String
    let name: NameModel
    let location: LocationModel
    let email: String
    let dob: DobModel
    let registered: DobModel
    let phone: String
    let cell: String
    let picture: PictureModel
    let nat: String
    
    init(result: Result, name: NameModel, location: LocationModel, dob: DobModel, picture: PictureModel){
        
        self.gender = result.gender
        self.name = name
        self.location = location
        self.email = result.email
        self.dob = dob
        self.registered = dob
        self.phone = result.phone
        self.cell = result.cell
        self.picture = picture
        self.nat = result.nat
    }
}

@Observable
class PersonDataModel {
    
    var result: Result
    
    init(result: Result) {
        self.result = result
    }
    
}
