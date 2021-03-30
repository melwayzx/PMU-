//
//  OptionDetail.swift
//  PMU!
//
//  Created by Melwayz's  on 31/3/21.
//

import SwiftUI

struct PromoDetail: View {
    
    var option : [String]
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("โครงการรัฐที่เข้าร่วม").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
            if(option[3] != ""){
                HStack{
                    Image("logo-wewin").resizable().frame(width: 30 , height: 30).aspectRatio(1, contentMode: .fit)
                    Text("เราชนะ")
                }
            }
            
            if(option[4] != ""){
                HStack{
                    Image("logo-welove").resizable().frame(width: 30 , height: 30).aspectRatio(1, contentMode: .fit)
                    Text("เรารักกัน")
                }
            }
            
            if(option[3] == "" && option[4] == ""){
                Text("-")
            }
        }
    }
}
