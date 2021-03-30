//
//  SearchView.swift
//  PMU!
//
//  Created by Melwayz's  on 1/3/21.
//

import SwiftUI

struct Filter : Identifiable {
    let id : Int
    let title : String
}

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var searchInput: String = ""
    @State var didSelectCategory : [Int] = []
    @State var didSelectPrice : [String] = []
    @State var didSelectDistance : Double = 0
    @State var didSelectOption : [String] = ["","","","",""]
    @State var didSelectOpenNow : Bool = false
    @State var clickedSearch : Bool = false
    @State var result :[Restaurant] = []
    @State var commitSearch : Bool = false
    var restaurantList : [Restaurant]
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack{
                Group{
                    HStack{
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.left").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).font(.body).padding(.trailing)
                        }
                        TextField("โปรดกรอกชื่อร้านอาหาร ...", text: $searchInput ,onCommit : { self.commitSearch = true })
                            
                            .frame(width : screenWidth * 2 / 3 , height: 40)
                            .padding(.leading,20)
                            .background(Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 0.22) )
                            .cornerRadius(40)
                            .foregroundColor(searchInput == "" ? Color(red: 0.682, green: 0.702, blue: 0.745) : Color(red: 0.00, green: 0.13, blue: 0.25))
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 0.22), lineWidth: 2  )
                            )
                            .onTapGesture {
                                self.clickedSearch = false
                                self.commitSearch = false
                            }
                        
                        
                        
                        
                        NavigationLink(
                            destination: FilterView(Title : "การค้นหาขั้นสูง" , buttonTitle : "ค้นหา", didSelectCategory : $didSelectCategory , didSelectPrice : $didSelectPrice , didSelectDistance : $didSelectDistance , didSelectOption: $didSelectOption , didSelectOpenNow: $didSelectOpenNow, clickedSearch : $clickedSearch)
                        ){
                            Image(systemName: "slider.vertical.3").frame(width: screenWidth / 10 , height: screenWidth / 10) .cornerRadius(screenWidth / 20).font(.body).foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25))
                                .overlay(RoundedRectangle(cornerRadius: screenWidth / 20)
                                            .stroke(Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 0.22), lineWidth: 2))
                        }
                    }.padding(.leading)
                    .padding(.trailing)
                    .padding(.top)
                    
                }
                
                if(clickedSearch || (searchInput != "" && commitSearch)){
                    SearchResult(text : $searchInput , result: $result , restaurantList: restaurantList , selectedCategory : $didSelectCategory, selectedPrice : $didSelectPrice , selectDistance : $didSelectDistance ,selectOption: $didSelectOption , selectOpenNow : $didSelectOpenNow)
                }
            }
        }
        .font(.subheadline)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
    
}


