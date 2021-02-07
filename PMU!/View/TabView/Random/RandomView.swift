//
//  RandomView.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI

struct RandomView: View {
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        NavigationView{
            
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
                
               
                    NavigationLink(
                        destination: RandomResult(),
                        label: {
                    ZStack{
                        Circle().frame(width:136,height:136).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                        VStack{
                            Image("fastfoodicn_white")
                            Text("แตะเพื่อสุ่ม").font(.custom("Sukhumvit Set", size: 18 )).bold().foregroundColor(.white)
                        }
                        
                    } .padding()
                    
                }
                )
                
               
            }
            
        }
    }
}



struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}

