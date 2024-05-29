//
//  GlobeVenus.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// The Venus content for a volume.
struct Venus: View {
    @Environment(ViewModel.self) private var model

    @State private var venusEntity: VenusEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    @State private var venus: VenusEntity?

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                if venus == nil {
                    // Load the Venus entity only if it hasn't been loaded yet
                    let configuration = VenusEntity.Configuration(
                        scale: 2.5, // Adjust scale as needed
                        position: .zero // Adjust position as needed
                    )
                    let venusEntity = await VenusEntity(configuration: configuration)
                    content.add(venusEntity)
                    self.venus = venusEntity
                }
            } update: { content in
                guard let venusEntity = venus else { return }
                // Update the Venus entity configuration.
                venusEntity.update(
                    configuration: model.venusConfiguration,
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

            VenusControls()
                .offset(y: -70)
        }
        .onChange(of: model.isVenusRotating) { _, isRotating in
            model.venusConfiguration.speed = isRotating ? 0.1 : 0
        }
        .onDisappear {
            model.isShowingVenus = false
        }
    }

    private func configure(scale: Float, position: SIMD3<Float>) {//ADD 'scale' and 'position' variables
        guard let venus = venus else { return }
        venus.update(configuration: VenusEntity.Configuration(scale: 2.5, position: .zero), animateUpdates: false)
        print("Venus configured with position: \(position) and scale: \(scale)")
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Venus.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    /*
    /// A custom alignment guide to center the control panel under Venus.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )*/
}

#Preview {
    Venus()
        .environment(ViewModel())
}
