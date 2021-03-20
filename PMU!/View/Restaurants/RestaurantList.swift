//
//  RestaurantList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct RestaurantList: View {
    
    var listSorted :[Restaurant]
    
    init(restaurantList : [Restaurant] ) {
        self.listSorted = restaurantList.sorted {
            $0.distance < $1.distance
        }
    }
    
    var body: some View {
        VStack(spacing: 10){
            
            ForEach(listSorted){item in
                NavigationLink(
                    destination: RestaurantDetail(restaurant: item)
                ){
                    RestaurantItem(item : item)
                }
            }
            
            Spacer()
                .frame(height: 20)
        }
    }
}
