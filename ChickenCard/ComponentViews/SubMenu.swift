//
//  SubMenu.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 26/08/2022.
//

import SwiftUI

struct SubMenu: View {
    var name : String
    var body: some View {
        Rectangle()
            .fill(Color("lightOrange"))
            .frame(width: 300,height: 75)
            .cornerRadius(20)
            .shadow(color: .blue, radius: 20)
            .overlay(Text(name).font(.system(size: 30)).fontWeight(.heavy))
    }
}

struct SubMenu_Previews: PreviewProvider {
    static var previews: some View {
        SubMenu(name: "Play Game")
    }
}
