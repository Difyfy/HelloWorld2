//
//  GlobeSaturn.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// The Saturn content for a volume.
struct Saturn: View {
    @Environment(ViewModel.self) private var model

    @State private var saturnEntity: SaturnEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    @State private var saturn: SaturnEntity?

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                if saturn == nil {
                    // Load the Saturn entity only if it hasn't been loaded yet
                    let configuration = SaturnEntity.Configuration(
                        scale: 1.8, // Adjust scale as needed
                        position: .zero // Adjust position as needed
                    )
                    let saturnEntity = await SaturnEntity(configuration: configuration)
                    content.add(saturnEntity)
                    self.saturn = saturnEntity
                }
            } update: { content in
                guard let saturnEntity = saturn else { return }
                // Update the Saturn entity configuration.
                saturnEntity.update(
                    configuration: model.saturnConfiguration,
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
                configure(scale: 1.8, position: .zero)//ADD 'scale' and 'position' variables
            }

            SaturnControls()
                .offset(y: -70)
        }
        .onChange(of: model.isSaturnRotating) { _, isRotating in
            model.saturnConfiguration.speed = isRotating ? 0.1 : 0
        }
        .onDisappear {
            model.isShowingSaturn = false
        }
    }

    private func configure(scale: Float, position: SIMD3<Float>) {//ADD 'scale' and 'position' variables
        guard let saturn = saturn else { return }
        saturn.update(configuration: SaturnEntity.Configuration(scale: 1.8, position: .zero), animateUpdates: false)
        print("Saturn configured with position: \(position) and scale: \(scale)")
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Saturn.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    /*
    /// A custom alignment guide to center the control panel under Saturn.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )*/
}

#Preview {
    Saturn()
        .environment(ViewModel())
}
