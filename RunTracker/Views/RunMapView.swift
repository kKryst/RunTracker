//
//  RunMapView.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 01/11/2023.
//

import SwiftUI
import MapKit

struct RunMapView: View {
    
    @StateObject private var viewModel = RunMapViewVM()
    
    
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct RunMapView_Previews: PreviewProvider {
    static var previews: some View {
        RunMapView()
    }
}

final class RunMapViewVM: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 32.8, longitude: 18.1), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta:0.01))
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("location restricted")
        case .denied:
            print("Go to settings and allow this app to use location")
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta:0.01))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
