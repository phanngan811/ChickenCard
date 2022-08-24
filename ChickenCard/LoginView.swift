//
//  login.swift
//  ChickenCard
//
//  Created by phan thi thu ngan on 23/08/2022.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginView : View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var active :Bool = false
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("darkYellow"), Color("darkBlue")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                WelcomeText()
                UserImage()
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .frame(width: 400)

                
                Button(action: {print("Button tapped")
                    active = true
                }) {
                    LoginButtonContent()
                }
                .padding()
                
                
            }
            if active{
                ContentView()
                
            }
        }
        
    }

#if DEBUG
    struct login_Previews : PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
#endif
    
    struct WelcomeText : View {
        var body: some View {
            return Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
        }
    }
    
    struct UserImage : View {
        var body: some View {
            return Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
        }
    }
    
    struct LoginButtonContent : View {
        var body: some View {
            return Text("LOGIN")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color("lightOrange"))
                .cornerRadius(15.0)
        }
    }
    
}
