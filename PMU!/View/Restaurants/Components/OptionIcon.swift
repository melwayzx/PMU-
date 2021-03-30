//
//  OptionIcon.swift
//  PMU!
//
//  Created by Melwayz's  on 30/3/21.
//

import SwiftUI

struct OptionIcon: View {
    
    var option : [String]
    
    var body: some View {
        HStack(spacing : 5){
            if(option[1] != ""){
                Image("logo-grab").resizable().frame(width: 20 , height: 20).aspectRatio(1, contentMode: .fit)

            }
            
            if(option[2] != ""){
                Image("logo-lineman").resizable().frame(width: 20 , height: 20).aspectRatio(1, contentMode: .fit)

            }
            
            if(option[3] != ""){
                Image("logo-wewin").resizable().frame(width: 20 , height: 20).aspectRatio(1, contentMode: .fit)

            }
            
            if(option[4] != ""){
                Image("logo-welove").resizable().frame(width: 20 , height: 20).aspectRatio(1, contentMode: .fit)
            }
        }
    }
}
