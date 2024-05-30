//
//  Neptune.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Neptune.
struct NeptuneSolar: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var neptuneSolar: NeptuneEntity?

    var body: some View {
        RealityView { content in
            if neptuneSolar == nil {
                // Load the Neptune entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual NeptuneEntity
                let configuration = NeptuneEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let neptuneEntity = await NeptuneEntity(configuration: configuration)
                content.add(neptuneEntity)
                self.neptuneSolar = neptuneEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let neptune = neptuneSolar else { return }
        neptune.update(configuration: NeptuneEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Neptune configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    NeptuneSolar(scale: 1)
}
