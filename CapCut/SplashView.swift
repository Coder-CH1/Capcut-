//
//  SplashScreen.swift
//  CapCut
//
//  Created by Mac on 07/10/2024.
//

import SwiftUI

struct SplashView: View {
    @State var isLoggedIn = false
    @State var isActive: Bool = false
    @State var sideMenu = false
    var body: some View {
        
        ZStack{
            if self.isActive{
                HomeView(isLoggedIn: $isLoggedIn, showSideMenu: $sideMenu)
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
            SplashView()
        }
    }
}
