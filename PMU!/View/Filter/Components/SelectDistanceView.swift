//
//  SelectDistanceView.swift
//  PMU!
//
//  Created by Melwayz's  on 29/3/21.
//

import SwiftUI

struct SelectDistanceView: View {
    
    @Binding var didSelectDistance : Double
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment : .leading){
            Text("ระยะทาง").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
            
            VStack(){
                if(didSelectDistance > 0){
                    HStack{
                        Text( "ระยะทางไม่เกิน ").foregroundColor(Color.gray)
                        Text(didSelectDistance < 1000 ? "\(String(format: "%.0f", didSelectDistance))  เมตร " :  "\(String(format: "%.1f", didSelectDistance/1000)) กิโลเมตร" ).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).fontWeight(.semibold)
                    }.font(.custom("Sukhumvit Set", size: 16))
                }
                
                Slider(value: $didSelectDistance , in : 0...5000 , step : 50).accentColor(Color(red: 0.00, green: 0.13, blue: 0.25))
            }.frame(width: screenWidth - 40, alignment: .center)
        }
    }
}

