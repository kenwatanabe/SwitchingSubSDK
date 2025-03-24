//
//  ContentView.swift
//  SampleApp
//
//  Created by kenjiwatanabe on 2025/03/24.
//

import SwiftUI
import MainSDK

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                let sdk = MainSDKManager.shared
                // ICカードスキャン処理を実行（結果はコンソールに出力される）
                sdk.processICCardScan()
            }) {
                Text("SDK処理を実行")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
