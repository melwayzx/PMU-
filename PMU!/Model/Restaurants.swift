//
//  Restaurants.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import Foundation

struct Restaurants{
    
    let name : String
    let review_score : String
    let star_score : Double
    let address : String
    let image : Array<String>
    let status : Bool
    let opening_time : String
    let contact : String
    let isFavourite : Bool
}


extension Restaurants{
    
    static func all() -> [Restaurants]{
        
        return[
            Restaurants(name: "เกาเหลาสามหมู ข้าวขาหมูร้อยอาจารย์" , review_score : "10" , star_score: 4.0 , address: "392 ซอยจุฬา18 แขวงวังใหม่ เขตปทุมวัน กรุงเทพมหานคร 10330" , image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "13.00 - 23.00 น." , contact : "087-3355336" ,isFavourite : true ),
            Restaurants(name: "2" , review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  ,  image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : true),
            Restaurants(name: "เกาเหลาสามหมู ข้าวขาหมูร้อยอาจารย์" , review_score : "10" , star_score: 4.0, address: "392 ซอยจุฬา18 แขวงวังใหม่ เขตปทุมวัน กรุงเทพมหานคร 10330" , image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "13.00 - 23.00 น." , contact : "085-1156750" ,isFavourite : true ),
            Restaurants(name: "4" ,  review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  , image: ["thai-food","fast-food","buffet"], status: false ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : false),
            Restaurants(name: "5" ,  review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  , image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : true),
            Restaurants(name: "6" ,  review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  , image: ["thai-food","fast-food","buffet"], status: false ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : true),
            Restaurants(name: "7" ,  review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  , image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : true),
            Restaurants(name: "8" , review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  ,  image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : false),
            Restaurants(name: "9" ,  review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  , image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : true),
            Restaurants(name: "10" ,  review_score : "10" , star_score: 4.0 , address: "ที่อยู่ร้าน"  , image: ["thai-food","fast-food","buffet"], status: true ,opening_time: "เวลาเปิด/ปิด" , contact : "เบอร์โทรติดต่อ" ,isFavourite : true),
        ]
    }
    
    
}


struct PlaceID {
    let place_id : String
}


extension PlaceID{
    static func getPlaceID() -> [PlaceID] {
        return [PlaceID(place_id: "ChIJt3-3sC6Z4jAR01CFiBVAYkU"), PlaceID(place_id: "ChIJMU_ZUymZ4jARJElgUCpqVrI")]
    }
}

