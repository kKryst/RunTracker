//
//  RunParametersView.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 24/10/2023.


import SwiftUI
import MapKit
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
    }
}

struct RunView: View {
    
    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        formatter.minimum = 1
        return formatter
    }()
    
    @State private var distance = ""
    
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default to San Francisco, will be updated to user's location
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005) // Zoom level
    )
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, showsUserLocation: true)
                .onAppear {
                    if let userLocation = locationManager.location {
                        region.center = userLocation.coordinate
                    }
                }
            
            VStack (spacing: 350){
                VStack {
                    HStack(spacing: 0) {
                        Spacer()
                        TextField("0", text: $distance)
                            .keyboardType(.numberPad)
                            .onChange(of: distance) { newValue in
                                // Ensure only numbers are entered
                                if let _ = Int(newValue) {
                                    // Check if the number is greater than 0
                                    if let number = numberFormatter.number(from: newValue), number.intValue > 0 {
                                        distance = "\(number.intValue)"
                                    } else {
                                        distance = ""
                                    }
                                } else {
                                    distance = ""
                                }
                            }
                            .foregroundStyle(AppMaterials.colors.appWhite)
                            .font(.largeTitle)
                            .frame(width: 120)
                        
                        Text("KM")
                            .offset(x: -10)
                            .foregroundStyle(AppMaterials.colors.appWhite)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(AppMaterials.colors.appOrange)
                    Button {
                        print("Distance button clicked")
                    } label: {
                        Text("Distance")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .padding(.all)
                            .background(RoundedRectangle(cornerRadius: 20).fill(AppMaterials.colors.appOrange)
                                .stroke(AppMaterials.colors.appOrange, lineWidth: 2)
                                        .frame(height: 45)
                                        
                            )
                            .foregroundStyle(AppMaterials.colors.appWhite)
                    }

                }
                .padding()
                .background(BlurView(style: .systemThinMaterialDark))
                .cornerRadius(32)
                .frame(maxWidth: .infinity)
                .shadow(radius: 10)
                
                Button {
                    print("Presssed start button")
                } label: {
                    Text("Run")  // Using a system image as an example
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(30)  // Adjust padding to change the size of the circle
                        .background(Circle().fill(AppMaterials.colors.appOrange))
                        .shadow(radius: 10)
                        .fontWeight(.semibold)
                }
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct RunParametersView_Previews: PreviewProvider {
    static var previews: some View {
        RunView()
    }
}
