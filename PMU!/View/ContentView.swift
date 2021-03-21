//
//  ContentView.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI


struct ContentView: View {
    @State private var selection: Int = 0
    @State var didAppear = false
    var place_id = PlaceID.getPlaceID()
    @State var response : Restaurant?
    @State var restaurantList : [Restaurant] = []
    var locationManager = LocationManager()
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    
    var body: some View {
        NavigationView{
            TabView(selection: $selection) {
                Home(restaurantList : restaurantList)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("หน้าหลัก")
                    }
                    .navigationBarHidden(true)
                    .tag(0)
                
                GoogleMapView()
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("ร้านใกล้ฉัน")
                    }.navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.all)
                    .tag(1)
                
                RandomView(restaurantList : restaurantList)
                    .tabItem {
                        Image("fastfoodicn").renderingMode(.template)
                        Text("สุ่มร้านอาหาร")
                    }
                    .navigationBarHidden(true)
                    .tag(2)
                
                FavouriteView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("ร้านที่ถูกใจ")
                        
                    }
                    .navigationBarHidden(true)
                    .tag(3)
            } .accentColor(Color(red: 0.00, green: 0.13, blue: 0.25, opacity: 1.00))
            
        }.onAppear(perform:loadItems)
    }
    
    private func fetchData(placeID : PlaceID){
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/place/details/json?place_id=\(placeID.place_id)&fields=name,rating,review,user_ratings_total,price_level,formatted_phone_number,formatted_address,geometry,opening_hours,photo&language=th&key=AIzaSyB2zZ0AQ4y2zLNXljvnhOA1qLku4HPAfb8")
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
                    let formatted_address = response.formatted_address ?? "ไม่ระบุที่อยู่ร้าน"
                    let formatted_phone_number = response.formatted_phone_number ?? "ไม่ระบุเบอร์ติดต่อ"
                    let opening_time = opentimeOfDay(weekday: response.opening_hours.weekday_text ?? ["ไม่ระบุเวลาเปิด/ปิดร้าน"])
                    let open_now = response.opening_hours.open_now
                    let price_level = getPriceLevel(price_level : response.price_level ?? 0)
                    let rating = response.rating  ?? 0
                    let user_rating_total = response.user_ratings_total ?? 0
                    let lat = response.geometry.location.lat
                    let lng = response.geometry.location.lng
                    //     var distance = calculateLocation(lat1: LocationManager.latitude, lat2: lat, lng1: LocationManager.longitude, lng2: lng)
                    let distance = calculateLocation(lat1: 13.73889, lat2: lat, lon1: 100.53161, lon2: lng)
                    let category = placeID.category
                    let category_text = getCategoryText(category: category)
                    let place_id = placeID.place_id
                    
                    
                    self.restaurantList.append(Restaurant(id: UUID(), name: name, formatted_address: formatted_address, formatted_phone_number: formatted_phone_number, opening_time: opening_time, open_now:open_now, price_level: price_level, rating: rating, user_ratings_total: user_rating_total , lat : lat , lng: lng , distance : distance , category: category, category_text: category_text ,place_id: place_id))
                    
                    
                    //                    print(restaurantList.count)
                }
            }
            
        }.resume()
        
    }
    
    func loadItems(){
        if didAppear == false {
            for placeID in place_id{
                fetchData(placeID: placeID)
            }
        }
        didAppear = true
        
        
    }
    
    func opentimeOfDay(weekday : [String]) -> String{
        let opening_time = weekday[Calendar.current.component(.weekday, from: Date())-1].split(separator: " ")
        if(opening_time[1] == "เปิด"){
            return String(weekday[Calendar.current.component(.weekday, from: Date())-1].split(separator: ":")[1])
        }
        return (String(opening_time[1]))
    }
    
    func getPriceLevel(price_level : Int) -> String{
        var price = ""
        if(price_level == 0){
            return "ไม่ระบุราคา"
        }
        for _ in 1...price_level{
            price = price + "฿"
        }
        
        return price
    }
    
    func getCategoryText(category : [Int]) -> [String]{
        var category_text : [String] = []
        for item in category{
            switch item {
            case  0 :
                category_text.append("อาหารไทย")
            case 1 :
                category_text.append("อาหารจีน")
            case  2 :
                category_text.append("อาหารญี่ปุ่น")
            case 3 :
                category_text.append("จานด่วน")
            case  4 :
                category_text.append("ก๋วยเตี๋ยว")
            case 5 :
                category_text.append("บุฟเฟต์")
            case  6 :
                category_text.append("ชา/กาแฟ")
            case 7 :
                category_text.append("ของหวาน")
            default:
                category_text.append("ไม่มีประเภทร้านอาหาร")
            }
        }
        return category_text
    }
    
    func calculateLocation(lat1: Double, lat2: Double, lon1: Double, lon2: Double) -> Double {
        let R = 6378.137; // Radius of earth in KM
        let dLat = lat2 * Double.pi / 180 - lat1 * Double.pi / 180;
        let dLon = lon2 * Double.pi / 180 - lon1 * Double.pi / 180;
        let a = sin(dLat/2) * sin(dLat/2) +
            cos(lat1 * Double.pi / 180) * cos(lat2 * Double.pi / 180) *
            sin(dLon/2) * sin(dLon/2);
        let c = 2 * atan2(sqrt(a), sqrt(1-a));
        let d = R * c;
        
        //        print(d * 1000)
        return d * 1000; // meters
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

