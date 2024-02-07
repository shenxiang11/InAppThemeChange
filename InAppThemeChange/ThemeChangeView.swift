//
//  ThemeChangeView.swift
//  InAppThemeChange
//
//  Created by 香饽饽zizizi on 2024/2/7.
//

import SwiftUI

struct ThemeChangeView: View {
    @EnvironmentObject private var settings: ThemeSettings

    var body: some View {
        let isDark = settings.applyedTheme == .dark

        VStack(spacing: 30) {
            Text("选择主题模式")
                .font(.title)
                .fontWeight(.semibold)

            Circle()
                .fill(isDark ? .blue : .red)
                .frame(width: 150, height: 150)
                .mask {
                    Circle()
                        .overlay {
                            Circle()
                                .offset(
                                    isDark ? CGSize(width: 30, height: -25) : CGSize(width: 150, height: -150)
                                )
                                .animation(.spring, value: isDark)
                                .blendMode(.destinationOut)
                        }
                }

            Picker(selection: $settings.userTheme) {
                Text("跟随系统").tag(UserTheme.system)
                Text("白天模式").tag(UserTheme.light)
                Text("夜间模式").tag(UserTheme.dark)
            } label: {
                Text("选项")
            }
            .pickerStyle(.segmented)

        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(.bg)
        )
        .padding()
        .environment(\.colorScheme, settings.applyedTheme)
        .onChange(of: settings.userTheme) { oldValue, newValue in
            settings.setApplyedTheme()
        }
    }
}

#Preview {
    ThemeChangeView()
        .environmentObject(ThemeSettings())
}
