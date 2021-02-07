//
//  PopularItem.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct PopularItem: View {

    var item : Restaurants
    var body: some View {
        VStack(alignment: .leading){
            Image("item.image").resizable()
                .frame(width: 136,height: 150)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.855, green: 0.855, blue: 0.855, opacity: 0.5), lineWidth: 0.5))
            
            
            Text(item.name).fontWeight(.semibold).font(.custom("Sukhumvit Set", size: 14)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).lineLimit(1)
//                                .multilineTextAlignment(.leading)
                
                Text(item.address).fontWeight(.regular).font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1)) .lineLimit(1)
                
            HStack{
                    Image(systemName: "star.fill").foregroundColor(.yellow).font(.system(size: 12, weight: .regular))
                    
                    Text(String(format: "%.1f" ,item.star_score)).font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                    
                    Text("\(item.review_score) รีวิว").font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                    
            }
                
        }.frame(width:136 , height: 220).padding(6)
    }
}

struct PopularItem_Previews: PreviewProvider {
    static var previews: some View {
        PopularItem(item: Restaurants.all()[0])
    }
}
