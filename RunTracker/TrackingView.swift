//
//  TrackingView.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 22/10/2023.
//

import Charts
import SwiftUI
import MapKit

struct RunningData: Identifiable {
    var id = UUID().uuidString
    var day: String
    var tempo: Double
}

struct RainDataOverlay: View {
    var intensity: Double
    
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5 * intensity), Color.blue.opacity(0.0)]), center: .center, startRadius: 0, endRadius: 25 * CGFloat(intensity))
            .frame(width: 50 * CGFloat(intensity), height: 50 * CGFloat(intensity))
    }
}

struct RainDataPoint: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var hour: Int
    var intensity: Double
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
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.7819, longitude: 17.0818), // Strzelin, Poland
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    
    let allRainDataPoints: [RainDataPoint] = [
            RainDataPoint(coordinate: CLLocationCoordinate2D(latitude: 50.7819, longitude: 17.0818), hour: 10, intensity: 0.9), // Strzelin, Poland at 10 AM with moderate rain
            RainDataPoint(coordinate: CLLocationCoordinate2D(latitude: 50.2594, longitude: 19.0216), hour: 14, intensity: 0.8), // Katowice, Poland at 2 PM with heavy rain
            RainDataPoint(coordinate: CLLocationCoordinate2D(latitude: 51.1079, longitude: 17.0385), hour: 16, intensity: 0.3)  // Wroclaw, Poland at 4 PM with light rain
        ]
    
    var currentHourRainDataPoints: [RainDataPoint] {
            let currentHour = 10
            return allRainDataPoints.filter { $0.hour == currentHour }
        }
        
    
    var body: some View {
        NavigationView {
            VStack(spacing: 18) {
                HStack {
                    VStack(spacing: 6) {
                        Text("Avg. tempo")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        Text("5.40")
                            .fontWeight(.medium)
                            .foregroundColor(AppMaterials.colors.appBrown)
                            .font(.system(size: 32))
                    }
                    Spacer()
                    VStack(spacing: 6) {
                        Text("Hi again")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        Text("User")
                            .fontWeight(.medium)
                            .foregroundColor(AppMaterials.colors.appBrown)
                            .font(.system(size: 32))
                    }
                    .padding(.trailing)
                   
                    
                }
                
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
                .padding() // Add padding for a nicer look
                .background(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                )
                
                .frame(maxWidth: .infinity)
                
                HStack(spacing: 16) {
                    Image(systemName: "figure.walk.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 64, maxHeight: 64)
                        .foregroundColor(AppMaterials.colors.appBrown)
                    VStack {
                        Text("30")
                            .fontWeight(.medium)
                            .foregroundColor(AppMaterials.colors.appBrown)
                            .font(.system(size: 32))
                        Text("total km")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            
                    }
                    
                    Rectangle()
                        .background(.gray)
                        .frame(width: 0.5, height: 72)
                        
                    Image(systemName: "flame.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 64, maxHeight: 64)
                        .foregroundColor(AppMaterials.colors.appBrown)
                    VStack {
                        Text("1432")
                            .fontWeight(.medium)
                            .foregroundColor(AppMaterials.colors.appBrown)
                            .font(.system(size: 32))
                            .frame(alignment: .center)
                        Text("calories burned")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .frame(alignment: .center)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding() // Add padding for a nicer look
                .background(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                )
                
                
                HStack {
                    NavigationLink(destination: {
                        RunView()
                    }) {
                        Text("Start running")
                            .padding()
                            .fontWeight(.regular)
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                        .background(AppMaterials.colors.appOrange)
                        .foregroundStyle(AppMaterials.colors.appBrown)
                        .cornerRadius(20)
                    }
                }
                
                VStack {
                    Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: currentHourRainDataPoints) { dataPoint in
                                MapAnnotation(coordinate: dataPoint.coordinate) {
                                    RainDataOverlay(intensity: dataPoint.intensity)
                                }
                            }
                    .cornerRadius(20)
                    
                    HStack{
                        Text("Check the weather in your area")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .frame(alignment: .center)
                        Spacer()
                    }
                }
            }
            .padding()
            .background(AppMaterials.colors.appWhite, ignoresSafeAreaEdges: .all)
        .navigationBarBackButtonHidden(true)
        }
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrackingView()
        }

    }
}
