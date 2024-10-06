//
//  HomeView.swift
//  CapCut
//
//  Created by Mac on 22/07/2024.
//

import SwiftUI

struct HomeView: View {
    @State var showingModal = false
    var body: some View {
        ZStack {
            VStack {
                HomeViewContents()
                Spacer()
            }
            if !showingModal {
                TermsOfServiceModalView(agreeAndContinueButton: $showingModal)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeViewContents: View {
    @State var showMessage = true
    @State var userRegistration = false
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button {
                    userRegistration.toggle()
                } label: {
                    Image(systemName: "person")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $userRegistration) {
                    UserRegistration()
                }
                Spacer()
                HStack(spacing: 30) {
                    Text("Pro")
                        .font(.system(size: 20, weight: .bold))
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "bell")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    Button {
                        print("")
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                }
                .padding(.all)
            }
            .padding(.horizontal)
            VStack {
                HStack(spacing: 8) {
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "square.slash")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                            
                        }
                        .frame(width: 65, height: 65)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        Text("Remove background")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .lineLimit(2)
                    }
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "photo.artframe")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                        .frame(width: 65, height: 65)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        Text("Text to image")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "square.text.square")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                        .frame(width: 65, height: 65)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        Text("Photo editor")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "mail")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                        .frame(width: 65, height: 65)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        Text("Image enhancer")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "square.split.diagonal")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                        .frame(width: 65, height: 65)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        Text("Product photos")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
            }
            ZStack {
                Color.black.opacity(0.7)
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 100)
                    .cornerRadius(5)
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(width: 30, height: 30)
                    .background(.black)
                    .cornerRadius(5)
                    Text("New project")
                        .font(.system(size: 24, weight: .black))
                        .foregroundColor(.black)
                }
            }
            HStack(spacing: 220) {
                Text("Projects")
                    .font(.system(size: 24, weight: .black))
                    .foregroundColor(.black)
                
                Button {
                    
                } label: {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
            }
            Spacer()
                .frame(height: 20)
            VStack(alignment: .center, spacing: 30) {
                Image(systemName: "film")
                    .font(.system(size: 40))
                    .foregroundColor(.black.opacity(0.7))
                Text("Your projects will appear\n here.\nStart creating now.")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(Color.black.opacity(0.7))
            }
        }
    }
}

