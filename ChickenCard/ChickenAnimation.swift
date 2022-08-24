//
//  ChickenAnimation.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 18/08/2022.
//

import SwiftUI

struct ChickenAnimation: View {
    @State var Robot : String = ""
    var body: some View {
        VStack(alignment:.center){
                   
                   Image(Robot)
                       .resizable()
                       .frame(width: 400, height: 400, alignment: .center)
                       .onAppear(perform: timerRobot)
               }
    }
    func timerRobot(){
            
      var index = 1
      let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
                
            Robot = "chickenLogo\(index)"
                
            index += 1
                
            if (index > 6){
                index = 1
                
                }
            }
        }
}


struct ChickenAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ChickenAnimation()
    }
}
