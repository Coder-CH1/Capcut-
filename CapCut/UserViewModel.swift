//
//  UserViewModel.swift
//  CapCut
//
//  Created by Mac on 06/10/2024.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var dateOfBirth = ""
    @Published var nickname = ""
    @Published var digitNumber = ""
    @Published var errorMessage = ""
    @Published var otpSent: Bool = false
    func isEmailValidator(valid: String) -> Bool {
        let pattern = "[A-Z0-9a-Z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: valid)
    }
    func signIn() {
        guard !email.isEmpty && !password.isEmpty else {
            return
        }
    }
}
