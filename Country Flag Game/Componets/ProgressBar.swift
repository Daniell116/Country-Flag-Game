//
//  ProgressBar.swift
//  Country Flag Game
//
//  Created by daniell Escareno on 1/6/26.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundStyle(.yellow)
                .cornerRadius(10)
            Rectangle()
                .frame(maxWidth: progress, maxHeight: 4)
                .foregroundStyle(.yellow)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProgressBar(progress: 50)
}
