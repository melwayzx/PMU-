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
    
    var body: some View {
        HStack{
            if(item.id == 0 ){
                Image(systemName: item.logo)
                    .resizable()
                    .frame(width: 26, height: 26)
                    .aspectRatio(1, contentMode: .fill)
                    .foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
            }else{
                Image(item.logo)
                    .resizable()
                    .frame(width: 26, height: 26)
                    .aspectRatio(1, contentMode: .fill)
            }
            Text(item.title).font(.callout).foregroundColor(didSelect.contains(item.title) ? Color(red: 0.00, green: 0.13, blue: 0.25): Color.gray  )
            Spacer()
            if(didSelect.contains(item.title)){
            Image(systemName : "checkmark").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
            }
        }
    }
}
