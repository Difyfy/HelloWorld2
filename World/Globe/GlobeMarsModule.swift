//
//  MarsInfoModule.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/26.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

/// The module detail content that's specific to the Mars module.
struct MarsModule: View {
    var body: some View {
        Image("SolarHero")//Was MarsHero
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    MarsModule()
        .padding()
}

