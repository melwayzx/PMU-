//
//  ContentView.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    @State var res : result?

        enum Tab {
            case home
            case nearby
            case random
            case fav
        }
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    
    var body: some View {
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("หน้าหลัก")
                }
                .tag(Tab.home)
            
            GoogleMapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("ร้านใกล้ฉัน")
                }
                .tag(Tab.nearby)
            
            RandomView()
                .tabItem {
                    Image("fastfoodicn").renderingMode(.template)
                    Text("สุ่มร้านอาหาร")
                }
                .tag(Tab.random)
            
            FavouriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("ร้านที่ถูกใจ")
                    
                }
                .tag(Tab.fav)
        } .accentColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1.00))
        
        .onAppear(perform:loadData)
    }
    
    private func loadData() {
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJufQFlS6Z4jARChytiAWhVWY&fields=name,rating,review,user_ratings_total,price_level,formatted_phone_number,formatted_address,geometry,opening_hours,photo&language=th&key=AIzaSyB2zZ0AQ4y2zLNXljvnhOA1qLku4HPAfb8")
        else {
            return
        }
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    guard let data = data
                    else {
                        return
                    }
                    if let decodedData = try? JSONDecoder().decode(Response.self, from: data){
//                        print(decodedData)
                        DispatchQueue.main.async {
                            self.res = decodedData.result
//                            print(res!)
                                            }
                    }

                }.resume()

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

