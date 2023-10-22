//
//  Materials.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 22/10/2023.
//

import SwiftUI

struct AppMaterials {
    
    static let colors = Colors()
    
}

struct Colors {
    let appWhite = Color(hex: "#F6F1E9")
    let appYellow = Color(hex: "#FFD93D")
    let appOrange = Color(hex: "#FF8400")
    let appBrown = Color(hex: "#4F200D")
}



extension Color {
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }

        var color: UInt64 = 0

        scanner.scanHexInt64(&color)

        let red = Double((color & 0xFF0000) >> 16) / 255.0
        let green = Double((color & 0x00FF00) >> 8) / 255.0
        let blue = Double(color & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}



