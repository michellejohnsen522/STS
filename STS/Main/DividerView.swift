//
//  DividerView.swift
//  STS
//
//  Created by admin on 6/3/24.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(width: screenSize().width - 40, height: 1)
            .foregroundColor(.lightBlue.opacity(0.5))
    }
}

#Preview {
    DividerView()
}
