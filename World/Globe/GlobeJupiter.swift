//
//  GlobeJupiter.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// The Jupiter content for a volume.
struct Jupiter: View {
    @Environment(ViewModel.self) private var model

    @State private var jupiterEntity: JupiterEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    @State private var jupiter: JupiterEntity?

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                if jupiter == nil {
                    // Load the Venus entity only if it hasn't been loaded yet
                    let configuration = JupiterEntity.Configuration(
                        scale: 2.5, // Adjust scale as needed
                        position: .zero // Adjust position as needed
                    )
                    let jupiterEntity = await JupiterEntity(configuration: configuration)
                    content.add(jupiterEntity)
                    self.jupiter = jupiterEntity
                }
            } update: { content in
                guard let jupiterEntity = jupiter else { return }
                // Update the Jupiter entity configuration.
                jupiterEntity.update(
                    configuration: model.jupiterConfiguration,
                    animateUpdates: true
                )
            }
            .dragRotation(
                pitchLimit: .degrees(90),
                axRotateClockwise: axRotateClockwise,
                axRotateCounterClockwise: axRotateCounterClockwise
            )
            .alignmentGuide(.controlPanelGuide) { context in
                context[HorizontalAlignment.center]
            }
            .onAppear {
                configure(scale: 2.5, position: .zero)//ADD 'scale' and 'position' variables
            }

            JupiterControls()
                .offset(y: -70)
        }
        .onChange(of: model.isJupiterRotating) { _, isRotating in
            model.jupiterConfiguration.speed = isRotating ? 0.1 : 0
        }
        .onDisappear {
            model.isShowingJupiter = false
        }
    }

    private func configure(scale: Float, position: SIMD3<Float>) {//ADD 'scale' and 'position' variables
        guard let jupiter = jupiter else { return }
        jupiter.update(configuration: JupiterEntity.Configuration(scale: 2.5, position: .zero), animateUpdates: false)
        print("Jupiter configured with position: \(position) and scale: \(scale)")
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Jupiter.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    /*
    /// A custom alignment guide to center the control panel under Jupiter.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )*/
}

#Preview {
    Jupiter()
        .environment(ViewModel())
}
