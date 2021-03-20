//
//  SearchResult.swift
//  PMU!
//
//  Created by Melwayz's  on 18/3/21.
//

import SwiftUI

struct SearchResult: View {
    
    @State var listSorted :[Restaurant] = []
    var restaurantList : [Restaurant]
    @Binding var selectedCategory : [Int]
    @State var didSelectSort : Int  = 0
    let filterAll : [Filter] = [Filter(id : 0 , title : "ระยะทางใกล้ฉันที่สุด"),Filter(id : 1 , title : "ราคาต่ำสุด"),Filter(id : 2 , title : "ราคาสูงสุด"),Filter(id : 3 , title : "คะแนนรีวิว"), ]
    
    var body: some View {
        VStack(alignment: .leading ,  spacing: 10){
            
            HStack{
                Text("เรียงผลการค้นหา :").foregroundColor(.gray)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 5) {
                        ForEach(filterAll){item in
                            
                            Button(action: {
                                self.didSelectSort = item.id
//                                print(didSelectSort)
                            }){
                                Text(item.title)
                                    .frame(height: 30)
                                    .padding(.leading,10)
                                    .padding(.trailing, 10)
                                    .background(didSelectSort == item.id ? Color(red: 0.00, green: 0.13, blue: 0.25) : Color.white)
                                    .cornerRadius(40)
                                    .foregroundColor(didSelectSort == item.id ? Color.white : Color(red: 0.682, green: 0.702, blue: 0.745) )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(didSelectSort == item.id ?  Color(red: 0.00, green: 0.13, blue: 0.25) : Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 0.22) , lineWidth: 1  )
                                    )
                            }
                        }
                        
                        
                    }
                    
                }
            }.padding(.leading,20).padding(.top,10)
            
            
            if(listSorted.count != 0){
                Text("พบผลลัพธ์ทั้งหมด \(listSorted.count) รายการ").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).bold().padding(.leading,20)
            }
            ScrollView(showsIndicators: false) {
                ForEach(listSorted){item in
                    NavigationLink(
                        destination: RestaurantDetail(restaurant: item)
                    ){
                        RestaurantItem(item : item)
                    }
                }
                
            }
            .padding()
        }.onAppear(perform: filterResult )
        .onChange(of:didSelectSort , perform: {value in
            switch value {
            case 0:
                self.listSorted = listSorted.sorted {
                    $0.distance < $1.distance
                }
            case 1:
                self.listSorted = listSorted.sorted {
                    $0.price_level < $1.price_level
                }
            case 2:
                self.listSorted = listSorted.sorted {
                    $0.price_level > $1.price_level
                }
            case 3:
                self.listSorted = listSorted.sorted {
                    $0.user_ratings_total > $1.user_ratings_total
                }
            default:
                self.listSorted = listSorted.sorted {
                    $0.distance < $1.distance
                }
            }
        }
        )
    }
    
    func filterResult(){
            self.listSorted = restaurantList.filter { (restaurant) -> Bool in
                if (restaurant.category.count > 2 ){
                    return  selectedCategory.contains(restaurant.category[0]) || selectedCategory.contains(restaurant.category[1])
                }
                return selectedCategory.contains(restaurant.category[0])
            }
        
        self.listSorted = listSorted.sorted {
            $0.distance < $1.distance
        }
    }
}
    
