//
//  SelectCategoryButton.swift
//  PMU!
//
//  Created by Melwayz's  on 1/3/21.
//

import SwiftUI

struct SelectCategoryItem: View {
    
    var item : Categories
    let didSelect : [Int]
    var body: some View {
        Text(item.name)
            .fontWeight(.bold)
            .font(.callout)
            .fontWeight(.semibold)
            .frame(width: 170, height: 40)
            .background(didSelect.contains(item.id) ? Color(red: 0.00, green: 0.13, blue: 0.25) : Color.white)
            .cornerRadius(40)
            .foregroundColor(didSelect.contains(item.id) ?  Color.white : Color(red: 0.682, green: 0.702, blue: 0.745) )
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(didSelect.contains(item.id) ?  Color(red: 0.00, green: 0.13, blue: 0.25) : Color(red: 0.682, green: 0.702, blue: 0.745) , lineWidth: 1  )
            )
    }
}
