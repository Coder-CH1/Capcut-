//
//  UserViewModel.swift
//  CapCut
//
//  Created by Mac on 06/10/2024.
//

import Foundation
import Appwrite
import NIO
import SwiftUI

class UserViewModel: ObservableObject {
    let client = Client()
    @Published var email = ""
    @Published var password = ""
    @Published var dateOfBirth = ""
    @Published var nickname = ""
    @Published var digitNumber = ""
    @Published var errorMessage = ""
    @Published var otpSent: Bool = false
    
    let endpoint = Bundle.main.object(forInfoDictionaryKey: "APPWRITE_ENDPOINT") as? String
    let projectId = Bundle.main.object(forInfoDictionaryKey: "APPWRITE_PROJECT_ID") as? String
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "APPWRITE_API_KEY") as? String
    
    func register() {}
    func login() {}
    func logout() {}
}
