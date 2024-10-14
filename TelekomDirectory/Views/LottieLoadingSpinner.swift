//
//  LoadingSpinner.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/14/24.
//

import SwiftUI
import Lottie

struct LottieLoadingSpinner: View {
    var body: some View {
        
        LottieView(animation: .named("spinnerLottieAnimation"))
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
            .animationSpeed(2)
    }
}

#Preview {
    BackgroundViewWrapper{
        LottieLoadingSpinner()
    }
}
