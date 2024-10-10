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
    @Published var password = ""
    @Published var dateOfBirth = ""
    @Published var nickname = ""
    @Published var digitNumber = ""
    @Published var errorMessage = ""
    @Published var otpSent: Bool = false
    func signIn() {
        guard !email.isEmpty && !password.isEmpty else {
            return
        }
    }
}
