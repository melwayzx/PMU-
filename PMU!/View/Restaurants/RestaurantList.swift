//
//  RestaurantList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct RestaurantList: View {
    
    //    init() {
    //        self.responseVM = APIView()
    //    }
    var place_id = PlaceID.getPlaceID()
    @State var res : Restaurant?
    @State var myArray : [Restaurant] = []
    //    let place_id : String
    
    var body: some View {
        VStack(spacing: 10){
            
            ForEach(myArray){item in
                RestaurantItem(item : item)
            }
            
            Button(action:{
                print(myArray)
            } , label: {
                HStack{
                    Image(systemName: "phone.fill")
                    Text("ติดต่อร้าน").bold()
                }.padding(8).foregroundColor(.white)
                .background(Color(red: 0, green: 0.133, blue: 0.251))
                .cornerRadius(40).frame(width: 150, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            Spacer()
                .frame(height: 20)
                .onAppear(perform:loadItems)
            
            
        }
    }
    
    private func fetchData(placeID : String){
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?place_id=\(placeID)&fields=name,rating,review,user_ratings_total,price_level,formatted_phone_number,formatted_address,geometry,opening_hours,photo&language=th&key=AIzaSyB2zZ0AQ4y2zLNXljvnhOA1qLku4HPAfb8")
        else {
            
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data
            else {
                
                return
            }
            
            if let decodedData = try? JSONDecoder().decode(Response.self, from: data){
                DispatchQueue.main.async {
                    let res = decodedData.result
//                    myArray.append(Restaurant(id: UUID() , name: res.name , formatted_address: res.formatted_phone_number, formatted_phone_number: res.formatted_phone_number ,opening_hours : opening_hours(open_now: res.opening_hours.open_now , period : period(close: res.opening_hours.periods.cl, open: <#T##open#>)) ))
                    let opening_hours = res.opening_hours
                    Restaurant(id: <#T##UUID#>,
                               name: <#T##String#>,
                               formatted_address: <#T##String#>,
                               formatted_phone_number: <#T##String#>,
                               opening_hours: opening_hours,
                               photos: <#T##[photos]?#>,
                               price_level: <#T##Int#>,
                               rating: <#T##Float#>,
                               user_ratings_total: <#T##Int#>,
                               reviews: <#T##[reviews]?#>)
                    
                    
                    
                    //                    print(decodedData.result)
                    
                }
            }
            
        }.resume()
    }
    
    func loadItems(){
        for placeID in place_id{
            fetchData(placeID: placeID.place_id)
        }
    }
    
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
    }
}
