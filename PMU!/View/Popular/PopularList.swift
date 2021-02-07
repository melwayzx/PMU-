//
//  PopularList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct PopularList: View {
    let restaurant = Restaurants.all()

    var body: some View {
        
        VStack(alignment: .leading)  {
            Text("ร้านอาหารยอดนิยม").font(.custom("Sukhumvit Set",size: 18, relativeTo: .headline)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).bold().padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(self.restaurant, id: \.name){item in
                        PopularItem(item : item)
                    }
                }
            }
        }
    }
}


struct PopularList_Previews: PreviewProvider {
    static var previews: some View {
        PopularList()
    }
}
