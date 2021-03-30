//
//  RestaurantItem.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct RestaurantItem: View {
    
    let singleWidth:CGFloat = UIScreen.main.bounds.width
    var item : Restaurant
    
    var body: some View {
        HStack{
            Image("item.image").resizable()
                .frame(width: 136,height: 150)
            
            //            HStack(alignment: .firstTextBaseline){
            VStack(alignment: .leading){
                Text(item.name).fontWeight(.semibold).font(.callout).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).multilineTextAlignment(.leading).lineLimit(2)
                //
                HStack{
                    CategoryBox(item : item.category_text[0])
                    if(item.category_text.count > 1){
                        CategoryBox(item : item.category_text[1])
                    }
                }
                HStack{
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    
                    Text(String(format: "%.1f" ,item.rating))
                    
//                    Text("(\(item.user_ratings_total) รีวิว)").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                    Text("·").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                    PriceText(price : item.price_level)
                    Text("·").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                    
                    Text( item.distance < 1000 ?  "\(String(format: "%.0f",item.distance)) ม."  : "\(String(format: "%.1f", item.distance/1000)) กม.")
                    
                }.font(.footnote).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                
                HStack{
//                    Image(systemName: "clock")
                    
                    Text("\(item.open_now == true ? "เปิดอยู่" : "ปิด")").foregroundColor(item.open_now == true ? Color(red: 0.421, green: 0.754, blue: 0.514) : Color(.red)).bold()
                    
                    Text(" เวลาเปิด \(item.opening_time)")
                    
                }.font(.footnote).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                
//                OptionIcon(option : item.option)
                
            }
        } .frame(width: singleWidth * 0.9, height: 136, alignment: .leading) .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.855, green: 0.855, blue: 0.855, opacity: 0.5), lineWidth: 0.5))
        .navigationBarHidden(true)
        
    }
    
    
}
