////
////  GoogleAPIService.swift
////  PMU!
////
////  Created by Melwayz's  on 27/2/21.
////
//
//import Foundation
//import Combine
//
//class APIService {
//
//    func loadData(placeID : String){
//        var name : String
//        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?place_id=\(placeID)&fields=name,rating,review,user_ratings_total,price_level,formatted_phone_number,formatted_address,geometry,opening_hours,photo&language=th&key=AIzaSyB2zZ0AQ4y2zLNXljvnhOA1qLku4HPAfb8")else{
//            return
//        }
//        URLSession.shared.dataTask(with: url)  { (data, response, error) in
//            guard let data = data, error == nil else {
//                return
//            }
//            let decodeData = try? JSONDecoder().decode(Response.self, from: data)
//            if let decodeData = decodeData {
//                let res = decodeData.result
//            } else {
//
//            }
//
//        }.resume()
//    }
//}
//
//
//class APIView : ObservableObject{
//
//
//    let place_id = PlaceID.getPlaceID()
//    private var apiService : APIService
//    @Published var res = Result()
//    var temp : [Result] = []
//
//    init(){
//        self.apiService = APIService()
//    }
//
//    var name : String{
//        if let name = self.res.name{
//            return name
//        }else{
//            return ""
//        }
//    }
//
//    func getRestaurant(){
//        for placeID in place_id{
//            self.apiService.loadData(placeID: placeID.place_id)
//        }
//    }
//
////    func getRestaurant(){
////        print("try")
////        for placeID in place_id{
////            self.apiService.loadData(placeID: placeID.place_id){ data in
////                if let data = data{
//////                    print(data)
////                    DispatchQueue.main.async {
////                        self.res.name = data.name
////
////                    }
////                }
////
////            }
////        }
////        print(self.res)
////    }
//}
