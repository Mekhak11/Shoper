//
//  ShoperApp.swift
//  Shoper
//
//  Created by Mekhak Ghapantsyan on 3/31/25.
//

import SwiftUI
import Nuke
@main
struct ShoperApp: App {
  
  @Environment(\.scenePhase) private var scenePhase
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onChange(of: scenePhase) { _, newPhase in
          if newPhase == .active {
            ImagePipeline.shared = ImagePipeline(configuration: .withDataCache)
          }
        }
    }
  }
  
}
