//
//  Mercury.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Mercury.
struct Mercury: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var mercury: MercuryEntity?

    var body: some View {
        RealityView { content in
            if mercury == nil {
                // Load the Mercury entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual MercuryEntity
                let configuration = MercuryEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let mercuryEntity = await MercuryEntity(configuration: configuration)
                content.add(mercuryEntity)
                self.mercury = mercuryEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let mercury = mercury else { return }
        mercury.update(configuration: MercuryEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Mercury configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    Mercury(scale: 1)
}
