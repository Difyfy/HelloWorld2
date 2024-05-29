//
//  GlobeUranus.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// The Uranus content for a volume.
struct Uranus: View {
    @Environment(ViewModel.self) private var model

    @State private var uranusEntity: UranusEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    @State private var uranus: UranusEntity?

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                if uranus == nil {
                    // Load the Uranus entity only if it hasn't been loaded yet
                    let configuration = UranusEntity.Configuration(
                        scale: 2.5, // Adjust scale as needed
                        position: .zero // Adjust position as needed
                    )
                    let uranusEntity = await UranusEntity(configuration: configuration)
                    content.add(uranusEntity)
                    self.uranus = uranusEntity
                }
            } update: { content in
                guard let uranusEntity = uranus else { return }
                // Update the Uranus entity configuration.
                uranusEntity.update(
                    configuration: model.uranusConfiguration,
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

            UranusControls()
                .offset(y: -70)
        }
        .onChange(of: model.isUranusRotating) { _, isRotating in
            model.uranusConfiguration.speed = isRotating ? 0.1 : 0
        }
        .onDisappear {
            model.isShowingUranus = false
        }
    }

    private func configure(scale: Float, position: SIMD3<Float>) {//ADD 'scale' and 'position' variables
        guard let uranus = uranus else { return }
        uranus.update(configuration: UranusEntity.Configuration(scale: 2.5, position: .zero), animateUpdates: false)
        print("Venus configured with position: \(position) and scale: \(scale)")
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Uranus.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    /*
    /// A custom alignment guide to center the control panel under Uranus.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )*/
}

#Preview {
    Uranus()
        .environment(ViewModel())
}
