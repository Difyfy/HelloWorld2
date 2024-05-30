//
//  Jupiter.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Jupiter.
struct JupiterSolar: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var jupiterSolar: JupiterEntity?

    var body: some View {
        RealityView { content in
            if jupiterSolar == nil {
                // Load the Jupiter entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual JupiterEntity
                let configuration = JupiterEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let jupiterEntity = await JupiterEntity(configuration: configuration)
                content.add(jupiterEntity)
                self.jupiterSolar = jupiterEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let jupiter = jupiterSolar else { return }
        jupiter.update(configuration: JupiterEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Jupiter configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    JupiterSolar(scale: 1)
}
