//
//  ContentView.swift
//  UITestDemo
//
//  Created by Burhan Aras on 4.06.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var user: User
    @State var showLogin = false
    
    var body: some View {
        VStack {
            Text(user.isLoggedIn ? "Welcome onboard \(user.userName)" : "Welcome to the world of UI Testing.")
                .padding()
            
            Spacer().frame(height: 20)
            
            Button(action: {
                if user.isLoggedIn{
                    user.logout()
                }else{
                    showLogin = true
                }
               
            }, label: {
                Text(user.isLoggedIn ? "Logout" : "Login")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.blue, lineWidth: 1)
                    )
            })
            .accessibilityIdentifier("loginButton")
        }
        .sheet(isPresented: $showLogin){
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
