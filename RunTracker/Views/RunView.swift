//
//  RunParametersView.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 24/10/2023.


import SwiftUI
import MapKit
import CoreLocation


struct RunView: View {

    @State private var distance = ""
    
    @State private var cameraPositon: MapCameraPosition = .region(.userRegion)
    
    @State private var userPosition = MapCameraPosition.userLocation(fallback: .automatic)

    var body: some View {
        ZStack{
            RunMapView()
                .ignoresSafeArea()
            VStack (spacing: 350){
                VStack {
                    HStack(spacing: 0) {
                        Spacer()
                        TextField("0", text: $distance)
                            .keyboardType(.numberPad)
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
                    Text("Run")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(30)
                        .background(Circle().fill(AppMaterials.colors.appOrange))
                        .shadow(radius: 10)
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
        .background(ignoresSafeAreaEdges: .all)
        .navigationBarBackButtonHidden(false)
    }
}

struct RunParametersView_Previews: PreviewProvider {
    static var previews: some View {
        RunView()
    }
}