struct UserRegistration: View {
    @State var signInView = false
    var body: some View {
        VStack {
            VStack {
                Text("Capcut")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.black)
            }
            Spacer()
                .frame(height: 100)
            VStack(spacing: 20) {
                Button {
                    signInView.toggle()
                } label: {
                    HStack(spacing: 60) {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                        Text("Sign in with email")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                            .frame(width: 8)
                    }
                }
                .frame(width: UIScreen.main.bounds.width/1.2, height: 45)
                .cornerRadius(22)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .fullScreenCover(isPresented: $signInView) {
                    SignInView(viewModel: UserViewModel())
                }
                VStack {
                    Text("I have read and acknowledge the Capcut\n")
                        .foregroundColor(.black)
                    +
                    Text("Terms of Service")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(" and")
                        .foregroundColor(.black.opacity(0.9))
                    +
                    Text(" Privacy Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                }
                .font(.system(size: 18, weight: .bold))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
            }
        }
    }
}

struct SignInView: View {
    @State var isSecure = true
    @State var isTyping = false
    @State var showNewView = false
    @State var continueButton = false
    @State var showSignUpView = false
    @State var fontButtonColor = Color.gray
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @FocusState var isEmailFocused: Bool
    @FocusState var isPasswordFocused: Bool
    @StateObject var viewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .fullScreenCover(isPresented: $showNewView) {
                            UserRegistration()
                        }
                }
                Text("Sign in")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("Help")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 100)
            VStack(spacing: 100) {
                HStack {
                    Image(systemName: "")
                    Text("Capcut")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                }
                VStack(spacing: 20) {
                    TextField(" Enter email address", text: $viewModel.email)
                        .padding()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .font(isEmailFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                        .background(.gray.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isEmailFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                        )
                        .focused($isEmailFocused)
                    ZStack(alignment: .trailing) {
                        if isSecure {
                            SecureField(" Enter password", text: $viewModel.password)
                                .padding()
                                .keyboardType(.asciiCapable)
                                .font(isPasswordFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                                .padding()
                                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                                .background(.gray.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                                )
                                .focused($isPasswordFocused)
                                .onChange(of: viewModel.password) { newValue in
                                    if !newValue.isEmpty {
                                        isTyping = true
                                        continueButtonColor = Color(red: 0/255, green: 230/255, blue: 255/255)
                                        fontButtonColor = .white
                                    } else {
                                        isTyping = false
                                        continueButtonColor = Color.gray.opacity(0.2)
                                        fontButtonColor = .gray
                                    }
                                }
                        } else {
                            TextField(" Enter password", text: $viewModel.password)
                                .padding()
                                .keyboardType(.asciiCapable)
                                .font(isPasswordFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                                .padding()
                                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                                .background(.gray.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                                )
                                .focused($isPasswordFocused)
                                .onChange(of: viewModel.password) { newValue in
                                    if !newValue.isEmpty {
                                        isTyping = true
                                    } else {
                                        isTyping = false
                                    }
                                }
                        }
                        Button  {
                            isSecure.toggle()
                        } label: {
                            if isTyping {
                                Image(systemName: isSecure ? "eyebrow" : "eye")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                    Button {
                        continueButton.toggle()
                    } label: {
                        Text("Continue")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(fontButtonColor)
                    }
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(continueButtonColor)
                    .cornerRadius(10)
                    Button {
                        print("")
                    } label: {
                        Text("Forgot password?")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    }
                }
                Spacer()
                HStack {
                    Text("Don't have an account?")
                    Button {
                        showSignUpView.toggle()
                    } label: {
                        Text("Sign up")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    }
                    .fullScreenCover(isPresented: $showSignUpView) {
                        SendOtpView(viewModel: UserViewModel())
                    }
                }
            }
        }
    }
}

struct SendOtpView: View {
    @State var continueButton = false
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @State var fontButtonColor = Color.gray
    @FocusState var isEmailFocused: Bool
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        VStack {
            Text("")
        }
    }
}

struct TopView: View {
    @State var showNewView = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack(spacing: 100) {
            Button {
                presentationMode.wrappedValue.dismiss()
                showNewView.toggle()
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: $showNewView) {
                SignInView(viewModel: UserViewModel())
            }
            Text("Sign up")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.black)
            Text("Help")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.gray)
        }
    }
}

struct ReceiveOtpView: View {
    @State var continueButton = false
    @State var showNewView = false
    @State var code = Array(repeating: "", count: 6)
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @State var fontButtonColor = Color.gray
    @StateObject var viewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    @FocusState var isDigitNumFocused: Bool
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView(viewModel: UserViewModel())
                }
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("Help")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 40) {
                Text("Enter a 6-digit code")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                HStack {
                    ForEach(0..<6, id: \.self) {
                        index in
                        TextField("", text: $code[index])
                            .padding()
                            .font(isDigitNumFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                            .focused($isDigitNumFocused)
                            .overlay (
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(code[index].isEmpty ? Color.clear : Color(red: 0/255, green: 230/255, blue: 255/255), lineWidth: 1)
                            )
                            .onChange(of: code[index]) { newValue in
                                if !newValue.isEmpty {
                                    continueButtonColor = Color(red: 0/255, green: 230/255, blue: 255/255)
                                    fontButtonColor = .white
                                } else {
                                    continueButtonColor = Color.gray.opacity(0.2)
                                    fontButtonColor = .gray
                                }
                            }
                    }
                }
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(fontButtonColor)
                }
                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                .background(continueButtonColor)
                .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct ReceiveOtpView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveOtpView(viewModel: UserViewModel())
    }
}

