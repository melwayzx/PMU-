//
//  FavouriteView.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("ร้านอาหารที่ถูกใจ").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.bold).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).padding()
                ScrollView(showsIndicators: false) {
                        RestaurantList()
                }
            }.navigationBarHidden(true)
                
            }
        }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
