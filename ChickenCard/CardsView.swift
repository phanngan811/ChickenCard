//
//  CardsView.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 17/08/2022.
//

import SwiftUI

struct CardsView: View {
    @Binding var card:String
    @Binding var background:Color
    var body: some View {
        Image(card)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .background(background.opacity(10))
            .cornerRadius(20)
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(card: Binding.constant("chickenSad"), background: Binding.constant(Color.green))
    }
}