struct CreatePasswordView: View {
    @State var isSecure = true
    @State var isTyping = false
    @State var continueButton = false
    @State var showNewView = false
    @State var fontButtonColor = Color.gray
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @State var code = Array(repeating: "", count: 6)
    @FocusState var isPasswordFocused: Bool
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: UserViewModel
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView(viewModel: UserViewModel())
                }
                .frame(width: 150)
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
            }
            .padding(.trailing, 140)
            Spacer()
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 40) {
                Text("Create password")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                ZStack(alignment: .trailing) {
                    if isSecure {
                        SecureField(" Enter password", text: $viewModel.password)
                            .padding()
                            .keyboardType(.asciiCapable)
                            .font(isPasswordFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                            .background(.gray.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                            )
                            .focused($isPasswordFocused)
                            .onChange(of: viewModel.password) { newValue in
                                if !newValue.isEmpty {
                                    isTyping = true
                                    continueButtonColor = Color(red: 0/255, green: 230/255, blue: 255/255)
                                    fontButtonColor = .white
                                } else {
                                    isTyping = false
                                    continueButtonColor = Color.gray.opacity(0.2)
                                    fontButtonColor = .gray
                                }
                            }
                    } else {
                        TextField(" Enter password", text: $viewModel.password)
                            .padding()
                            .keyboardType(.asciiCapable)
                            .font(isPasswordFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                            .padding()
                            .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                            .background(.gray.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                            )
                            .focused($isPasswordFocused)
                            .onChange(of: viewModel.password) { newValue in
                                if !newValue.isEmpty {
                                    isTyping = true
                                } else {
                                    isTyping = false
                                }
                            }
                    }
                    Button  {
                        isSecure.toggle()
                    } label: {
                        if isTyping {
                            Image(systemName: isSecure ? "eyebrow" : "eye")
                                .foregroundColor(.black)
                                .padding(.trailing, 10)
                        }
                    }
                }
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(fontButtonColor)
                }
                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                .background(continueButtonColor)
                .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView(viewModel: UserViewModel())
    }
}

struct CreateDateOfBirthView: View {
    @State var showNewView = false
    @State var continueButton = false
    @State var selectedDate = Date()
    @State var showDatePicker = false
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: UserViewModel
    var body: some View {
        VStack {
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView(viewModel: UserViewModel())
                }
                Spacer()
                    .frame(width: 140)
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                    .lineLimit(0)
            }
            .padding(.trailing,  140)
            Spacer()
                .frame(height: 100)
            VStack(alignment: .center, spacing: 30) {
                Text("When's your date of birth?")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                Text("To protect underage users, fill in your\n birthday. Your age information won't be\n shown publicly")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black.opacity(0.9))
                TextField(" Birthday", text: $viewModel.dateOfBirth)
                    .padding()
                    .keyboardType(.emailAddress)
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 55)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(5)
                    .onTapGesture {
                        showDatePicker = true
                    }
                    .onAppear() {
                        let dateformatter = DateFormatter()
                        dateformatter.dateFormat = "yyyy-MM-dd"
                        viewModel.dateOfBirth = dateformatter.string(from: selectedDate)
                    }
                    .sheet(isPresented: $showDatePicker) {
                        Color.red
                        DatePickerView(selectedDate: $selectedDate, dateString: $viewModel.dateOfBirth, isPresented: $showDatePicker)
                            .presentationDetents([.height(300)])
                    }
                
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .black))
                        .foregroundColor(.gray.opacity(0.5))
                }
                .frame(width: UIScreen.main.bounds.width/1.2, height: 50)
                .background(.gray.opacity(0.2))
                .cornerRadius(5)
            }
            Spacer()
                .frame(height: 350)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.white)
    }
}

struct CreateDateOfBirthView_Previews: PreviewProvider {
    static var previews: some View {
        CreateDateOfBirthView(viewModel: UserViewModel())
    }
}

struct CreateNicknameView: View {
    @State var showNewView = false
    @State var continueButton = false
    @FocusState var isNickNameFocused: Bool
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: UserViewModel
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    showNewView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView(viewModel: UserViewModel())
                }
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("Skip")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 100)
            VStack(spacing: 20) {
                Text(" Create nickname")
                    .font(.system(size: 30, weight: .black))
                Text("This can be anything you like and can be \n changed later. If you skip this step, you\n will be automatically assigned a default\n nickname.")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black.opacity(0.9))
                VStack(spacing: 50) {
                    TextField("Enter a nickname", text: $viewModel.nickname)
                        .padding()
                        .font(isNickNameFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                        .keyboardType(.emailAddress)
                        .frame(width: UIScreen.main.bounds.width/1.1, height: 55)
                        .background(.gray.opacity(0.1))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isNickNameFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                        )
                        .focused($isNickNameFocused)
                    Button {
                        continueButton.toggle()
                    } label: {
                        Text("Confirm")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.gray.opacity(0.4))
                    }
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 55)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(5)
                }
            }
            Spacer()
        }
    }
}

