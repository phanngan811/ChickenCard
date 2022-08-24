//
//  SplashScreen.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 22/08/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8;
    @State private var opacity = 0.5
    var body: some View {
        if(isActive){
            LoginView()
        }else{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("darkYellow"), Color("darkBlue")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack{
                    Image("logoChicks")
                }.scaleEffect(size)
                    
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation{
                            self.isActive = true
                        }
                        
                    }
                }
            }.onAppear(perform: {
                playSound(sound: "welcome", type: "mp3")
            })
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
