//
//  Extension.swift
//  CapCut
//
//  Created by Mac on 25/07/2024.
//

import Foundation
import SwiftUI
import UIKit

extension Text {
    func coloredText(_ color: Color) -> Text {
        self.foregroundColor(color)
    }
}

struct DatePickerView: View {
    @Binding var selectedDate: Date
    @Binding var dateString: String
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(.wheel)
                .padding()
            Button ("Done") {
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd"
                dateString = dateformatter.string(from: selectedDate)
                isPresented = false
            }
            .padding()
        }
    }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

extension String {
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}
