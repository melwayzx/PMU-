//
//  CategoryItem.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI

struct CategoryItem: View {
    
    
    var item : Categories
    
    var body: some View {
        VStack(alignment: .center)
        {
            Image("item.image").resizable()
                .frame(width: 80,height: 80)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.855, green: 0.855, blue: 0.855, opacity: 0.5), lineWidth: 0.5))
            
            Text(item.name).fontWeight(.semibold).font(.custom("Sukhumvit Set", size: 14)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(item : Categories.all()[0])
    }
}
