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
    
    let endpoint: String?
    let projectId: String?
    let apiKey: String?
    let client: Client
    let account: Account
    
    @Published var email = ""
    @Published var password = ""
    @Published var dateOfBirth = ""
    @Published var nickname = ""
    @Published var digitNumber = ""
    @Published var errorMessage = ""
    @Published var otpSent: Bool = false
    
    init() {
        self.endpoint = Bundle.main.object(forInfoDictionaryKey: "APPWRITE_ENDPOINT") as? String
        self.projectId = Bundle.main.object(forInfoDictionaryKey: "APPWRITE_PROJECT_ID") as? String
        self.apiKey = Bundle.main.object(forInfoDictionaryKey: "APPWRITE_API_KEY") as? String
        self.client = Client()
            .setEndpoint(endpoint ?? "")
            .setProject(projectId ?? "")
            .setSelfSigned()
        self.account = Account(client)
    }
    
    func register() async {
        do {
           let user = try await account.create(userId: "", email: email, password: password)
            self.errorMessage = "User registered \(user.email)"
        } catch let error as AppwriteError {
            self.errorMessage = error.message
        } catch {
            self.errorMessage = "Error occured."
        }
    }
    func login() {}
    func logout() {}
}
