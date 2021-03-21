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
    @State  var didSelectPrice : String = ""
    @State var didSelectDistance : Double = 0
    @State var clickedSearch : Bool = false
    @State var listSorted :[Restaurant] = []
    var restaurantList : [Restaurant]
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    
    var body: some View {
        VStack{
            
            Group{
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left").foregroundColor(Color(red: 0.00, green: 0.13, blue: 0.25)).font(.body)
                    }
                    TextField("      โปรดกรอกชื่อร้านอาหาร ...", text: $searchInput)
                        
                        .frame(width : 300 , height: 40)
                        .background(Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 0.22) )
                        .cornerRadius(40)
                        .foregroundColor(searchInput == "" ? Color(red: 0.682, green: 0.702, blue: 0.745) : Color(red: 0.00, green: 0.13, blue: 0.25))
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 0.22), lineWidth: 2  )
                        )
                        .onTapGesture {
                            self.clickedSearch = false
                        }
                    
                    
                    
                    
                    NavigationLink(
                        destination: FilterView(didSelectCategory : $didSelectCategory , didSelectPrice : $didSelectPrice , didSelectDistance : $didSelectDistance , clickedSearch : $clickedSearch)
                    ){
                        Image("sliders").frame(width: 50, height: 40) .cornerRadius(40)
                            .overlay(RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.898, green: 0.898, blue: 0.898, opacity: 0.22), lineWidth: 2))
                    }
                }.padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 20)
                
            }
            
            ScrollView{
                SearchResult(listSorted : $listSorted , restaurantList: restaurantList , selectedCategory : $didSelectCategory , selectedPrice : $didSelectPrice , selectDistance : $didSelectDistance)
                if(listSorted.isEmpty && clickedSearch){
                    Text("ไม่พบผลลัพธ์").foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745)).font(.custom("Sukhumvit Set", size: 16)).padding()
                }
            }
            
            
        }.font(.custom("Sukhumvit Set", size: 14))
        .navigationBarHidden(true)
        .onChange(of: searchInput, perform: { value in
            self.listSorted =  restaurantList.filter({ value == "" ? false : $0.name.contains(value) })
        })
        
    }
    
    func getSearchResult(){
        
    }
}


