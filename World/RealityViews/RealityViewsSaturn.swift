//
//  Saturn.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Saturn.
struct Saturn: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var saturn: SaturnEntity?

    var body: some View {
        RealityView { content in
            if saturn == nil {
                // Load the Saturn entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual SaturnEntity
                let configuration = SaturnEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let saturnEntity = await SaturnEntity(configuration: configuration)
                content.add(saturnEntity)
                self.saturn = saturnEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let saturn = saturn else { return }
        saturn.update(configuration: SaturnEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Saturn configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    Saturn(scale: 1)
}
