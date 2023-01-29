//
//  HabitTrackingApp.swift
//  HabitTracking
//
//  Created by Ian Waddington on 21/01/2023.
//

import SwiftUI

@main
struct HabitTrackingApp: App {
@StateObject var habits = Habits()

    var body: some Scene {
        WindowGroup {
            ContentView(habits: habits)
                .environmentObject(habits)
        }
    }
}
