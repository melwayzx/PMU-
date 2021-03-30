//
//  Response.swift
//  PMU!
//
//  Created by Melwayz's  on 24/2/21.
//

import Foundation

struct Payload : Decodable{
    var name: String
    var formatted_address: String?
    var formatted_phone_number: String?
    var opening_hours : opening_hours
//    var photos : [photos]?
    var price_level: Int?
    var rating: Float?
    var user_ratings_total : Int?
//    var reviews : [reviews]?
    var geometry : geometry
}

struct Response: Decodable{
    
    var result: Payload
}

struct Restaurant: Decodable , Identifiable{
    var id : UUID
    var name: String
    var formatted_address: String
    var formatted_phone_number: String
    var opening_time : String
    var open_now : Bool
//    var photos : [photos]?
    var price_level: String
    var rating: Float
    var user_ratings_total : Int
//    var reviews : [reviews]?
    var lat : Double
    var lng : Double
    var distance : Double
    var category : [Int]
    var category_text : [String]
    var place_id : String
    var option : [String]

}

struct opening_hours : Decodable{
    var open_now : Bool
    var periods : [period]
    var weekday_text : [String]?
    
}

struct period : Decodable{
    var close : close?
    var open : open
}

struct close : Decodable{
    var day : Int
    var time : String
}

struct open : Decodable{
    var day : Int
    var time : String
}

struct photos : Decodable{
    var height : Float
    var html_attributions : [String]
    var photo_reference : String
    var width : Float
}

struct reviews : Decodable{
    var author_name : String
    var author_url : String
    var language : String
    var profile_photo_url : String
    var rating : Int
    var relative_time_description : String
    var text : String
    var time : Int
}

struct geometry : Decodable{
    var location : location
}

struct location : Decodable {
    var lat : Double
    var lng : Double
}