struct CreateNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNicknameView(viewModel: UserViewModel())
    }
}

struct TermsOfServiceModalView: View {
    @Binding var agreeAndContinueButton: Bool
    var body: some View {
        //VStack {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 20) {
                Text("Terms of Service and Privacy \n Policy")
                    .font(.system(size: 16, weight: .black))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.black)
                VStack {
                    Text("By tapping Agree and continue, you\n agree to Capcut's")
                        .foregroundColor(.black.opacity(0.9))
                    +
                    Text(" Terms of Service")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(" and\n acknowledge that you have read our\n")
                        .foregroundColor(.black.opacity(0.9))
                    +
                    Text("Privacy Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(" and")
                        .foregroundColor(.black.opacity(0.9))
                    +
                    Text(" Cookies Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(" to\n learn how we collect, use, and share\n your data.")
                }
                .font(.system(size: 14, weight: .bold))
                .lineSpacing(7)
                HStack(spacing: 10) {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                        .padding(.bottom, 30)
                    Text("You confirmed that you are \n over 13 years old to receive \n advertisements.")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black.opacity(0.9))
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                }
                Button(action: {
                    agreeAndContinueButton.toggle()
                }) {
                    Text("Agree and continue")
                        .font(.system(size: 16, weight: .black))
                        .shadow(color: .white,radius: 0, x: 0.1, y: 0.1)
                        .foregroundColor(.white)
                }
                .frame(width: UIScreen.main.bounds.width/1.6, height: 55)
                .background(Color(red: 0/255, green: 230/255, blue: 255/255))
                .cornerRadius(10)
                .shadow(color: .clear,radius: 0, x: 0, y: 0)
            }
            .frame(width: 300, height: 400)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
        }
        //}
    }
}

struct ResetPasswordView: View {
    @State var isSecure = true
    @State var isTyping = false
    @State var continueButton = false
    @State var fontButtonColor = Color.gray
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @FocusState var isEmailFocused: Bool
    @StateObject var viewModel: UserViewModel
    var body: some View {
        VStack {
            ResetPasswordTopView()
            Spacer()
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 10) {
                Text("Forgot password")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                Text("We'll email you a code to reset your password")
                    .font(.system(size: 15, weight: .black))
                    .foregroundColor(.gray)
                Spacer()
                    .frame(height: 20)
            }
            VStack(spacing: 20) {
                TextField("Enter email address", text: $viewModel.email)
                    .padding()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .font(isEmailFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isEmailFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                    )
                    .focused($isEmailFocused)
                    .onChange(of: viewModel.email) { newValue in
                        if !newValue.isEmpty {
                            isTyping = true
                            continueButtonColor = Color(red: 0/255, green: 230/255, blue: 255/255)
                            fontButtonColor = .white
                        } else {
                            isTyping = false
                            continueButtonColor = Color.gray.opacity(0.2)
                            fontButtonColor = .gray
                        }
                    }
                Button {
                    continueButton.toggle()
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(fontButtonColor)
                }
                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                .background(continueButtonColor)
                .cornerRadius(10)
            }
            Spacer()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView(viewModel: UserViewModel())
    }
}

struct ResetPasswordTopView: View {
    @State var showNewView = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack(spacing: 100) {
            Button {
                presentationMode.wrappedValue.dismiss()
                showNewView.toggle()
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .fullScreenCover(isPresented: $showNewView) {
                        UserRegistration()
                    }
            }
            Text("Reset")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.black)
            Text("Help")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.gray)
        }
    }
}

//struct VideoPicker: UIViewControllerRepresentable {
//
//    @Binding var video: VideoPlayer!
//    func makeUIViewController(context: Context) -> some UIViewController {
//        var config = PHPickerConfiguration()
//        config.filter = .videos
//        let picker = PHPickerViewController(configuration: config)
//        picker.delegate = context.coordinator
//        return picker
//    }
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
//
//    func makeCoordinator() -> () {
//
//    }
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(video)
//    }
//
//    class Coordinator: NSObject, PHPickerViewControllerDelegate {
//        let parent: VideoPicker
//        init(_ parent: VideoPicker) {
//            self.parent = parent
//        }
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            picker.dismiss(animated: true)
//        }
//    }
////    func makeCoordinator() -> Coordinator {
////        var parent: VideoPicker
////        return Coordinator(parent)
////    }
//}
