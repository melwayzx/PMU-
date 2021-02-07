//
//  RestaurantItem.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct RestaurantItem: View {
    
    let item : Restaurants
    let singleWidth:CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        HStack{
            Image("item.image").resizable()
                .frame(width: 136,height: 150)
            
            HStack(alignment: .firstTextBaseline){
                VStack(alignment: .leading){
                    Text(item.name).fontWeight(.semibold).font(.custom("Sukhumvit Set", size: 14)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).multilineTextAlignment(.leading).lineLimit(2).frame(width: 165,alignment: .leading)
                    
                    HStack{
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        
                        Text(String(format: "%.1f" ,item.star_score)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                        
                        Text("\(item.review_score) รีวิว").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                        
                    }.font(.custom("Sukhumvit Set", size: 12))
                    
                    HStack{
                        Image(systemName: "clock")
                        
                        Text("\(item.status == true ? "เปิดอยู่" : "ปิด")").foregroundColor(item.status == true ? Color(red: 0.421, green: 0.754, blue: 0.514) : Color(.red)).bold()
                        
                        Text(item.opening_time)
                        
                    }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                    
                    HStack{
                        Image(systemName: "phone.fill")
                        
                        Text(item.contact)
                        
                    }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                    
                    
                }
                
                
            }
            
        }
        .frame(width: singleWidth, height: 136, alignment: .leading) .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.855, green: 0.855, blue: 0.855, opacity: 0.5), lineWidth: 0.5))
    }
}

struct RestaurantItem_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItem(item: Restaurants.all()[0])
    }
}
