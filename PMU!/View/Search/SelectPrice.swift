//
//  SelectPrice.swift
//  PMU!
//
//  Created by Melwayz's  on 21/3/21.
//

import SwiftUI

struct SelectPrice: View {
    
    var item : PriceChoices
    var didSelect : Int
    var body: some View {
        VStack{
            Text(item.title).font(.custom("Sukhumvit Set", size: 16)).fontWeight(.bold)
//            Text(item.subtitle).font(.custom("Sukhumvit Set", size: 14))
        }
        .frame(width: 60, height: 40)
        .background(didSelect == item.id ? Color(red: 0.00, green: 0.13, blue: 0.25) : Color.white)
        .cornerRadius(20)
        .foregroundColor(didSelect == item.id  ?  Color.white : Color(red: 0.682, green: 0.702, blue: 0.745) )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(didSelect == item.id  ?  Color(red: 0.00, green: 0.13, blue: 0.25) : Color(red: 0.682, green: 0.702, blue: 0.745) , lineWidth: 1  )
        )
    }
}
