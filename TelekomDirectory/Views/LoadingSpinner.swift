//
//  LoadingSpinner.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import SwiftUI

struct LoadingSpinner: View {
    var body: some View {
        
        
        ProgressView()
            .progressViewStyle(
                CircularProgressViewStyle()
            )
            .tint(.purpleRed)
            .accessibilityLabel("Loading")
    }
}

#Preview {
    BackgroundViewWrapper{
        LoadingSpinner()
    }
}
