//
//  ContentView.swift
//  Country Flag Game
//
//  Created by daniell Escareno on 1/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var gameManager = GameManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20){
                    Text("Country Flag Game")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("Ready to test your skill?")
                }
                NavigationLink {
                    Question_View()
                        .environment(gameManager)
                } label: {
                    CustomButton(text: "Start")
                }
            }
            .foregroundStyle(.yellow)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cyan)
        }
    }
}

#Preview {
    ContentView()
}
