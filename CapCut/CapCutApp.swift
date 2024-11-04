//
//  CapCutApp.swift
//  CapCut
//
//  Created by Mac on 13/07/2024.
//

import SwiftUI
import Photos

@main
struct CapCutApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(selectedVideoAsset: [PHAsset()], players: ["": AVPlayer()])
        }
    }
}
