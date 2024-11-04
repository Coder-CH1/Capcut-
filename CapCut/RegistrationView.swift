//
//  RegistrationView.swift
//  CapCut
//
//  Created by Mac on 25/10/2024.
//

import SwiftUI
import Photos

struct RegistrationView: View {
    @Binding var showingModal: Bool
    @Binding var isLoggedIn: Bool
    @State var signInView = false
    @State var sideMenu = false
    @State var player: AVPlayer
    @StateObject var viewModel = UserViewModel()
    @State var selectedVideoAsset: [PHAsset?]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 0) {
                    Image("capcut")
                        .font(.system(size: 10))
                    Text("Capcut")
                        .font(.system(size: 30, weight: .bold))
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
                                .font(.system(size: 25))
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
                    NavigationLink(destination: SignInView(isLoggedIn: $isLoggedIn, viewModel: UserViewModel(), selectedVideoAsset: selectedVideoAsset, player: player), isActive: $signInView){
                        
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(false)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination:      HomeViewContents(isLoggedIn: $isLoggedIn, showingModal: $showingModal, showSideMenu: $sideMenu, selectedVideoAsset: $selectedVideoAsset, player: $player)) {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    VStack {
                        Text("I have read and acknowledge the Capcut\n")
                            .foregroundColor(.black.opacity(0.5))
                        +
                        Text("Terms of Service")
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                        +
                        Text(" and")
                            .foregroundColor(.black.opacity(0.5))
                        +
                        Text(" Privacy Policy")
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    }
                    .font(.system(size: 16, weight: .bold))
                    .lineSpacing(3)
                    .multilineTextAlignment(.center)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.checkSession()
                isLoggedIn = viewModel.isLoggedIn
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(showingModal: .constant(false), isLoggedIn: .constant(false), player: AVPlayer(), selectedVideoAsset: [PHAsset()])
    }
}

