//
//  CustomButton.swift
//  Country Flag Game
//
//  Created by daniell Escareno on 1/6/26.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var backgroundColor: Color = .yellow
    var body: some View {
        Text(text)
            .foregroundColor(.cyan)
            .padding()
            .padding(.horizontal)
            .background(backgroundColor)
            .cornerRadius(25)
            .shadow(radius: 10)
    }
}

#Preview {
    CustomButton(text: "Next")
}
