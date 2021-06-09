//
//  LoginView.swift
//  UITestDemo
//
//  Created by Burhan Aras on 5.06.2021.
//

import Foundation
import SwiftUI

struct LoginView: View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: User
    @State private var showAlert = false
    
    var body: some View{
        NavigationView{
            Form{
                Section{
                    TextField("Username", text: $user.userNAme)
                    SecureField("Password", text: $user.password)
                }
                
                Button(action: {
                    if user.login(){
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        showAlert = true
                    }
                }, label: {
                    Text("Login")
                })
                .accessibilityIdentifier("loginNow")
            }
            .navigationTitle(Text("Login"))
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .accessibilityIdentifier("Dismiss")
            }))
        }.alert(isPresented: $showAlert){
            Alert(
                title: Text("Login Failed"),
                message: Text("Username or password is wrong."),
                dismissButton: Alert.Button.default(Text("OK"), action: {showAlert = false}))
        }
    }
}


struct LoginView_Previews: PreviewProvider{
    static var previews: some View{
        let user = User()
        LoginView()
            .environmentObject(user)
    }
}
