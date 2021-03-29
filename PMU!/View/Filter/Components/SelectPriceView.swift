//
//  SelectPriceView.swift
//  PMU!
//
//  Created by Melwayz's  on 29/3/21.
//

import SwiftUI
struct PriceChoices : Identifiable {
    let id : Int
    let title : String
    let subtitle : String
}

struct SelectPriceView: View {
    
    @Binding var didSelectPrice : [String]
    let priceChoices : [PriceChoices] = [PriceChoices(id: 0, title: "฿", subtitle : "< 100" ),PriceChoices(id: 1, title: "฿฿", subtitle : "101-250"),PriceChoices(id: 2, title: "฿฿฿", subtitle : "251-500"),PriceChoices(id: 3, title: "฿฿฿฿", subtitle : "501-1000"),PriceChoices(id: 4, title: "฿฿฿฿฿", subtitle : " > 1,000"),]
    
    var body: some View {
        VStack(alignment : .leading){
            HStack(alignment : .bottom){
            Text("ช่วงราคา").fontWeight(.semibold).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).font(.body)
                Text("(เลือกได้มากกว่า 1 ช่วง)").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745)).font(.subheadline)
            }
            
            HStack{
                ForEach(self.priceChoices, id: \.title){item in
                    
                    Button(action: {
                        if(didSelectPrice.contains(item.subtitle)){
                            let index = didSelectPrice.firstIndex(of : item.subtitle )
                            self.didSelectPrice.remove(at:  index ?? 0)
                        }else{
                            self.didSelectPrice.append(item.subtitle)
                        }
                        
                    }){
                        SelectPriceItem(item: item , didSelect : didSelectPrice)
                        
                        
                    }
                }
            }.padding(.top,10).padding(.bottom,10)
        }
    }
}
