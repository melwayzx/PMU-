//
//  Category.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import Foundation

struct Types{
    
    let name : String
    let image : String
}
extension Types{
    
    static func all() -> [Types]{
        
        return[
            Types(name: "อาหารไทย" ,  image: "thai-food"),
            Types(name: "อาหารจีน" ,  image: "chinese-food"),
            Types(name: "อาหารญี่ปุ่น" ,  image: "japanese-food"),
            Types(name: "จานด่วน" ,  image: "fast-food"),
            Types(name: "ก๋วยเตี๋ยว" ,  image: "noodle"),
            Types(name: "บุฟเฟต์" ,  image: "buffet"),
            Types(name: "ชา/กาแฟ" ,  image: "coffee"),
            Types(name: "ของหวาน" ,  image: "dessert"),
        ]
    }
}

