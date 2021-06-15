//
//  User.swift
//  UITestDemo
//
//  Created by Burhan Aras on 4.06.2021.
//

import Foundation
import Combine

class User: ObservableObject{
    @Published var isLoggedIn = false
    @Published var userName: String = ""
    @Published var password: String = ""
    
    func login() -> Bool{
        guard userName == "user" && password == "pass" else {
            return false
        }
        
        password = ""
        isLoggedIn = true
        return true
    }
    
    func logout(){
        userName = ""
        password = ""
        isLoggedIn = false
    }
}
