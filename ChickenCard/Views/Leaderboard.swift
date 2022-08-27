//
//  Example.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 26/08/2022.
//

import SwiftUI

struct Leaderboard: View {
    @State private var showMenu = false
    //var chickenModal :ChickenModal
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("darkYellow"), Color("darkBlue")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            FireWorksView(numberOfFireworks: 10)
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        showMenu = true
                    }){Image(systemName: "x.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                            .padding()
                            .position(x: 350, y: 20)
                        
                    }
                }
                
                Text("Leaderboard:")
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                
                ScrollView{
                    
                    VStack(spacing: 20) {
                        ForEach(ContentView().highscores, id: \.self) { score in
                            HStack{
                                Image("chickenLogo")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("\(score)").font(.system(size: 30))
                                    .bold()
                                Image("chickenLogo")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                        }
                        
                        
                        
                        
                    }
                }.font(.largeTitle).frame(height: 400)
                Spacer(minLength: 200)
                
                
            }.onAppear(perform: {
                playSound(sound: "taratata-6264", type: "mp3")
            })
            if showMenu{
                Menu()
            }
        }
        
    }
    //    func sort(){
    //        // sort dictionary by key in ascending order
    //
    //        // sort dictionary by value in ascending order
    //        self.scores.append(12)
    //        scores.sort(by: >)
    //
    //    }
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}
