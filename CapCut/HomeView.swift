//
//  HomeView.swift
//  CapCut
//
//  Created by Mac on 22/07/2024.
//

import SwiftUI
import Combine

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
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Button {
                        userRegistration.toggle()
                    } label: {
                        Image(systemName: "person")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $userRegistration) {
                        UserRegistration()
                    }
                    Spacer()
                    HStack(spacing: 30) {
                        Text("Pro")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
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
                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/13)
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
                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/13)
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
                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/13)
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
                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/13)
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
                            .frame(width: UIScreen.main.bounds.width/6, height: UIScreen.main.bounds.height/13)
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
                        .frame(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.height/8)
                        .cornerRadius(5)
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                        }
                        .frame(width: UIScreen.main.bounds.width/10, height: UIScreen.main.bounds.height/22)
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
                        .font(.system(size: 25))
                        .foregroundColor(.black.opacity(0.7))
                    Text("Your projects will appear\n here.\nStart creating now.")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(Color.black.opacity(0.7))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .offset(y: -120)
    }
}

struct UserRegistration: View {
    @State var signInView = false
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
                    NavigationLink(destination: SignInView(viewModel: UserViewModel()), isActive: $signInView){
                        
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(false)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination:        HomeViewContents()) {
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
                    .font(.system(size: 18, weight: .bold))
                    .lineSpacing(3)
                    .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct SignInView: View {
    @State var show = false
    @State var isSecure = true
    @State var isTyping = false
    @State var showNewView = false
    @State var continueButton = false
    @State var showSignUpView = false
    @State var isValidate: Bool = false
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
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .fullScreenCover(isPresented: $showNewView) {
                            UserRegistration()
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
                        .font(isEmailFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
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
                        if isSecure {
                            SecureField(" Enter password", text: $viewModel.password)
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
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.black)
                    Button {
                        showSignUpView.toggle()
                    } label: {
                        Text("Sign up")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    }
                    .fullScreenCover(isPresented: $showSignUpView) {
                        SignUpView(viewModel: viewModel)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView: View {
    @State var isSecure = true
    @State var isTyping = false
    @State var showNewView = false
    @State var continueButton = false
    @State var fontButtonColor = Color.gray
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @FocusState var isEmailFocused: Bool
    @StateObject var viewModel: UserViewModel
    var body: some View {
        VStack {
           TopSignupView()
            Spacer()
                .frame(height: 100)
            VStack (spacing: 20){
                Text("What's your email address?")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                    .lineLimit(0)
                TextField(" Enter email address", text: $viewModel.email)
                    .padding()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .font(isEmailFocused ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                    .foregroundColor(viewModel.email.isValidEmail ? .black : .red)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                    .background(viewModel.email.isValidEmail ? .green : .gray.opacity(0.1))
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
                    
                    Task {
                        await viewModel.sendOtp()
                        if viewModel.otpSent {
                            showNewView = true
                        }
                    }
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(fontButtonColor)
                }
                .fullScreenCover(isPresented: $showNewView, content: {
                    ReceiveOtpView(viewModel: viewModel)
                })
                .frame(width: UIScreen.main.bounds.width/1.1, height: 50)
                .background(continueButtonColor)
                .cornerRadius(10)
                VStack {
                    Text("By continuing, you agree to our")
                        .foregroundColor(.black.opacity(0.5))
                    +
                    Text("Terms of\n Service")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text(" and")
                        .foregroundColor(.black.opacity(0.5))
                    +
                    Text(" Privacy Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                }
                .font(.system(size: 18, weight: .bold))
                .lineSpacing(3)
                .multilineTextAlignment(.center)
            }
        }
        Spacer()
    }
}

struct TopSignupView: View {
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
                .onTapGesture {
                    print("tap me")
                }
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.gray)
        }
    }
}

struct ReceiveOtpView: View {
    @State var showNewView = false
    @State var code = Array(repeating: "", count: 6)
    @State var continueButtonColor = Color.gray.opacity(0.2)
    @State var fontButtonColor = Color.gray
    @StateObject var viewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    @FocusState var focusedIndex: Int?
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    viewModel.navigateToHome.toggle()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $viewModel.showNewView) {
                    SignInView(viewModel: UserViewModel())
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
            Spacer()
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 40) {
                Text("Enter a 6-digit code")
                    .font(.system(size: 25, weight: .black))
                    .foregroundColor(.black)
                HStack {
                    ForEach(0..<6, id: \.self) {
                        index in
                        TextField("", text: $code[index], onEditingChanged: {_ in
                            if code.count == index + 1 {
                                
                            }
                        })
                            .padding()
                            .font((focusedIndex != 0) ? .system(size: 20, weight: .bold) : .system(size: 15, weight: .regular))
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                            .focused($focusedIndex, equals: index)
                            .textContentType(.oneTimeCode)
                            .overlay (
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(code[index].isEmpty ? Color.clear : Color(red: 0/255, green: 230/255, blue: 255/255), lineWidth: 1)
                            )
                            .onChange(of: code[index]) { newValue in
                                if !newValue.isEmpty || newValue.count == 1 {
                                    continueButtonColor = Color(red: 0/255, green: 230/255, blue: 255/255)
                                    fontButtonColor = .white
                                    if index < 5 {
                                        focusedIndex = index + 1
                                    }
                                } else if newValue.isEmpty {
                                    continueButtonColor = Color.gray.opacity(0.2)
                                    fontButtonColor = .gray
                                    if index > 0 {
                                        focusedIndex = index - 1
                                    }
                                }
                            }
                    }
                }
                Button {
                    Task {
                        await viewModel.verifyToken()
                        if viewModel.isTokenVerified {
                            viewModel.navigateToHome = true
                        }
                    }
                } label: {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(fontButtonColor)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    HomeView()
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
                        .padding()
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .fullScreenCover(isPresented: $showNewView) {
                    SignInView(viewModel: UserViewModel())
                }
                Spacer()
                .frame(width: 100)
                Text("Sign up")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.black)
                    .lineLimit(0)
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

struct TermsOfServiceModalView: View {
    @Binding var agreeAndContinueButton: Bool
    var body: some View {
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
                    Text("Terms of Service")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text("and\n acknowledge that you have read our\n")
                        .foregroundColor(.black.opacity(0.9))
                    +
                    Text("Privacy Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text("and")
                        .foregroundColor(.black.opacity(0.9))
                    +
                    Text("Cookies Policy")
                        .foregroundColor(Color(red: 0/255, green: 230/255, blue: 255/255))
                    +
                    Text("to\n learn how we collect, use, and share\n your data.")
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
            .frame(width: UIScreen.main.bounds.width/1.3, height: UIScreen.main.bounds.height/2)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
        }
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
