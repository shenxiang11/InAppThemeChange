//
//  ContentView.swift
//  InAppThemeChange
//
//  Created by 香饽饽zizizi on 2024/2/7.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var settings: ThemeSettings
    @State private var showSheet = false

    var body: some View {
        NavigationStack {
            List {
                Section("外观") {
                    Button {
                        showSheet = true
                    } label: {
                        Text("更改主题")
                    }
                }
            }
            .navigationTitle("设置")
        }
        .sheet(isPresented: $showSheet, content: {
            ThemeChangeView()
                .presentationBackground(.clear)
                .presentationDetents([.height(400)])
        })
        .preferredColorScheme(settings.applyedTheme)

    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeSettings())
}
