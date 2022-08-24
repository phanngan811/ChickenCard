//
//  ContentView.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 17/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = ["chickenSad", "chickenCool", "chickenAngry"]
    @State private var numbers = Array(repeating:0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var showGameOverModal = false
    @State private var credits = 100
    @State var angle: Double = 0
    @State var angle1: Double = 0
    @State private var scale = 1.0
    @State var numberOfShakes: CGFloat = 0
    @State private var showModal = false

    private var betAmount = 5
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("darkYellow"), Color("darkBlue")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                //Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        self.showModal.toggle()
                    }){
                        Image("chickenQuestion")
                            .resizable()
                            .frame(width: 70, height: 70, alignment: .trailing)
                            .sheet(isPresented: $showModal) {
                                ModalView(showModal: self.$showModal)
                            }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                //Spacer()
                HStack{
                    Image("chickenLogo")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .modifier(ShakeEffect(shakeNumber: numberOfShakes))
                        .onAppear {
                            withAnimation(.easeIn(duration: 2.0)) {
                                numberOfShakes = 10
                            }
                        }
                    Text("CASINO CHICKEN")
                        .bold()
                        .foregroundColor(.purple)
                    Image("chickenLogo")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .modifier(ShakeEffect(shakeNumber: numberOfShakes))
                        .onAppear {
                            withAnimation(.easeIn(duration: 2.0)) {
                                numberOfShakes = 10
                            }
                        }
                }.scaleEffect(1.5)
                Spacer()
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.green.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                //Card
                VStack{
                    HStack{
                        Spacer()
                        CardsView(card: $cards[numbers[0]], background: $backgrounds[0])
                        CardsView(card: $cards[numbers[1]], background: $backgrounds[1])
                        CardsView(card: $cards[numbers[2]],background: $backgrounds[2])
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        CardsView(card: $cards[numbers[3]], background: $backgrounds[3])
                        CardsView(card: $cards[numbers[4]], background: $backgrounds[4])
                        CardsView(card: $cards[numbers[5]],background: $backgrounds[5])
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        CardsView(card: $cards[numbers[6]], background: $backgrounds[6])
                        CardsView(card: $cards[numbers[7]], background: $backgrounds[7])
                        CardsView(card: $cards[numbers[8]],background: $backgrounds[8])
                        Spacer()
                    }
                }
                Spacer()
                //Button
                HStack(spacing: 100){
                    VStack{
                        Button(action: {
                            //Process a signle spin
                            self.processResult()
                            self.isGameOver()
                            self.angle += 45
                            
                            
                        }){
                            Rectangle()
                                .fill(Color("lightOrange"))
                                .frame(width: 100,height: 40)
                                .cornerRadius(20)
                                .overlay(Text("Spin").fontWeight(.heavy).foregroundColor(.purple))
                                .rotationEffect(.degrees(angle))
                        }
                        
                        Text("\(betAmount) credits").padding(.top,10).font(.footnote)
                    }
                    VStack{
                        Button(action: {
                            //Process a signle spin
                            self.processResult(true)
                            self.isGameOver()
                            self.angle1 += 45
                            
                            //playSound(sound: "spin", type: "mp3")
                            
                            
                        }){
                            
                            Rectangle()
                                .fill(Color("lightOrange"))
                                .frame(width: 100,height: 40)
                                .cornerRadius(20)
                                .overlay(Text("Max Spin").fontWeight(.heavy).foregroundColor(.purple))
                            
                                .rotationEffect(.degrees(angle1))
                        }
                        
                        Text("\(betAmount * 5) credits").padding(.top,10).font(.footnote)
                    }
                    
                }
                
                
                //Spacer()
                if showGameOverModal{
                    ZStack{
                        
                        Color("blue")
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            Text("GAME OVER")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                                .background(Color("blue"))
                            
                            Spacer()
                            
                            VStack {
                                Image("chickenLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 130)
                                Text("You lost all credits!\n Good luck next time!")
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                Button {
                                    self.showGameOverModal = false
                                    self.credits = 100
                                } label: {
                                    Text("New Game".uppercased()).foregroundColor(.yellow)
                                        .fontWeight(.heavy)
                                }
                                .padding(.vertical,10)
                                .padding(.horizontal, 20)
                                .background(
                                    Capsule()
                                        .strokeBorder(lineWidth: 2)
                                        .foregroundColor(.yellow)
                                )
                                
                            }
                            Spacer()
                        }
                        .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                        .background(Color("blue"))
                        .cornerRadius(20)
                    }.onAppear(perform: {
                        playSound(sound: "gameover", type: "mp3")
                    })
                }
                //ZStack
                
             Spacer()
                //Spacer()
            }.onAppear(perform: {
                playSound(sound: "drum-music", type: "mp3")
            })
            
            
        }
    }
    
    func isGameOver() {
        if credits <= 0 {
            // SHOW MODAL MESSAGE OF GAME OVER
            showGameOverModal = true
            //playSound(sound: "gameover", type: "mp3")
        }
    }
    func processResult(_ isMax: Bool = false){
        // set background back to white
        self.backgrounds = self.backgrounds.map({
            _ in Color.white
        })
        if isMax{
            //Spin all Cards
            self.numbers = self.numbers.map({ _ in
                Int.random(in: 0...self.cards.count - 1)
            })
        }else{
            //spin the middle row
            self.numbers[3] = Int.random(in: 0...self.cards.count - 1)
            
            self.numbers[4] = Int.random(in: 0...self.cards.count - 1)
            
            self.numbers[5] = Int.random(in: 0...self.cards.count - 1)
        }
        //Check winning
        processWin(isMax)
        
        
    }
    
    func processWin(_ isMax: Bool = false){
        var matches = 0
        
        if !isMax{
            //processing for signle spin
            if isMatch(3, 4, 5){matches += 1}
            
        }else{
            //processing for max spin
            
            //top row
            if isMatch(0, 1, 2){matches += 1}
            
            //middle row
            if isMatch(3, 4, 5){matches += 1}
            
            //bottom row
            if isMatch(6, 7, 8){matches += 1}
            
            //diagonal top left to bottom right
            if isMatch(0, 4, 8){matches += 1}
            
            //diagonal top right to bottom left
            if isMatch(2, 4, 6){matches += 1}
            
            if isMatch(0, 3, 6){matches += 1}
            
            if isMatch(2,5,8){matches += 1}
            
        }
        //check matches and distribute credits
        if matches>0 {
            //at least 1 win
            self.credits += matches * betAmount * 2
            playSound(sound: "wow-113128", type: "mp3")
        }else if !isMax{
            //0win, single spin
            self.credits -= betAmount
        }else{
            //owin, max spin
            self.credits -= betAmount * 5
        }
        
    }
    
    
    
    func isMatch(_ index1:Int, _ index2:Int, _ index3:Int) -> Bool {
        
        if self.numbers[index1] == self.numbers[index2] && self.numbers[index2] == self.numbers[index3] {
            
            self.backgrounds[index1] = Color("darkBlue")
            self.backgrounds[index2] = Color("darkBlue")
            self.backgrounds[index3] = Color("darkBlue")
            //playSound(sound: "blink", type: "mp3")
            
            return true
        }
        //playSound(sound: "blink", type: "mp3")
        
        return false
    }

}

struct ShakeEffect: AnimatableModifier {
    var shakeNumber: CGFloat = 0
    
    var animatableData: CGFloat {
        get {
            shakeNumber
        } set {
            shakeNumber = newValue
        }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: sin(shakeNumber * .pi * 2) * 10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