struct SignInView: View {
    @State var show = false
    @State var previousView = false
    @State var showSignUpView = false
    @State var showingModal = false
    @State var sideMenu = false
    @State var fontButtonColor = Color.gray
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @Binding var isLoggedIn: Bool
    @FocusState var isEmailFocused: Bool
    @FocusState var isPasswordFocused: Bool
    @StateObject var viewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var selectedVideoAsset: [PHAsset?]
    @State var player: AVPlayer
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    previousView.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .fullScreenCover(isPresented: $previousView) {
                            RegistrationView(showingModal: $showingModal, isLoggedIn: $isLoggedIn, player: player, selectedVideoAsset: selectedVideoAsset)
                        }
                }
                Text("Sign in")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                Text("Help")
                    .onTapGesture {
                        print("tap me")
                    }
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: 100)
            VStack(spacing: 100) {
                HStack(spacing: 0) {
                    Image("capcut")
                        .font(.system(size: 10))
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
                        .font(isEmailFocused ? .system(size: 15, weight: .regular) : .system(size: 15, weight: .regular))
                        .foregroundColor(viewModel.email.isValidEmail ? .black : .red)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                        .background(viewModel.email.isValidEmail ? .green : .gray.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isEmailFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                        )
                        .focused($isEmailFocused)
                    ZStack(alignment: .trailing) {
                        if viewModel.isSecure {
                            SecureField(" Enter password", text: $viewModel.password)
                                .padding()
                                .keyboardType(.asciiCapable)
                                .font(isPasswordFocused ? .system(size: 15, weight: .regular) : .system(size: 15, weight: .regular))
                                .foregroundColor(viewModel.password.isValidPassword ? .black : .red)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                                .background(viewModel.password.isValidPassword ? .green : .gray.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                                )
                                .focused($isPasswordFocused)
                                .onChange(of: viewModel.password) { newValue in
                                    if !newValue.isEmpty {
                                        viewModel.isTyping = true
                                        continueButtonColor = Color(red: 0/255, green: 230/255, blue: 255/255)
                                        fontButtonColor = .white
                                    } else {
                                        viewModel.isTyping = false
                                        continueButtonColor = Color.gray.opacity(0.2)
                                        fontButtonColor = .gray
                                    }
                                }
                        } else {
                            TextField(" Enter password", text: $viewModel.password)
                                .padding()
                                .keyboardType(.asciiCapable)
                                .font(isPasswordFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                                .foregroundColor(viewModel.password.isValidPassword ? .black : .red)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                                .background(viewModel.password.isValidPassword ? .green : .gray.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(isPasswordFocused ? Color(red: 0/255, green: 230/255, blue: 255/255) : .clear, lineWidth: 1)
                                )
                                .focused($isPasswordFocused)
                                .onChange(of: viewModel.password) { newValue in
                                    if !newValue.isEmpty {
                                        viewModel.isTyping = true
                                    } else {
                                        viewModel.isTyping = false
                                    }
                                }
                        }
                        Button  {
                            viewModel.isSecure.toggle()
                        } label: {
                            if viewModel.isTyping {
                                Image(systemName: viewModel.isSecure ? "eyebrow" : "eye")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                    Button {
                        Task {
                            await viewModel.register()
                            if viewModel.isRegistered {
                                isLoggedIn = true
                                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            } else {
                                print("User registration failed\(viewModel.errorMessage)")
                            }
                        }
                    } label: {
                        Text("Sign up")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(fontButtonColor)
                    }
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(continueButtonColor)
                    .cornerRadius(10)
                    
                    Button {
                        Task {
                            await viewModel.login()
                            if viewModel.isLoggedIn {
                                viewModel.showNewView = true
                                isLoggedIn = true
                                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            } else {
                                print("Login user failed\(viewModel.errorMessage)")
                            }
                        }
                    } label: {
                        Text("Sign in")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(fontButtonColor)
                            .fullScreenCover(isPresented: $viewModel.showNewView) {
                                HomeView(isLoggedIn: $isLoggedIn, showSideMenu: $sideMenu, selectedVideoAsset: selectedVideoAsset, player: player)
                            }
                    }
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(continueButtonColor)
                    .cornerRadius(10)
                    
                    Spacer()
                    Button {
                        print("")
                    } label: {
                        Text("Forgot password?")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    }
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct TopSignupView: View {
    @State var showNewView = false
    @Binding var isLoggedIn: Bool
    @Environment(\.presentationMode) var presentationMode
    @State var selectedVideoAsset: [PHAsset?]
    @State var player: AVPlayer
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
                SignInView(isLoggedIn: $isLoggedIn, viewModel: UserViewModel(), selectedVideoAsset: selectedVideoAsset, player: player)
            }
            Text("Sign up")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.black)
            Text("Help")
                .onTapGesture {
                    print("tap me")
                }
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.gray)
        }
    }
}

struct ResetPasswordView: View {
    @State var isSecure = true
    @State var isTyping = false
    @State var continueButton = false
    @State var fontButtonColor = Color.gray
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @Binding var isLoggedIn: Bool
    @FocusState var isEmailFocused: Bool
    @StateObject var viewModel: UserViewModel
    @State var selectedVideoAsset: [PHAsset?]
    @State var player: AVPlayer
    var body: some View {
        VStack {
            ResetPasswordTopView(isLoggedIn: $isLoggedIn, selectedVideoAsset: selectedVideoAsset, player: player)
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
        ResetPasswordView(isLoggedIn: .constant(false), viewModel: UserViewModel(), selectedVideoAsset: [PHAsset()], player: AVPlayer())
    }
}

struct ResetPasswordTopView: View {
    @State var showingModal = false
    @State var showNewView = false
    @Binding var isLoggedIn: Bool
    @Environment(\.presentationMode) var presentationMode
    @State var selectedVideoAsset: [PHAsset?]
    @State var player: AVPlayer
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
                        RegistrationView(showingModal: $showingModal, isLoggedIn: $isLoggedIn, player: player, selectedVideoAsset: selectedVideoAsset)
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
