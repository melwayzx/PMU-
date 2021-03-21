//
//  PopularList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct PopularList: View {
    //    let restaurant = Restaurants.all()
    
    var listSorted :[Restaurant]
    
    
    init(restaurantList : [Restaurant]) {
        self.listSorted = restaurantList.sorted {
            $0.user_ratings_total > $1.user_ratings_total
        }
        
    }
    
    var body: some View {
        
        VStack(alignment: .leading)  {
            Text("ร้านอาหารยอดนิยม").font(.custom("Sukhumvit Set",size: 18, relativeTo: .headline)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).bold().padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(listSorted.indices , id: \.self){item in
                        if( item < 10){
                            NavigationLink(
                                destination: RestaurantDetail(restaurant: listSorted[item])
                            ){
                                
                                
                                PopularItem(item : listSorted[item])
                                
                            }
                        }
                        
                    }
                }
                
            }
            
            
        }
        
    }
}



//struct PopularList_Previews: PreviewProvider {
//    static var previews: some View {
//        PopularList()
//    }
//}
