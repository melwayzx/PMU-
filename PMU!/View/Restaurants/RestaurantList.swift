//
//  RestaurantList.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI

struct RestaurantList: View {
    
    
    var place_id = PlaceID.getPlaceID()
    @State var response : Restaurant?
    @State var restaurantList : [Restaurant] = []
    
    
    var body: some View {
        VStack(spacing: 10){
            
            ForEach(restaurantList){item in
                RestaurantItem(item : item)
            }
            
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
                    let response = decodedData.result
                    let name = response.name
                    let formatted_address = response.formatted_address
                    let formatted_phone_number = response.formatted_phone_number
                    let opening_time = opentimeOfDay(weekday: response.opening_hours.weekday_text)
                    let open_now = response.opening_hours.open_now
                    let price_level = response.price_level
                    let rating = response.rating
                    let user_rating_total = response.user_ratings_total
                    
                    restaurantList.append(Restaurant(id: UUID(), name: name, formatted_address: formatted_address, formatted_phone_number: formatted_phone_number, opening_time: opening_time, open_now:open_now, price_level: price_level, rating: rating, user_ratings_total: user_rating_total ))
                    
                    
                }
            }
            
        }.resume()
    }
    
    func loadItems(){
        for placeID in place_id{
            fetchData(placeID: placeID.place_id)
        }
    }
    
    func opentimeOfDay(weekday : [String]) -> String{
        let date = Date()
        let calendar = Calendar.current
        let opening_time = weekday[calendar.component(.day, from: date)-1].split(separator: " ")
        return (String(opening_time[1]))
        
    }
    
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
    }
}
