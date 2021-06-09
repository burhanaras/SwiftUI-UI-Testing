//
//  ContentView.swift
//  UITestDemo
//
//  Created by Burhan Aras on 4.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State var showLogin = false
    
    var body: some View {
        VStack {
            Text("Welcome to the world of UI Testing.")
                .padding()
            
            Spacer().frame(height: 20)
            
            Button(action: {
                showLogin = true
            }, label: {
                Text("Login")
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
