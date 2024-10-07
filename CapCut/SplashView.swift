//
//  SplashScreen.swift
//  CapCut
//
//  Created by Mac on 07/10/2024.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        ZStack{
            if self.isActive{
                HomeView()
            } else {
                Color.white.ignoresSafeArea()
                HStack {
                    Image(systemName: "")
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
