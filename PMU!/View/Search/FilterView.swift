//
//  FilterView.swift
//  PMU!
//
//  Created by Melwayz's  on 21/3/21.
//

import SwiftUI

struct PriceChoices : Identifiable {
    let id : Int
    let title : String
    let subtitle : String
}

struct FilterView : View {
    
    @Binding var didSelectCategory : [Int]
    @Binding var didSelectPrice : String
    @Binding var didSelectDistance : Double
    @Binding var clickedSearch : Bool
    var categories = Categories.all()
    let layout = Array(repeating: GridItem(.adaptive(minimum:160)), count: 2)
    let layout2 = Array(repeating: GridItem(.adaptive(minimum:60)), count: 5)
    @Environment(\.presentationMode) var presentationMode
    let screenWidth = UIScreen.main.bounds.width
    
    
    let priceChoices : [PriceChoices] = [PriceChoices(id: 0, title: "฿", subtitle : "< 100" ),PriceChoices(id: 1, title: "฿฿", subtitle : "101-250"),PriceChoices(id: 2, title: "฿฿฿", subtitle : "251-500"),PriceChoices(id: 3, title: "฿฿฿฿", subtitle : "501-1000"),PriceChoices(id: 4, title: "฿฿฿฿฿", subtitle : " > 1,000"),]
   

    var body: some View {
        VStack{
            
            HStack{
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                    if(!clickedSearch){
                        self.didSelectCategory.removeAll()
                        self.didSelectPrice = ""
                        self.didSelectDistance = 0
                    }
                }){
                    Text("กลับ").fontWeight(.semibold).padding(.leading,20)
                    
                }
                
                Spacer()
                Text("การค้นหาขั้นสูง").bold()
                Spacer()
                Button(action:{
                    self.didSelectCategory.removeAll()
                    self.didSelectPrice = ""
                    self.didSelectDistance = 0
                }){
                    Text("รีเซ็ท").fontWeight(.semibold).padding(.trailing,20)
                }
                
                
            }.font(.custom("Sukhumvit Set", size: 18)).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
            .frame(height: 40)
            .background(Color.white.edgesIgnoringSafeArea(.top))
            
            
            VStack{
                ScrollView{
                    VStack(alignment : .leading){
                        Text("ประเภทร้านอาหาร").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                        
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
                                    SelectCategoryButton(item: item , didSelect : didSelectCategory)
                                    
                                    
                                }
                            }
                        }
                        
                        Text("ช่วงราคา").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                        
                        
                        LazyVGrid(columns: layout2, spacing: 10){
                            ForEach(self.priceChoices, id: \.title){item in
                                
                                Button(action: {
                                    self.didSelectPrice = item.title
                                }){
                                    SelectPrice(item: item , didSelect : didSelectPrice)
                                    
                                    
                                }
                            }
                        }
                        
                        
                        Text("ระยะทาง").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                        
                        VStack(){
                            if(didSelectDistance > 0){
                                HStack{
                                    Text( "ระยะทางไม่เกิน ").foregroundColor(Color.gray)
                                    Text(didSelectDistance < 1000 ? "\(String(format: "%.0f", didSelectDistance))  เมตร " :  "\(String(format: "%.0f", didSelectDistance/1000))  กิโลเมตร" ).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).fontWeight(.semibold)
                                }.font(.custom("Sukhumvit Set", size: 16))
                            }
                            
                            Slider(value: $didSelectDistance , in : 0...5000 , step : 50)
                        }.frame(width: screenWidth - 40, alignment: .center)
                        
                        
                        Text("ตัวกรองเพิ่มเติม").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                        
                    }.padding()
                }
                
                
                Group{
                    HStack(alignment: .center){
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            self.clickedSearch = true
                        }){
                            Text("ค้นหา")
                                .fontWeight(.bold)
                                .font(.custom("Sukhumvit Set", size: 14))
                                .fontWeight(.semibold)
                                .frame(width: 180, height: 40, alignment: .center)
                                .background(Color(red: 0.00, green: 0.13, blue: 0.25))
                                .cornerRadius(40)
                                .foregroundColor( Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.00, green: 0.13, blue: 0.25), lineWidth: 1  )
                                )
                        }
                    }.padding()
                }
            }.background(Color(red: 0.98, green: 0.98, blue: 0.98).edgesIgnoringSafeArea(.bottom))
        }
    }
}
