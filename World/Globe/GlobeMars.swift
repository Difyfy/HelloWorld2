//
//  MarsInfo.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/26.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// The Mars content for a volume.
struct Mars: View {
    @Environment(ViewModel.self) private var model
    
    @State private var marsEntity: MarsEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                // Load the Mars entity.
                guard let marsEntity = try? await MarsEntity() else {
                    fatalError("Failed to load Mars entity.")
                }

                // Add the Mars entity to the scene.
                content.add(marsEntity)

                // Store the Mars entity in the state for later updates.
                self.marsEntity = marsEntity

            } update: { content in
                // Update the Mars entity configuration.
                marsEntity?.update(
                    configuration: model.marsConfiguration,
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

            MarsControls()
                .offset(y: -70)
        }
        .onChange(of: model.isMarsRotating) { _, isRotating in
            model.marsConfiguration.speed = isRotating ? 0.1 : 0
        }
        .onDisappear {
            model.isShowingMars = false
        }
    }
}
/*
extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Mars.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    /// A custom alignment guide to center the control panel under Mars.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )
}*/

#Preview {
    Mars()
        .environment(ViewModel())
}
