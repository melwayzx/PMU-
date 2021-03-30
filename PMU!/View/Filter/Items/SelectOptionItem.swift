//
//  SelectOption.swift
//  PMU!
//
//  Created by Melwayz's  on 22/3/21.
//

import SwiftUI

struct SelectOptionItem: View {
    
    var item : OptionChoice
    var didSelect : [String]
    var didSelect2 : Bool
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            HStack{
                
                if(item.title == "เปิดอยู่"){
                    Text(item.title).font(.callout).foregroundColor( didSelect2 ? Color(red: 0.00, green: 0.13, blue: 0.25): Color.gray  )
                    Spacer()
                    if(didSelect2){
                        Image(systemName : "checkmark").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25) )
                    }
                }else{
                    Text(item.title).font(.callout).foregroundColor(didSelect.contains(item.title) ? Color(red: 0.00, green: 0.13, blue: 0.25): Color.gray  )
                    Spacer()
                    if(didSelect.contains(item.title)){
                        Image(systemName : "checkmark").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25) )
                    }
                }
            }.padding(.top,10)
            //            Rectangle().fill(Color(red: 0.682, green: 0.702, blue: 0.745)).frame(width : screenWidth - 40 , height: 1)
        }
    }
}
