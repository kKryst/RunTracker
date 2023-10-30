//
//  RunningData.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 30/10/2023.
//

import Foundation

struct RunningData: Identifiable {
    var id = UUID().uuidString
    var day: String
    var tempo: Double
}
