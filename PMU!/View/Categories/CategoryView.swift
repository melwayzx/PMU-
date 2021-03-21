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
    var category : Categories
    var resultList : [Restaurant]
    
    init(restaurantList: [Restaurant] , category : Categories) {
        self.resultList = restaurantList.filter{ (restaurant) -> Bool in return restaurant.category.contains(category.id) }
        
        self.category = category
    }
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false ){
                ZStack{
                    Image(category.image).resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.top)
                    Rectangle().fill(Color(red: 0, green: 0, blue: 0, opacity: 0.60))
                    VStack{
                        Button(action: {
                            self.mode.wrappedValue.dismiss()
                        }){
                            ZStack{
                                Circle().fill(Color(red: 0.855, green: 0.855, blue: 0.855, opacity: 1)).frame(width: 30 , height: 30)
                                Image(systemName: "chevron.left").foregroundColor(Color.white).font(.body)
                            }
                        }.padding().padding(.top,40)
                        
                    }.frame(width: singleWidth, height: 213 , alignment: .topLeading)
                    
                    Text(category.name).font(.custom("Sukhumvit Set", size: 36 )).bold().foregroundColor(.white)
                    
                    
                } .frame(width: singleWidth, height: 213)
                .clipped()
                VStack(alignment:.leading){
                    Text("พบผลลัพธ์ \(resultList.count) รายการ").bold()
                    RestaurantList(restaurantList: resultList)
                }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}
