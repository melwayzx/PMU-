//
//  PriceText.swift
//  PMU!
//
//  Created by Melwayz's  on 30/3/21.
//

import SwiftUI

struct PriceText: View {
    
    var price : String
    
    var body: some View {
        
        if(price == "฿"){
            Text("< 100 บาท")
        }
        if(price == "฿฿"){
            Text("101-250 บาท")
        }
        if(price == "฿฿฿"){
            Text("251-500 บาท")
        }
        if(price == "฿฿฿฿"){
            Text("501-1000 บาท")
        }
        if(price == "฿฿฿฿฿"){
            Text("> 1000 บาท")
        }
    }
}

