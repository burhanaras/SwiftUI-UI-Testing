//
//  UITestDemoApp.swift
//  UITestDemo
//
//  Created by Burhan Aras on 4.06.2021.
//

import SwiftUI

@main
struct UITestDemoApp: App {
    var user = User()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
