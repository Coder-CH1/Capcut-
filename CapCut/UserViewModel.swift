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
    
    @Published var email = ""
    @Published var token = ""
    @Published var name = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var sessionToken: String?
    @Published var navigateToHome = false
    @Published var isTokenVerified = false
    @Published var isRegistered: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var showNewView = false
    @Published var continueButton = false
    @Published var isSecure = true
    @Published var isTyping = false
    @Published var showSignUpView = false
    @Published var isValidate: Bool = false
    
    var client: Client
    var account: Account
    
    init(){
        self.client = Client()
            .setEndpoint("https://cloud.appwrite.io/v1")
            .setProject("6707cbf30012504010d3")
            .setSelfSigned()
        self.account = Account(client)
    }
    
    func register() async {
        do {
            _  = try await account.create(
                userId: ID.unique(),
                email: email,
                password: password
            )
            await MainActor.run {
                isRegistered = true
                errorMessage = "User registered successfully \(email)"
            }
        } catch {
            await MainActor.run {
                errorMessage = "Error occured \(error.localizedDescription)"
            }
        }
    }
    
    func login() async {
        do {
            let session = try await account.getSession(sessionId: "current")
            await MainActor.run {
                isLoggedIn = true
                errorMessage = "User already logged in"
            }
        } catch {
            await MainActor.run {
                errorMessage = "Error occured"
            }
        }
        
        do {
            let session = try await account.createEmailPasswordSession(
                email: email,
                password: password
            )
            await getUser()
            await MainActor.run {
                isLoggedIn = true
                self.errorMessage = "Logged in successfully: \(session.userId)"
            }
        } catch {
            await MainActor.run {
                self.errorMessage = "Error occured\(error.localizedDescription)"
            }
        }
    }
    
    func getUser() async {
        do {
            let user = try await account.get()
            await MainActor.run {
                self.errorMessage = "User email: \(user.email)"
            }
        } catch {
            await MainActor.run {
                self.errorMessage = "Error occured \(error.localizedDescription)."
            }
        }
    }
    
    func logout() async {
        do {
            _  = try await account.deleteSession(sessionId: "current")
            await MainActor.run {
                self.errorMessage = "Logged out successfully"
            }
        } catch {
            await MainActor.run {
                self.errorMessage = "Error occured \(error.localizedDescription)."
            }
        }
    }
    
}
