//
//  SearchResult.swift
//  PMU!
//
//  Created by Melwayz's  on 18/3/21.
//

import SwiftUI

struct SearchResult: View {
    @Binding var text : String
    @Binding var result : [Restaurant]
    var restaurantList : [Restaurant]
    @Binding var selectedCategory : [Int]
    @Binding var selectedPrice : [String]
    @Binding var selectDistance : Double
    @Binding var selectOption : [String]
    @Binding var selectOpenNow : Bool
    @State var didSelectSort : Int  = 0
    
    
    let filterAll : [Filter] = [Filter(id : 0 , title : "ระยะทางใกล้ฉันที่สุด"),Filter(id : 1 , title : "ราคาต่ำสุด"),Filter(id : 2 , title : "คะแนนรีวิว"), ]
    
    var body: some View {
        VStack{
            Group{
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
                }.padding(.leading)
            }
            
            
            
            if(result.count != 0){
                ScrollView(showsIndicators: false) {
                    Text("พบผลลัพธ์ทั้งหมด \(result.count) รายการ").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).bold().padding(.leading).frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment : .center){
                        ForEach(result){item in
                            NavigationLink(
                                destination: RestaurantDetail(restaurant: item)
                            ){
                                RestaurantItem(item : item)
                            }
                        }
                    }.padding()
                    
                }
            }else{
                Text("ไม่พบผลลัพธ์").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745)).font(.callout).padding()
            }
            
            
        }.onAppear(perform: filterResult )
        .onChange(of:didSelectSort , perform: {value in
            switch value {
            case 0:
                self.result = result.sorted {
                    $0.distance < $1.distance
                }
            case 1:
                self.result = result.sorted {
                    $0.price_level < $1.price_level
                }
            case 2:
                self.result = result.sorted {
                    $0.rating > $1.rating
                }
            default:
                self.result = result.sorted {
                    $0.distance < $1.distance
                }
            }
        }
        )
    }
    
    func filterResult(){
        if(text != ""){
            self.result =  restaurantList.filter{(restaurant) -> Bool in restaurant.name.contains(text)}
        }else{
            self.result =  restaurantList
        }
        
        if(!selectedCategory.isEmpty){
            self.result = result.filter { (restaurant) -> Bool in
                if (restaurant.category.count > 1 ){
                    return  selectedCategory.contains(restaurant.category[0]) || selectedCategory.contains(restaurant.category[1])
                }
                return selectedCategory.contains(restaurant.category[0])
            }
        }
        
        if(!selectedPrice.isEmpty){
            
            print(selectedPrice)
            self.result = result.filter{ restaurant -> Bool in
                return selectedPrice.contains(restaurant.price_level)
            }
            
        }
        
        if(selectDistance != 0){
            self.result = result.filter{restaurant -> Bool in
                return selectDistance >= restaurant.distance
            }
        }
        
        if(selectOption != ["","","","",""]){
            if(selectOption[0] != ""){
                self.result = result.filter{restaurant -> Bool in return restaurant.option[0]==selectOption[0]}
            }
                  
            if(selectOption[1] != ""){
                self.result = result.filter{restaurant -> Bool in return restaurant.option[1]==selectOption[1]}
            }
            
            if(selectOption[2] != ""){
                self.result = result.filter{restaurant -> Bool in return restaurant.option[2]==selectOption[2]}
            }
            
            if(selectOption[3] != ""){
                self.result = result.filter{restaurant -> Bool in return restaurant.option[3]==selectOption[3]}
            }
            
        }
        
        if(!selectOpenNow){
            self.result = result.filter{restaurant -> Bool in
                return restaurant.open_now == true
            }
        }

        self.result = result.sorted {
            $0.distance < $1.distance
        }
    }
}

