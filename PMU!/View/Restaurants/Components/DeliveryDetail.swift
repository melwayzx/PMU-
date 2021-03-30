//
//  DeliveryDetail.swift
//  PMU!
//
//  Created by Melwayz's  on 31/3/21.
//

import SwiftUI

struct DeliveryDetail: View {
    
    var option : [String]
    var body: some View {
        
        VStack(alignment: .leading){
            Text("บริการจัดส่งอาหาร").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
            
            if(option[1] != ""){
                HStack{
                    Image("logo-grab").resizable().frame(width: 30 , height: 30).aspectRatio(1, contentMode: .fit)
                    Text("Grab Food")
                }
            }
            
            if(option[2] != ""){
                HStack{
                    Image("logo-lineman").resizable().frame(width: 30 , height: 30).aspectRatio(1, contentMode: .fit)
                    Text("LINE MAN")
                }
            }
            
            if(option[1] == "" && option[2] == ""){
                Text("-")
            }
        }
    }
}
