//
//  CategoryList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct CategoryList: View {
    let type = Types.all()
    let layout = Array(repeating: GridItem(.adaptive(minimum:60)), count: 4)
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            Text("ประเภทร้านอาหาร").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
            
            
            
            LazyVGrid(columns: layout, spacing: 10){
                ForEach(self.type, id: \.name){item in
                    NavigationLink(destination: CategoryView(type_name: item)){
                        CategoryItem(item : item)
                    }
                }
            }
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
