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
import Photos
import AVKit

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
    @Published var selectedVideoAsset: [PHAsset] = []
    @Published var players: [String: AVPlayer] = [:]
    var client: Client
    var account: Account
    
    init(){
        self.client = Client()
            .setEndpoint("https://cloud.appwrite.io/v1")
            .setProject("6707cbf30012504010d3")
            .setSelfSigned()
        self.account = Account(client)
    }
    
    //MARK: - PERSIST USER SESSION/LOGIN SESSION -
    func checkStoredSession() async {
        if let token = UserDefaults.standard.string(forKey: "sessionToken") {
            self.sessionToken = token
            await checkSession()
        } else {
            await MainActor.run {
                isLoggedIn = false
            }
        }
    }
    
    //MARK: - CHECK USER SESSION -
    func checkSession() async {
        do {
            let session = try await account.getSession(sessionId: "current")
            await MainActor.run {
                isLoggedIn = true
                self.sessionToken = session.userId
            }
        } catch {
            await MainActor.run {
                self.isLoggedIn = false
                self.errorMessage = "No active session"
            }
        }
    }
    
    //MARK: - REGISTER USER -
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
    
    //MARK: - LOGIN USER -
    func login() async {
        await checkSession()
        if isLoggedIn {
            await MainActor.run {
                self.errorMessage = "User is already logged in"
            }
            return
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
            
            UserDefaults.standard.set(session.userId, forKey: "sessionToken")
        } catch {
            await MainActor.run {
                isLoggedIn = false
                self.errorMessage = "Error occured\(error.localizedDescription)"
            }
        }
    }
    
    //MARK: - FETCHING USER -
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
    
    //MARK: - LOGING USER OUT -
    func logout() async {
        do {
            _  = try await account.deleteSession(sessionId: "current")
            UserDefaults.standard.removeObject(forKey: "sessionToken")
            await MainActor.run {
                self.errorMessage = "Logged out successfully"
            }
        } catch {
            await MainActor.run {
                self.errorMessage = "Error occured \(error.localizedDescription)."
            }
        }
    }
    
    //MARK: - Method to request permission to access the Photos Library -
    func requestPhotosLibrary() {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                self.loadVideoAssets(selectedVideoAsset: self.selectedVideoAsset)
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = "Photo library access denied."
                }
            }
        }
    }
    
    //MARK: - Method to load Video assets from the users photo library into the app -
    func loadVideoAssets(selectedVideoAsset: [PHAsset]) {
        for asset in selectedVideoAsset {
            let options = PHVideoRequestOptions()
            options.isNetworkAccessAllowed = true
            
            PHImageManager.default().requestAVAsset(forVideo: asset, options: options) { avAsset, _, _ in
                DispatchQueue.main.async {
                    if let urlAsset = avAsset as? AVURLAsset {
                        let player = AVPlayer(url: urlAsset.url)
                        self.players[asset.localIdentifier] = player
                    }
                }
            }
        }
    }
}
