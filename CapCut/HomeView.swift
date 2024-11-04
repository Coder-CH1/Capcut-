//
//  HomeView.swift
//  CapCut
//
//  Created by Mac on 22/07/2024.
//

import SwiftUI
import SwiftUISideMenu
import Photos
import PhotosUI
import AVKit

struct HomeView: View {
    @Binding var isLoggedIn: Bool
    @Binding var showSideMenu: Bool
    @State var showingModal: Bool = !UserDefaults.standard.bool(forKey: "termsAccepted")
    @StateObject var userViewModel = UserViewModel()
    @State var showVideoPicker = false
    @State var selectedVideoAsset: [PHAsset]
    @State var player: [String: AVPlayer]
    var body: some View {
        ZStack {
            VStack {
                HomeViewContents(isLoggedIn: $isLoggedIn, showingModal: $showingModal, showSideMenu: $showSideMenu, selectedVideoAsset: $selectedVideoAsset, players: $player)
                Spacer()
            }
            if showingModal {
                TermsOfServiceModalView(agreeAndContinueButton: $showingModal)
                    .onDisappear {
                        UserDefaults.standard.set(true, forKey: "termsAccepted")
                    }
            }
                
        }
        .sideMenu(isShowing: $showSideMenu) {
            SideMenu(isLoggedIn: $isLoggedIn, showSideMenu: $showSideMenu, userViewModel: userViewModel)
                .edgesIgnoringSafeArea(.all)
            
        }
        .fullScreenCover(isPresented: $showVideoPicker) {
            VideoPicker(selectedVideoAsset: $userViewModel.selectedVideoAsset, userViewModel: userViewModel)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isLoggedIn: .constant(true), showSideMenu: .constant(false), selectedVideoAsset: [PHAsset()], player: ["": AVPlayer()])
    }
}

struct HomeViewContents: View {
    @Binding var isLoggedIn: Bool
    @Binding var showingModal: Bool
    @Binding var showSideMenu: Bool
    @State var showMessage = true
    @State var showRegistration = false
    @StateObject var userViewModel = UserViewModel()
    @State var showVideoPicker = false
    @Binding var selectedVideoAsset: [PHAsset]
    @Binding var players: [String: AVPlayer]
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Button {
                        if isLoggedIn {
                            withAnimation {
                                showSideMenu.toggle()
                                showingModal = false
                            }
                        } else {
                            showRegistration.toggle()
                        }
                    } label: {
                        Image(systemName: "person")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $showRegistration) {
                        RegistrationView(showingModal: $showingModal, isLoggedIn: $isLoggedIn, players: players, selectedVideoAsset: selectedVideoAsset)
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
                            showVideoPicker.toggle()
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
                            .fullScreenCover(isPresented: $showVideoPicker) {
                                VideoPicker(selectedVideoAsset: $userViewModel.selectedVideoAsset, userViewModel: userViewModel)
                            }
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
                    .frame(height: 50)
                if selectedVideoAsset.isEmpty {
                    PlaceholderView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 10) {
                            ForEach(selectedVideoAsset.compactMap{$0}, id: \.localIdentifier) { asset in
                                VideoPlayerView(asset: asset, player: Binding(
                                    get: {players[asset.localIdentifier]},
                                    set: {players[asset.localIdentifier] = $0}
                                ))
                                    .frame(height: 200)
                                    .cornerRadius(10)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .onAppear() {
                userViewModel.requestPhotosLibrary()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct VideoPlayerView: View {
    var asset: PHAsset
    @Binding var player: AVPlayer?
    
    var body: some View {
        if let player = player {
            VideoPlayer(player: player)
                .onAppear() {
                    player.play()
            }
                .onDisappear() {
                    player.pause()
            }
        } else {
            PlaceholderView()
        }
    }
}

struct PlaceholderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Image(systemName: "film")
                .font(.system(size: 25))
                .foregroundColor(.black.opacity(0.7))
            Text("Your projects will appear\n here.\nStart creating now.")
                .font(.system(size: 18, weight: .black))
                .foregroundColor(Color.black.opacity(0.7))
}
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
                    agreeAndContinueButton = false
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

struct SideMenu: View {
    @Binding var isLoggedIn: Bool
    @Binding var showSideMenu: Bool
    @ObservedObject var userViewModel: UserViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                } label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 60))
                        .background(.white)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(userViewModel.name.isEmpty ? "Nickname" : userViewModel.name)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                    Text(userViewModel.email.isEmpty ? "ID number" : userViewModel.email)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.gray)
                }
            }
            Spacer()
                .frame(height: 150)
            Rectangle()
                .fill(.black)
                .frame(height: 1)
            Text("Help Center")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
            Text("Manage Account")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
            Spacer()
                .frame(height: 350)
            Button {
                UserDefaults.standard.set(false, forKey: "isLoggedIn")
                isLoggedIn = false
                showSideMenu = false
            } label: {
                Text("Logout")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.black)
            }
        }
        .gesture(
            DragGesture()
                .onEnded({ value in
                    if value.translation.width < -50 {
                        withAnimation {
                            showSideMenu = false
                        }
                    }
                })
        )
        .padding()
        .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .leading)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct VideoPicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedVideoAsset: [PHAsset]
    @ObservedObject var userViewModel: UserViewModel
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some PHPickerViewController {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .videos
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: VideoPicker
        
        init(_ parent: VideoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            if results.isEmpty {
                return
            }
            for result in results {
                if let assetIdentifier = result.assetIdentifier {
                    let asset = PHAsset.fetchAssets(withLocalIdentifiers: [assetIdentifier], options: nil).firstObject
                    if let asset = asset {
                        DispatchQueue.main.async {
                            self.parent.selectedVideoAsset.append(asset)
                            self.parent.userViewModel.loadVideoAssets(selectedVideoAsset: self.parent.selectedVideoAsset)
                        }
                    }
                }
            }
        }
    }
}
