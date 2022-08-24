//
//  NextLogin.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 23/08/2022.
//

import SwiftUI

struct NextLogin: View {
    @State var isWelcomeActive: Bool = true
    
    var body: some View {
        ZStack {
            if isWelcomeActive {
                login(active: $isWelcomeActive)
            } else {
                ContentView()
            }
        }
    }
}

struct NextLogin_Previews: PreviewProvider {
    static var previews: some View {
        NextLogin()
    }
}
