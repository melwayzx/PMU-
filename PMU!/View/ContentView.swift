//
//  ContentView.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI


struct ContentView: View {
    @State private var selection: Int = 0
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    
    var body: some View {
        NavigationView{
            TabView(selection: $selection) {
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("หน้าหลัก")
                    }
                    .tag(0)
                
                GoogleMapView()
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("ร้านใกล้ฉัน")
                    }
                    .tag(1)
                
                RandomView()
                    .tabItem {
                        Image("fastfoodicn").renderingMode(.template)
                        Text("สุ่มร้านอาหาร")
                    }
                    .tag(2)
                
                FavouriteView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("ร้านที่ถูกใจ")
                        
                    }
                    .tag(3)
            } .accentColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1.00))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

