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
    @Published var navigateToHome = false
    @Published var isTokenVerified = false
    @Published var otpSent: Bool = false
    
    var client: Client
    var account: Account
    
    init(){
        self.client = Client()
                .setEndpoint("https://cloud.appwrite.io/v1")
                .setProject("6707cbf30012504010d3")
                .setSelfSigned()
        self.account = Account(client)
    }
    
    func sendOtp() async {
        do {
            _ = try await account.createEmailToken(userId: ID.unique(), email: email)
            await MainActor.run {
                otpSent = true
                errorMessage = "Otp sent to \(email)"
            }
        } catch {
            await MainActor.run {
                errorMessage = "Error occured"
            }
        }
    }
    
    func verifyToken() async {
        do {
            _ = try await account.createSession(userId: ID.unique(), secret: token)
            await MainActor.run {
                isTokenVerified = true
                errorMessage = "Token verified successfully"
            }
        } catch {
            await MainActor.run {
                errorMessage = "Error occured"
            }
        }
    }
    
    func login() async {
            do {
                let session = try await account.createEmailPasswordSession(
                    email: email,
                    password: password
                )
                await MainActor.run {
                    self.errorMessage = "Logged in successfully: \(session.userId)"
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = "Error occured"
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
                self.errorMessage = "Error occured."
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
                self.errorMessage = "Error occured."
            }
        }
    }
    
}
