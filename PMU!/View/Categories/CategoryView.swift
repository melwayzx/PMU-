//
//  CategoryView.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    let singleWidth:CGFloat = UIScreen.main.bounds.width
    
    
    var type_name : Types
    let count = Types.all().count
    
    var body: some View {
        
        VStack
        {
            ScrollView{
               
                    
                    ZStack{
                        Image(type_name.image).resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.top)
                        Rectangle().fill(Color(red: 0, green: 0, blue: 0, opacity: 0.60))
                        Text(type_name.name).font(.custom("Sukhumvit Set", size: 36 )).bold().foregroundColor(.white)
                    } .frame(width: singleWidth, height: 213)
                    .clipped()
                VStack(alignment:.leading){
                    Text("พบผลลัพธ์ \(count) รายการ").bold()
//                    RestaurantList()
                }
                        
                        
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: Button(action : {
                            self.mode.wrappedValue.dismiss()
                        }){
                            HStack {
                                Image(systemName: "chevron.left")
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
//                                Text("หน้าหลัก").font(.custom("Sukhumvit Set", size: 16)).fontWeight(.semibold).foregroundColor(Color(.white))
                            }
                        })
                    
                    
                }.font(.custom("Sukhumvit Set", size: 14 )).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
                
                //        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                //
                //            if(value.startLocation.x < 100 && value.translation.width > 100) {
                //                self.mode.wrappedValue.dismiss()
                //            }
                //
                //        }))
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(type_name: Types.all()[0])
    }
}
