//
//  SelectPrice.swift
//  PMU!
//
//  Created by Melwayz's  on 21/3/21.
//

import SwiftUI

struct SelectPriceItem: View {
    
    var item : PriceChoices
    var didSelect : [String]
    
    var body: some View {
        VStack{
            Text(item.subtitle).font(.callout)
        }
        .frame(height: 40)
        .padding(.leading,5)
        .padding(.trailing,5)
//        .padding(.leading,10).padding(.trailing,10)
        .background(didSelect.contains(item.subtitle) ? Color(red: 0.00, green: 0.13, blue: 0.25) : Color.white)
        .cornerRadius(20)
        .foregroundColor(didSelect.contains(item.subtitle)  ?  Color.white : Color(red: 0.682, green: 0.702, blue: 0.745) )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(didSelect.contains(item.subtitle)  ?  Color(red: 0.00, green: 0.13, blue: 0.25) : Color(red: 0.682, green: 0.702, blue: 0.745) , lineWidth: 1  )
        )
    }
}
