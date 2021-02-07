//
//  RestaurantList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct RestaurantList: View {

    let restaurant = Restaurants.all()

    var body: some View {
        VStack(spacing: 10){
            
            ForEach(self.restaurant, id: \.name){item in
                NavigationLink(
                    destination: RestaurantDetail(restaurant: item)){
                    RestaurantItem(item: item)
                }
            }
    }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
    }
}
