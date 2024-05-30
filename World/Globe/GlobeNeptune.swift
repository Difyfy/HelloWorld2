//
//  GlobeNeptune.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// The Neptune content for a volume.
struct Neptune: View {
    @Environment(ViewModel.self) private var model

    @State private var neptuneEntity: NeptuneEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    @State private var neptune: NeptuneEntity?

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                if neptune == nil {
                    // Load the Neptune entity only if it hasn't been loaded yet
                    let configuration = NeptuneEntity.Configuration(
                        scale: 2.5, // Adjust scale as needed
                        position: .zero // Adjust position as needed
                    )
                    let neptuneEntity = await NeptuneEntity(configuration: configuration)
                    content.add(neptuneEntity)
                    self.neptune = neptuneEntity
                }
            } update: { content in
                guard let neptuneEntity = neptune else { return }
                // Update the Neptune entity configuration.
                neptuneEntity.update(
                    configuration: model.neptuneConfiguration,
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

            NeptuneControls()
                .offset(y: -70)
        }
        .onChange(of: model.isNeptuneRotating) { _, isRotating in
            model.neptuneConfiguration.speed = isRotating ? 0.1 : 0
        }
        .onDisappear {
            model.isShowingNeptune = false
        }
    }

    private func configure(scale: Float, position: SIMD3<Float>) {//ADD 'scale' and 'position' variables
        guard let neptune = neptune else { return }
        neptune.update(configuration: NeptuneEntity.Configuration(scale: 2.5, position: .zero), animateUpdates: false)
        print("Neptune configured with position: \(position) and scale: \(scale)")
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Neptune.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    /*
    /// A custom alignment guide to center the control panel under Neptune.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )*/
}

#Preview {
    Neptune()
        .environment(ViewModel())
}
