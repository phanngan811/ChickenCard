//
//  Menu.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 25/08/2022.
//

import SwiftUI

struct Menu: View {
    @State private var showContent = false
    @State private var showBoard = false
    @State private var showHow = false
    @State private var showModal = false
    @Environment(\.scenePhase) var scenePhase

    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("darkYellow"), Color("darkBlue")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Spacer()
                HStack{
                    Image("chickenLogo")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Chicken Card").fontWeight(.heavy).font(.system(size: 35)).foregroundColor(.purple)
                    Image("chickenLogo")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
                
                Spacer()
                
                Button(action: {
                    showContent.toggle()
                }){
                    SubMenu(name: "Play Game").padding().sheet(isPresented: $showModal) {
                        ModalView(showModal: self.$showModal)
                    }
                }
                
                
                Button(action: {
                    
                    self.showBoard.toggle()

                }){
                    SubMenu(name: "Leaderboard").padding().sheet(isPresented: $showModal) {
                        ModalView(showModal: self.$showModal)
                    }
                }
                Button(action: {
                    showHow = true
                    self.showModal.toggle()

                }){
                    SubMenu(name: "How to play")
                        .padding()
                        .sheet(isPresented: $showModal) {
                            ModalView(showModal: self.$showModal)

                    }
                    
                }
                Spacer()
                Spacer()
                
                
                
            }
            if showContent{
                ContentView()
            }
            
            if showBoard{
                Leaderboard()
            }
//            if showHow{
//                ModalView(showModal:self.$showModal)
//            }
        }
    }
    
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
