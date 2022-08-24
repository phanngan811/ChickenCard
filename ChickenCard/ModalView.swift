//
//  ModalView.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 23/08/2022.
//

import SwiftUI
struct Bookmark: Identifiable {
    let id = UUID()
    let content: String
    var items: [Bookmark]?

    // some example websites
    static let q1 = Bookmark( content: "Just spin the square to play")
    static let q2 = Bookmark( content: "You need to spin out 3 identical images with the same horizontal, vertical, and slant lines")
    static let q3 = Bookmark( content: "For 5 points, square will only run in the middle row, and for 25 points, the whole square will be run")
    static let q4 = Bookmark( content:"you have a chance to start a new game with a given score of 100")
    // some question groups
    static let question1 = Bookmark( content: "How to play this game?", items: [Bookmark.q1])
    static let question2 = Bookmark( content: "How to win this game", items: [Bookmark.q2])
    static let question3 = Bookmark( content:"The difference when betting 5 points and 25 points", items: [Bookmark.q3])
    static let question4 = Bookmark( content:"What will happen when the score is 0 ", items: [Bookmark.q4])
    //info game
    static let in1 = Bookmark( content: "Chicken Card")
    static let in2 = Bookmark( content: "COSC2659: IOS Development")
    static let in3 = Bookmark( content: "Saigon South Campus")
    static let in4 = Bookmark( content: "KenTn")
    //info game group
    static let info1 = Bookmark( content: "App Name:", items: [Bookmark.in1])
    static let info2 = Bookmark( content: "Course Name:", items: [Bookmark.in2])
    static let info3 = Bookmark( content: "Location:", items: [Bookmark.in3])
    static let info4 = Bookmark( content: "Author:", items: [Bookmark.in4])
    
}
struct ModalView: View {
    @Binding var showModal: Bool
    let items: [Bookmark] = [.question1, .question2, .question3, .question4]
    let itemsInfo: [Bookmark] = [.info1, .info2, .info3, .info4]

    var body: some View {
        ZStack{
            VStack{
                
                Text("ABOUT PLAYING GAME").foregroundColor(.yellow).fontWeight(.heavy)
                List(items, children: \.items) { row in
                    Image(systemName: row.content)
                    Text(row.content)
                }
                Text("ABOUT INFO GAME").foregroundColor(.yellow).fontWeight(.heavy)
                List(itemsInfo, children: \.items) { row in
                    Image(systemName: row.content)
                    Text(row.content)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button(action: {
                    self.showModal.toggle()
                }){
                    Capsule()
                        .frame(height: 30)
                        .overlay(Text("DONE").foregroundColor(.yellow).fontWeight(.heavy).font(.system(size: 25)))
                    
                }
            }
            .onAppear(perform: {
                playSound(sound: "taratata-6264", type: "mp3")
            })
            
        }
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(showModal: .constant(true))
    }
}
