//
//  BackgroundView.swift
//  STS
//
//  Created by admin on 6/3/24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.darkBlue)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
