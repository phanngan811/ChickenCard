//
//  WelcomeGame.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 22/08/2022.
//

import SwiftUI

struct WelcomeGame: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("darkYellow"), Color("darkBlue")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Image("logoChicks")
            }
            
        }
    }
}

struct WelcomeGame_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeGame()
    }
}
