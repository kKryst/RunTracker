//
//  AuthorisationViewVM.swift
//  RunTracker
//
//  Created by Krystian Konieczko on 11/11/2023.
//

import Foundation
import SwiftUI

extension AuthorisationView {
    
    @MainActor class AuthorisationViewVM: ObservableObject {
        
        @Published var userLogin: String = ""
        @Published var password: String = ""
    }
}
