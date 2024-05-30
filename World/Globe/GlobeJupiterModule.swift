//
//  GlobeJupiterModule.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

/// The module detail content that's specific to the Jupiter module.
struct JupiterModule: View {
    var body: some View {
        Image("SolarHero")//Was MarsHero
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    JupiterModule()
        .padding()
}
