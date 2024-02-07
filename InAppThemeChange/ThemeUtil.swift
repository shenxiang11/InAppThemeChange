//
//  ThemeUtil.swift
//  InAppThemeChange
//
//  Created by 香饽饽zizizi on 2024/2/7.
//

import SwiftUI

enum UserTheme: String, CaseIterable {
    case system
    case light
    case dark
}

class ThemeSettings: ObservableObject {
    @Published var applyedTheme: ColorScheme = .light
    @AppStorage("userTheme") var userTheme: UserTheme = .system

    init() {
        setApplyedTheme()
    }

    func setApplyedTheme() {
        switch userTheme {
        case .system:
            applyedTheme = UITraitCollection.current.userInterfaceStyle == .dark ? .dark : .light
        case .light:
            applyedTheme = .light
        case .dark:
            applyedTheme = .dark
        }
    }

}
