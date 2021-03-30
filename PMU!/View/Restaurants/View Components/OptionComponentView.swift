//
//  OptionComponentView.swift
//  PMU!
//
//  Created by Melwayz's  on 30/3/21.
//

import SwiftUI

struct OptionComponentView: View {
    var restaurant : Restaurant
    
    var body: some View {
        VStack(alignment: .leading){
            //Opening time
            Text("เวลาเปิดทำการ").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
            ForEach(0..<Int(restaurant.weekday.count)){day in
                Text(restaurant.weekday[day])
            }

            Divider()
            //Parking
            Text("ที่จอดรถ").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
            Text(restaurant.option[0] != "" ? "มีที่จอดรถ" : "-")
            
            Divider()
            //Delivery
            DeliveryDetail(option: restaurant.option)
           
            Divider()
            //Promo
            PromoDetail(option: restaurant.option)
            
            Spacer()
            
        }.font(.callout).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451))
    }
}

