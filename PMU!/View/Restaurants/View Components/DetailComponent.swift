//
//  DetailComponent.swift
//  PMU!
//
//  Created by Melwayz's  on 22/3/21.
//

import SwiftUI

struct DetailComponent: View {
    
    var restaurant : Restaurant
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .firstTextBaseline){
                Text(restaurant.name) .font(.title).bold().foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Spacer()
                Image(systemName: "heart.fill").foregroundColor(.red).font(.title)
                
            }
            
            
            HStack{
                ForEach(restaurant.category_text , id: \.self){category in
                    Text(category)
                        .font(.subheadline)
                        .frame(height: 30)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745))
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(red: 0.855, green: 0.855, blue: 0.855)))
                }
            }
            
            HStack(spacing: 1){
                ForEach(0..<Int(restaurant.rating)){ item in
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }
                ForEach(0..<5-Int(restaurant.rating)){ item in
                    Image(systemName: "star.fill")
                }
                
                Text(String(format: "%.1f" ,restaurant.rating))
                
                Text("( \(restaurant.user_ratings_total) รีวิว )")
                
            }.font(.callout).foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745))
            
            //Price
            HStack{
                Text("ราคา ").fontWeight(.semibold).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25) )
                PriceText(price : restaurant.price_level).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451))
            }.font(.callout)
            
            //Open now
            HStack{
                Text("\(restaurant.open_now == true ? "เปิดอยู่" : "ปิด")").foregroundColor(restaurant.open_now == true ? Color(red: 0.421, green: 0.754, blue: 0.514) : Color(.red)).bold()
                
                Text("เวลาเปิด").fontWeight(.semibold).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25) )
                Text(restaurant.opening_time).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451))
            }
        }
    }
}

