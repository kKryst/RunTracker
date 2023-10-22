//
//  TrackingView.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 22/10/2023.
//

import Charts
import SwiftUI

struct RunningData: Identifiable {
    var id = UUID().uuidString
    var day: String
    var tempo: Double
}

struct TrackingView: View {
    
    var data = [
        RunningData(day: "Mon", tempo: 5.45),
        RunningData(day: "Tue", tempo: 5.30),
        RunningData(day: "Wed", tempo: 6.12),
        RunningData(day: "Thu", tempo: 5.01),
        RunningData(day: "Fri", tempo: 6.30),
        RunningData(day: "Sat", tempo: 5.39),
        RunningData(day: "Sun", tempo: 4.55)
    ]
    
    
    var body: some View {
        VStack {
            Text("hi")
            Chart {
                ForEach(data) { d in
                    BarMark(x: .value("Day", d.day), y: .value("Tempo", d.tempo))
                        .cornerRadius(8)
                        .annotation {
                            Text(String(format: "%.2f", d.tempo))
                                .foregroundStyle(AppMaterials.colors.appBrown)
                        }
                        .foregroundStyle(AppMaterials.colors.appOrange)
                        
                }
            }
            .chartLegend(position: .leading, alignment: .leading)
            .frame(maxHeight: 200)
            
            .padding()
        }
        .padding()
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
