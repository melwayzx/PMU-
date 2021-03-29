//
//  SelectOptionView.swift
//  PMU!
//
//  Created by Melwayz's  on 29/3/21.
//

import SwiftUI

struct OptionChoice : Identifiable{
    let id : Int
    let title : String
    let logo : String
}

struct SelectOptionView: View {
    
    @Binding var didSelectOption : [String]
    let optionChoice : [OptionChoice] = [OptionChoice(id: 0, title: "ที่จอดรถ", logo :  "p.circle"),OptionChoice(id: 1, title : "บริการจัดส่ง", logo : "logo-lineman"),OptionChoice(id: 2, title: "คนละครึ่ง", logo :"logo-KLK"),OptionChoice(id: 3, title: "เราชนะ", logo: "logo-wewin"),OptionChoice(id: 4, title: "เรารักกัน", logo: "logo-welove")]
    
    var body: some View {
        VStack(alignment : .leading){
            Text("ตัวกรองเพิ่มเติม").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
            
            ForEach(self.optionChoice, id: \.id){item in
                
                Button(action: {
                    
                    if(didSelectOption.contains(item.title)){
                        let index = didSelectOption.firstIndex(of : item.title )
                        self.didSelectOption.remove(at:  index ?? 0)
                    }else{
                        self.didSelectOption.append(item.title)
                    }
                    
                }){
                    SelectOptionItem(item: item, didSelect: didSelectOption)
                }
                
            }
        }
    }
}
