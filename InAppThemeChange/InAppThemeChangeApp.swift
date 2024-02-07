//
//  InAppThemeChangeApp.swift
//  InAppThemeChange
//
//  Created by 香饽饽zizizi on 2024/2/7.
//

import SwiftUI

@main
struct InAppThemeChangeApp: App {
    @StateObject private var settings = ThemeSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(settings.applyedTheme)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                    settings.setApplyedTheme()
                })
        }
        .environmentObject(settings)
    }
}
