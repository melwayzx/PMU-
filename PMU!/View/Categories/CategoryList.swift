//
//  CategoryList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct CategoryList: View {
    let type = Categories.all()
    let layout = Array(repeating: GridItem(.adaptive(minimum:60)), count: 4)
    var restaurantList: [Restaurant]
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            Text("ประเภทร้านอาหาร").font(.custom("Sukhumvit Set",size: 18, relativeTo: .headline)).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).bold()
            
            
            
            LazyVGrid(columns: layout, spacing: 10){
                ForEach(self.type, id: \.name){item in
                    NavigationLink(destination: CategoryView(restaurantList: restaurantList, category: item)){
                        CategoryItem(item : item)
                    }
                }
            }
        }
    }
}

//struct CategoryList_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryList()
//    }
//}

