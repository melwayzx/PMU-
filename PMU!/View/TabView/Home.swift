//
//  Home.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI

struct Home: View {
    @State var name: String = ""
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("PICK MEAL UP")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).padding()
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("โปรดกรอกชื่อร้านอาหาร", text: $name)
                            .padding(.leading, 2.0)
                            .font(.custom("Sukhumvit Set", size: 14 ))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 304, height: 36, alignment: .center)
                    }.padding(.bottom, 10)
                }
                ScrollView(showsIndicators: false) {
                    VStack{
                        CategoryList().padding(20)
                        PopularList().padding(.leading,20)
                        VStack(alignment: .leading){
                            Text("ร้านอาหารใกล้คุณ").font(.custom("Sukhumvit Set",size: 18, relativeTo: .headline)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).bold().padding(.top, 5)
                            RestaurantList()
                            
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}
