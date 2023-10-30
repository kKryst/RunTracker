//
//  HomeViewVM.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 28/10/2023.
//

import Foundation
import MapKit
import SwiftUI


extension HomeView {
    @MainActor class HomeViewWM: ObservableObject{
        
        @Published var data = [
            RunningData(day: "Mon", tempo: 5.45),
            RunningData(day: "Tue", tempo: 5.30),
            RunningData(day: "Wed", tempo: 6.12),
            RunningData(day: "Thu", tempo: 5.01),
            RunningData(day: "Fri", tempo: 6.30),
            RunningData(day: "Sat", tempo: 5.39),
            RunningData(day: "Sun", tempo: 4.55)
        ]
        
        private var data2 = [
            RunningData(day: "Sat", tempo: 6.45),
            RunningData(day: "Sun", tempo: 7.30),
            RunningData(day: "Mon", tempo: 8.12),
            RunningData(day: "Tue", tempo: 4.01),
            RunningData(day: "Wed", tempo: 2.30),
            RunningData(day: "Thu", tempo: 1.39),
            RunningData(day: "Fri", tempo: 0.55)
        ]
        
        func replaceData() {
            data = data2
        }
        
        func calculateAverageTempo() -> String {
            let totalTempo = data.reduce(0) { $0 + $1.tempo }
            let average = totalTempo / Double(data.count)
            
            // Convert the rounded value to a String with two decimal places
            return String(format: "%.2f", average)
        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 50.7819, longitude: 17.0818)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 100, longitudinalMeters: 100)
    }
}


