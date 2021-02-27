//
//  RestaurantList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct RestaurantList: View {
    
    //    let restaurant = Restaurants.all()
    
    let place_id = PlaceID.getPlaceID()
    
    var body: some View {
        VStack(spacing: 10){
            //
            ForEach(self.place_id , id: \.place_id){item in
                RestaurantItem(place_id : item.place_id)
            }
            
            
            
            //            ForEach(self.restaurant, id: \.name){item in
            //                NavigationLink(
            //                    destination: RestaurantDetail(restaurant: item)){
            //                    RestaurantItem(item: item)
            //
            //                }
            //            }
            Spacer()
                .frame(height: 20)
            
            
        }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
    }
}
