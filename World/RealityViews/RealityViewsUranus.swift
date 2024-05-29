//
//  File.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Uranus.
struct UranusSolar: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var uranusSolar: UranusEntity?

    var body: some View {
        RealityView { content in
            if uranusSolar == nil {
                // Load the Uranus entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual UranusEntity
                let configuration = UranusEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let uranusEntity = await UranusEntity(configuration: configuration)
                content.add(uranusEntity)
                self.uranusSolar = uranusEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let uranus = uranusSolar else { return }
        uranus.update(configuration: UranusEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Uranus configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    UranusSolar(scale: 1)
}
