//
//  RandomResult.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI

struct RandomResult: View {
    var randomItem : Restaurant
    
    var body: some View {

        VStack{
            VStack(alignment: .leading){
                Image("item.image").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 330,height: 150).clipped()

                HStack(alignment: .firstTextBaseline){
                    VStack(alignment: .leading){
                        Text(randomItem.name).fontWeight(.bold).font(.custom("Sukhumvit Set", size: 18)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))

                        HStack{
                            Image(systemName: "star.fill").foregroundColor(.yellow)

                            Text(String(format: "%.1f" ,randomItem.rating)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))

                            Text("\(randomItem.user_ratings_total) รีวิว").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                            
                            Text("·").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                            PriceText(price : randomItem.price_level)
                            Text("·").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                            
                            Text( randomItem.distance < 1000 ?  "\(String(format: "%.0f",randomItem.distance)) ม."  : "\(String(format: "%.1f", randomItem.distance/1000)) กม.")
                            

                        }.font(.custom("Sukhumvit Set", size: 12))
                        HStack{
                            Image(systemName: "clock")

                            Text("\(randomItem.open_now == true ? "เปิดอยู่" : "ปิด")").foregroundColor(randomItem.open_now == true ? Color(red: 0.421, green: 0.754, blue: 0.514) : Color(.red)).bold()

                            Text(randomItem.opening_time)

                        }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))

                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text(randomItem.formatted_address)
                             }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                        HStack{
                            Image(systemName: "phone.fill")

                            Text(randomItem.formatted_phone_number)

                        }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                    }.padding()
                }
            }
            .frame(width: 330, height: 300, alignment: .leading) .cornerRadius(18)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.855, green: 0.855, blue: 0.855, opacity: 0.5), lineWidth: 0.5))
            .padding()
        }
    }
}


