//
//  LinkComponentView.swift
//  PMU!
//
//  Created by Melwayz's  on 30/3/21.
//

import SwiftUI

struct LinkComponentView : View {
    var restaurant : Restaurant
    
    var body: some View{
        HStack{
            Spacer()
            Button(action:{
                let dash = CharacterSet(charactersIn: "-")
                
                let cleanString =
                    restaurant.formatted_phone_number.trimmingCharacters(in: dash)
                
                let tel = "tel://"
                let formattedString = tel + cleanString
                let url: NSURL = URL(string: formattedString)! as NSURL
                
                UIApplication.shared.open(url as URL)
            } , label: {
                
                VStack{
                    ZStack{
                        Circle().fill(Color.white).frame(width: 40 , height: 40).overlay(
                            Circle()
                                .stroke(Color(red: 0.00, green: 0.13, blue: 0.25), lineWidth: 1  )
                        )
                        Image(systemName: "phone.fill").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).font(.body)
                    }
                    Text("ติดต่อร้าน").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1)).font(.custom("Sukhumvit Set", size: 14))
                }
                
            })
            Spacer()
            Divider()
            Spacer()
            Button(action: {
                if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
                    let url = URL(string: "comgooglemaps-x-callback://?ssdr=&daddr=\(restaurant.lat),\(restaurant.lng)&directionsmode=driving")!
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
                else{
                    let urlWithoutGoogleMap = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(restaurant.lat),\(restaurant.lng)&directionsmode=driving")!
                    UIApplication.shared.open(urlWithoutGoogleMap)
                }
            }){
                VStack{
                    ZStack{
                        Circle().fill(Color.white).frame(width: 40 , height: 40).overlay(
                            Circle()
                                .stroke(Color(red: 0.00, green: 0.13, blue: 0.25), lineWidth: 1  )
                        )
                        Image(systemName: "car.fill").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).font(.body)
                    }
                    Text("นำทางไปร้านอาหาร").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1)).font(.custom("Sukhumvit Set", size: 14))
                }
            }
            Spacer()
        }
        
    }
}
