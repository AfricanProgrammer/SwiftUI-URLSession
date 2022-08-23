//
//  SwiftUIUrlSessionByNyashaMadzokereApp.swift
//  SwiftUIUrlSessionByNyashaMadzokere
//
//  Created by User on 2022/08/15.
//

import SwiftUI

@main
struct SwiftUIUrlSessionByNyashaMadzokereApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            MainView()
                .environmentObject(order)
        }
    }
}
