//
//  ContactComponent.swift
//  PMU!
//
//  Created by Melwayz's  on 30/3/21.
//

import SwiftUI

struct ContactComponentView: View {
    
    var restaurant : Restaurant
    
    var body: some View {
        VStack(alignment: .leading){
            //Address
            Text("ที่อยู่ร้านอาหาร").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
            Text(restaurant.formatted_address).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451)).lineLimit(3).frame(width: 240, alignment: .leading)
            
            //Contact
            Text("เบอร์โทรศัพท์").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
            Text(restaurant.formatted_phone_number).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451))
        }
    }
}

