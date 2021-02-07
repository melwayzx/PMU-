//
//  RandomResult.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI

struct RandomResult: View {
    let restaurant = Restaurants.all()
    @State private var item = Restaurants.all().randomElement()
    
    
    var body: some View {
        VStack{
            Text("สุ่มร้านอาหาร")
                .font(.custom("Sukhumvit Set", size: 30 )).bold().foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
            
            Button(action: {
                print("ตั้งค่าการสุ่ม")
            }) {
                Text("ตั้งค่าการสุ่ม")
                    .font(.custom("Sukhumvit Set", size: 14 )).bold().foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                    .padding()
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(red: 0.855, green: 0.855, blue: 0.855), lineWidth: 1)
                    )
            }
            
            VStack(alignment: .leading){
                Image(item!.image[0]).resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 330,height: 150).clipped()
                
                HStack(alignment: .firstTextBaseline){
                    VStack(alignment: .leading){
                        Text(item!.name).fontWeight(.bold).font(.custom("Sukhumvit Set", size: 18)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
                        
                        HStack{
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                            Text(String(format: "%.1f" ,item!.star_score)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                            
                            Text("\(item!.review_score) รีวิว").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1))
                            
                        }.font(.custom("Sukhumvit Set", size: 12))
                        
//                        ZStack{
//                            Rectangle().cornerRadius(18).frame(height: 23, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color(.white))
//                        }
                        HStack{
                            Image(systemName: "clock")
                            
                            Text("\(item!.status == true ? "เปิดอยู่" : "ปิด")").foregroundColor(item!.status == true ? Color(red: 0.421, green: 0.754, blue: 0.514) : Color(.red)).bold()
                            
                            Text(item!.opening_time)
                            
                        }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                        
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text(item!.address)
                             }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                        HStack{
                            Image(systemName: "phone.fill")
                            
                            Text(item!.contact)
                            
                        }.font(.custom("Sukhumvit Set", size: 12)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1))
                        
                        
                    }.padding()
                    
                    
                }
                
            }
            .frame(width: 330, height: 300, alignment: .leading) .cornerRadius(18)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.855, green: 0.855, blue: 0.855, opacity: 0.5), lineWidth: 0.5))
            .padding()
            
            VStack{
            Button(action: {
                self.item = Restaurants.all().randomElement()
            }) {
                ZStack{
                    Circle().frame(width:70,height:70).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                    VStack{
                        Image("fastfoodicn_white").resizable().frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
                    }
                    
                }
                
            }
                Text("แตะเพื่อสุ่มอีกครั้ง").font(.custom("Sukhumvit Set", size: 18 )).bold().foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
            }
                
            
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

struct RandomResult_Previews: PreviewProvider {
    static var previews: some View {
        RandomResult()
    }
}
