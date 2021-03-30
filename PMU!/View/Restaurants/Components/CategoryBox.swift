//
//  CategoryItem.swift
//  PMU!
//
//  Created by Melwayz's  on 30/3/21.
//

import SwiftUI

struct CategoryBox: View {
    
    var item : String
    
    var body: some View {
        Text(item)
            .font(.caption)
            .padding(.leading , 5).padding(.trailing , 5)
            .cornerRadius(40)
            .foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745))
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color(red: 0.855, green: 0.855, blue: 0.855) , lineWidth: 1  )
            )
    }
}
