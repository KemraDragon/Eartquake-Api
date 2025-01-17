//
//  Eartquake_ApiApp.swift
//  Eartquake-Api
//
//  Created by Kevin  on 16-01-25.
//

import SwiftUI

@main
struct Eartquake_ApiApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView { // Envuelve la vista inicial en un NavigationView
                LoginView() // Reemplaza ContentView con LoginView
            }
        }
    }
}
