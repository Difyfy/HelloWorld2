//
//  Venus.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Venus.
struct Venus: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var venus: VenusEntity?

    var body: some View {
        RealityView { content in
            if venus == nil {
                // Load the Venus entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual VenusEntity
                let configuration = VenusEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let venusEntity = await VenusEntity(configuration: configuration)
                content.add(venusEntity)
                self.venus = venusEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let venus = venus else { return }
        venus.update(configuration: VenusEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Venus configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    Venus(scale: 1)
}
