//
//  HabitItem.swift
//  HabitTracking
//
//  Created by Ian Waddington on 21/01/2023.
//

import Foundation

struct HabitItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var times: Int
}
