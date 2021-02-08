//
//  RestaurantDetail.swift
//  PMU!
//
//  Created by Melwayz's  on 8/2/21.
//

import SwiftUI
import UIKit

struct RoundedCorners: View {
    
    var color: Color = .white
    
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(self.color)
        }
    }
}




struct RestaurantDetail: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private var restaurant : Restaurants
    private var numberOfImage : Int
    private var starScore : Double
    
    
    init(restaurant : Restaurants) {
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "Sukhumvit Set", size: 16)!]
        self.restaurant = restaurant
        self.numberOfImage = restaurant.image.count
        self.starScore = restaurant.star_score
    }

    let screenHeight = UIScreen.main.bounds.height
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.black)
        }
    }
    }  
    
    var body: some View {
        
        ScrollView{
        VStack{
            Image(restaurant.image[1]).resizable().scaledToFill().frame(height: 300)
            ZStack(alignment: .topLeading ){
                RoundedCorners(color: .white, tl: 18, tr: 18, bl: 0, br: 0)
                VStack(alignment: .leading){
                    HStack(alignment: .firstTextBaseline){
                    Text(restaurant.name) .font(.custom("Sukhumvit Set", size: 24 )).bold().foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).frame(width: 240, alignment: .leading)
                        
                        Spacer()
                        
//                        FavouriteButton(isSet: restaurant.isFavourite )
//                        if  restaurant.isFavourite {
//                            Image(systemName: "heart.fill").foregroundColor(.red).font(.title)
//                        }else{
//                            Image(systemName: "heart").foregroundColor(.red).font(.title)
//                        }
                        
//                        Toggle(isSet: )
                    }
                    
                    Text("อาหารไทย").font(.custom("Sukhumvit Set", size: 14 )).foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451, opacity : 0.69))
                    
                    HStack(spacing: 1){
                        
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                        
                        Text(String(format: "%.1f" ,restaurant.star_score))
                        
                        Text("( \(restaurant.review_score) รีวิว )")
                        
                    }.font(.custom("Sukhumvit Set", size: 14)).foregroundColor(Color(red: 0.682, green: 0.702, blue: 0.745, opacity: 1)).padding(.bottom,8)
                    
                    
                    
                    
                    Text("ที่อยู่ร้านอาหาร").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
                    Text(restaurant.address).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451)).lineLimit(3).frame(width: 240, alignment: .leading)
                    
                    Text("เวลาเปิด").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
                    HStack{
                        Text("\(restaurant.status == true ? "เปิดอยู่" : "ปิด")").foregroundColor(restaurant.status == true ? Color(red: 0.421, green: 0.754, blue: 0.514) : Color(.red)).bold()
                        
                        Text(restaurant.opening_time).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451))
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("เบอร์โทรศัพท์").foregroundColor(Color(red: 0, green: 0.133, blue: 0.251)).bold()
                            Text(restaurant.contact).foregroundColor(Color(red: 0.412, green: 0.431, blue: 0.451))
                        }
                        Spacer()
                        
                        Button(action:{
                            let dash = CharacterSet(charactersIn: "-")

                                let cleanString =
                                    restaurant.contact.trimmingCharacters(in: dash)

                                let tel = "tel://"
                            let formattedString = tel + cleanString
                                let url: NSURL = URL(string: formattedString)! as NSURL

                                UIApplication.shared.open(url as URL)
                        } , label: {
                            HStack{
                                Image(systemName: "phone.fill")
                                Text("ติดต่อร้าน").bold()
                            }.padding(8).foregroundColor(.white)
                            .background(Color(red: 0, green: 0.133, blue: 0.251))
                            .cornerRadius(40).frame(width: 150, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                }
                
                    //// map
                    
                
            }.padding().font(.custom("Sukhumvit Set", size: 16))
            
            
        }
        }
    }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
}
}


struct RestaurantDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetail(restaurant: Restaurants.all()[0])
    }
}
