//
//  Category.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import Foundation

struct Categories{
    
    let id : Int
    let name : String
    let image : String
}
extension Categories{
    
    static func all() -> [Categories]{
        
        return[
            Categories(id: 0 ,name: "อาหารไทย" ,  image: "thai-food"),
            Categories(id: 1 ,name: "อาหารจีน" ,  image: "chinese-food"),
            Categories(id: 2 ,name: "อาหารญี่ปุ่น" ,  image: "japanese-food"),
            Categories(id: 3 ,name: "จานด่วน" ,  image: "fast-food"),
            Categories(id: 4 ,name: "ก๋วยเตี๋ยว" ,  image: "noodle"),
            Categories(id: 5 ,name: "บุฟเฟต์" ,  image: "buffet"),
            Categories(id: 6 ,name: "ชา/กาแฟ" ,  image: "coffee"),
            Categories(id: 7 ,name: "ของหวาน" ,  image: "dessert"),
        ]
    }
}

