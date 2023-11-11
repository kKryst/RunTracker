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
            RunningData(day: "Mon", tempo: 5.15, distance: 5.0, date: Date(), calories: 324),
            RunningData(day: "Tue", tempo: 5.55, distance: 6.0, date: Date(), calories: 430),
            RunningData(day: "Wed", tempo: 6.15, distance: 5.3, date: Date(), calories: 374),
            RunningData(day: "Thu", tempo: 5.07, distance: 5.8, date: Date(), calories: 451),
            RunningData(day: "Fri", tempo: 5.37, distance: 4.8, date: Date(), calories: 530),
            RunningData(day: "Sat", tempo: 5.30, distance: 5.1, date: Date(), calories: 399),
            RunningData(day: "Sun", tempo: 6.11, distance: 6.0, date: Date(), calories: 481)
        ]
        
        @Published var avgTempo: String?
        
        @Published var totalCalories: String?
        
        @Published var totalDistance: String?
        
        private var aTempo: String {
            let totalTempo = data.reduce(0) { $0 + $1.tempo }
            let average = totalTempo / Double(data.count)
            
            return String(format: "%.2f", average)
        }
        
        private var tDistance: String {
            var sum = 0.0
            
            data.forEach { element in
                sum += element.tempo
            }
            
            return String(format: "%.1f", sum)
        }
        
        private var tCalories: String {
            var sum = 0
            
            data.forEach { element in
                sum += element.calories
            }
            
            return String(sum)
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


