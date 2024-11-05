//
//  SplashScreen.swift
//  CapCut
//
//  Created by Mac on 07/10/2024.
//

import SwiftUI
import Photos

struct SplashView: View {
    @State var isLoggedIn = false
    @State var isActive: Bool = false
    @State var sideMenu = false
    @State var selectedVideoAsset: [PHAsset]
    @State var players: [String: AVPlayer]
    var body: some View {
        
        ZStack{
            if self.isActive{
                HomeView(isLoggedIn: $isLoggedIn, showSideMenu: $sideMenu, selectedVideoAsset: selectedVideoAsset, players: players)
            } else {
                Color.white.ignoresSafeArea()
                HStack (spacing: 0){
                    Image("capcut")
                        .font(.system(size: 10))
                    Text("CapCut")
                        .font(.system(size: 35, weight: .black))
                        .foregroundColor(.black)
                }                
            }
            
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
    struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            SplashView(selectedVideoAsset: [PHAsset()], players: ["": AVPlayer()])
        }
    }
}
