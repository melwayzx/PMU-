//
//  CategoryView.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI


struct CategoryView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    let singleWidth:CGFloat = UIScreen.main.bounds.width
//    var restaurantList: [Restaurant]
//
    var category : Categories
    var resultList : [Restaurant]
    
    init(restaurantList: [Restaurant] , category : Categories) {
        self.resultList = restaurantList.filter{ (restaurant) -> Bool in return restaurant.category.contains(category.id) }
        
        self.category = category
    }
    
    
    var body: some View {
        
        VStack
        {
            ScrollView{
               
                    
                    ZStack{
                        Image(category.image).resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.top)
                        Rectangle().fill(Color(red: 0, green: 0, blue: 0, opacity: 0.60))
                        Text(category.name).font(.custom("Sukhumvit Set", size: 36 )).bold().foregroundColor(.white)
                    } .frame(width: singleWidth, height: 213)
                    .clipped()
                VStack(alignment:.leading){
                    Text("พบผลลัพธ์ \(resultList.count) รายการ").bold()
                    RestaurantList(restaurantList: resultList)
                }
                        
                        
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action : {
                            self.mode.wrappedValue.dismiss()
                        }){
                            HStack {
                                Image(systemName: "chevron.left")
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                            }
                        })
                    
                    
                }.font(.custom("Sukhumvit Set", size: 14 )).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
            
        }.edgesIgnoringSafeArea(.top)
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(type_name: Categories.all()[0])
//    }
//}
