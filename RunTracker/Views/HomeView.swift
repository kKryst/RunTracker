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

struct RainDataPoint: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var hour: Int
    var intensity: Double
}

struct HomeView: View {
    
    @StateObject private var vm = HomeViewWM()
    
    @State private var shouldAnimate = false
    
    @State private var cameraPositon: MapCameraPosition = .region(.userRegion)
        
    var body: some View {
        NavigationView {
            VStack(spacing: 18) {
                HStack {
                    VStack(spacing: 6) {
                        Text("Avg. tempo")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        Text("\(vm.averageTempo())")
                            .fontWeight(.medium)
                            .foregroundColor(AppMaterials.colors.appBrown)
                            .font(.system(size: 32))
                    }
                    Spacer()
                    VStack(spacing: 6) {
                        Text("Hi again")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        Button {
                            vm.replaceData()
                            shouldAnimate.toggle()
                        } label: {
                            Text("User")
                                .fontWeight(.medium)
                                .foregroundColor(AppMaterials.colors.appBrown)
                                .font(.system(size: 32))
                        }
                    }
                    .padding(.trailing)
                }
                
                Chart(vm.data) { d in
                    BarMark(x: .value("Day", d.day),
                            y: .value("Tempo", d.tempo)
                    )
                    .annotation(position: AnnotationPosition.top) {
                        Text(String(format: "%.2f", d.tempo))
                            .foregroundStyle(AppMaterials.colors.appBrown)
                    }
                    .cornerRadius(8)
                    .foregroundStyle(AppMaterials.colors.appOrange)
                }
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: shouldAnimate)
                .chartLegend(position: .leading, alignment: .leading)
                .frame(height: 200)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                )
                
                .frame(maxWidth: .infinity)
                
                HStack(spacing: 16) {
                    Image(systemName: "figure.walk.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
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
                        .frame(width: 64, height: 64)
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
                    Map(position: $cameraPositon, interactionModes: MapInteractionModes()) {
                    }
                    
                    HStack{
                        Text("Check the rain in your area (TBD)")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .frame(alignment: .center)
                        Spacer()
                    }
                }
            }
            .padding()
            .background(AppMaterials.colors.appWhite)
        }
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
