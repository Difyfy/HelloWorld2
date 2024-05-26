//
//  Mars.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/20.
//  Copyright © 2024 Apple. All rights reserved.
//
import SwiftUI
import RealityKit
import WorldAssets

/// A model of Mars.
struct MarsSolar: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var marsSolar: MarsEntity?

    var body: some View {
        RealityView { content in
            if marsSolar == nil {
                // Load the Mars entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual MarsEntity
                let configuration = MarsEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let marsEntity = await MarsEntity(configuration: configuration)
                content.add(marsEntity)
                self.marsSolar = marsEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let mars = marsSolar else { return }
        mars.update(configuration: MarsEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Mars configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    MarsSolar(scale: 1)
}













/*
import SwiftUI
import RealityKit
import WorldAssets

/// A model of Mars.
struct Mars: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    /// The Mars entity that the view creates and stores for later updates.
    @State private var mars: Entity?

    var body: some View {
        RealityView { content in
            guard let mars = await WorldAssets.entity(named: "Mars") else {
                print("Failed to load Mars entity")
                return
            }
            print("Mars entity loaded successfully")

            content.add(mars)
            self.mars = mars
            configure()

        } update: { content in
            configure()
        }
        .onAppear {
            configure()
        }
    }

    /// Configures the model based on the current set of inputs.
    private func configure() {
        guard let mars = mars else { return }
                mars.scale = SIMD3(repeating: scale)
                mars.position = position
        //mars?.scale = SIMD3(repeating: scale)
        //mars?.position = position
        print("Mars configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    Mars(scale: 1)//Was 0.1
}*/

