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
    @Published var name = ""
    @Published var errorMessage = ""
    @Published var token = ""
    @Published var isTokenVerified = false
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
    
    func sendOtp() async {
        do {
            _ = try await account.createEmailToken(userId: ID.unique(), email: email)
            otpSent = true
            errorMessage = "Otp sent to \(email)"
        } catch {
            errorMessage = "Error occured"
        }
    }
    
    func verifyToken() async {
        do {
            _ = try await account.createSession(userId: ID.unique(), secret: token)
            isTokenVerified = true
            errorMessage = "Token verified successfully"
        } catch {
           errorMessage = "Error occured"
        }
    }
    
    func login() async {
            do {
                let session = try await account.createEmailPasswordSession(
                    email: email,
                    password: password
                )
                self.errorMessage = "Logged in successfully: \(session.userId)"
            } catch {
                self.errorMessage = "Error occured"
            }
        }

    
    func getUser() async {
        do {
            let user = try await account.get()
            self.errorMessage = "User email: \(user.email)"
        } catch {
            self.errorMessage = "Error occured."
        }
    }
    
    func logout() async {
        do {
        _  = try await account.deleteSession(sessionId: "current")
            self.errorMessage = "Logged out successfully"
        } catch {
            self.errorMessage = "Error occured."
        }
    }
    
}
