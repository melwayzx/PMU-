//
//  SelectCategoryView.swift
//  PMU!
//
//  Created by Melwayz's  on 29/3/21.
//

import SwiftUI

struct SelectCategoryView: View {
    @Binding var didSelectCategory : [Int]
    var categories = Categories.all()
    let layout = Array(repeating: GridItem(.adaptive(minimum:160)), count: 2)
    
    var body: some View {
        VStack(alignment : .leading){
            HStack(alignment : .bottom){
                Text("ประเภทร้านอาหาร").fontWeight(.semibold).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).font(.body)
                Text("(เลือกได้มากกว่า 1 ประเภท)").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745)).font(.subheadline)
            }
            
            
            LazyVGrid(columns: layout, spacing: 10){
                ForEach(self.categories, id: \.name){item in
                    
                    Button(action: {
                        if(didSelectCategory.contains(item.id)){
                            let index = didSelectCategory.firstIndex(of : item.id )
                            self.didSelectCategory.remove(at:  index ?? 0)
                        }else{
                            self.didSelectCategory.append(item.id)
                        }
                        
                    }){
                        SelectCategoryItem(item: item , didSelect : didSelectCategory)
                        
                        
                    }
                }
            }
        }
    }
}
