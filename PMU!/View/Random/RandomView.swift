//
//  RandomView.swift
//  PMU!
//
//  Created by Melwayz's  on 7/2/21.
//

import SwiftUI
import UIKit
import AudioToolbox

struct RandomView: View {
    @State private var willMoveToNextScreen = false
    @State var randomList : [Restaurant] = []
    @State var didSelectCategory : [Int] = []
    @State var didSelectPrice : String = ""
    @State var didSelectDistance : Double = 0
    @State var clickedEnter : Bool = false
    @State var shakedDevice : Int = 0
    @State var randomItem : Restaurant?
    
    var restaurantList : [Restaurant]
    
    var body: some View {
        VStack{
            Text("สุ่มร้านอาหาร")
                .font(.custom("Sukhumvit Set", size: 30 )).bold().foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
            
            
            NavigationLink(destination: RandomFilter(didSelectCategory: $didSelectCategory, didSelectPrice: $didSelectPrice, didSelectDistance: $didSelectDistance, clickedEnter: $clickedEnter) ){
                Text("ตั้งค่าการสุ่ม")
                    .font(.custom("Sukhumvit Set", size: 14 )).bold().foregroundColor(Color(red: 0, green: 0.133, blue: 0.251))
                    .padding()
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(red: 0.855, green: 0.855, blue: 0.855), lineWidth: 1)
                    ) 
            }
            
            VStack{
                if(!randomList.isEmpty){
                    NavigationLink(destination: RestaurantDetail(restaurant: randomItem!) ){
                        RandomResult(randomItem : randomItem!)}
                }
            }
            
        }.onShake {
            filterResult()
            self.randomItem = randomList.randomElement()
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        
    }
    
    func filterResult(){
        
        if(!didSelectCategory.isEmpty){
            self.randomList = restaurantList.filter { (restaurant) -> Bool in
                if (restaurant.category.count > 2 ){
                    return  didSelectCategory.contains(restaurant.category[0]) || didSelectCategory.contains(restaurant.category[1])
                }
                return didSelectCategory.contains(restaurant.category[0])
            }
        }
        
        if(didSelectPrice != ""){
            if(randomList.isEmpty){
                self.randomList = restaurantList.filter{ restaurant -> Bool in
                    return didSelectPrice == restaurant.price_level || "ไม่ระบุราคา" == restaurant.price_level
                }
            }
            self.randomList = randomList.filter{ restaurant -> Bool in
                return didSelectPrice == restaurant.price_level || "ไม่ระบุราคา" == restaurant.price_level
            }
        }
        
        if(didSelectDistance != 0){
            if(randomList.isEmpty){
                self.randomList = restaurantList.filter{ restaurant -> Bool in
                    return didSelectDistance >= restaurant.distance
                }
            }
            self.randomList = randomList.filter{restaurant -> Bool in
                return didSelectDistance >= restaurant.distance
            }
        }
        
        if(didSelectCategory.isEmpty || didSelectPrice == "" || didSelectDistance == 0){
            self.randomList = restaurantList
        }
    }
}

extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
    }
}

struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
