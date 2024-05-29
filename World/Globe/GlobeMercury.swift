//
//  GlobeMercury.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// The Mercury content for a volume.
struct Mercury: View {
    @Environment(ViewModel.self) private var model

    @State private var mercuryEntity: MercuryEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    @State private var mercury: MercuryEntity?

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                if mercury == nil {
                    // Load the Mercury entity only if it hasn't been loaded yet
                    let configuration = MercuryEntity.Configuration(
                        scale: 2.5, // Adjust scale as needed
                        position: .zero // Adjust position as needed
                    )
                    let mercuryEntity = await MercuryEntity(configuration: configuration)
                    content.add(mercuryEntity)
                    self.mercury = mercuryEntity
                }
            } update: { content in
                guard let mercuryEntity = mercury else { return }
                // Update the Mercury entity configuration.
                mercuryEntity.update(
                    configuration: model.mercuryConfiguration,
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

            MercuryControls()
                .offset(y: -70)
        }
        .onChange(of: model.isMercuryRotating) { _, isRotating in
            model.mercuryConfiguration.speed = isRotating ? 0.1 : 0
        }
        .onDisappear {
            model.isShowingMercury = false
        }
    }

    private func configure(scale: Float, position: SIMD3<Float>) {//ADD 'scale' and 'position' variables
        guard let mercury = mercury else { return }
        mercury.update(configuration: MercuryEntity.Configuration(scale: 2.5, position: .zero), animateUpdates: false)
        print("Mercury configured with position: \(position) and scale: \(scale)")
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Mercury.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }
    /*
    /// A custom alignment guide to center the control panel under Mercury.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )*/
}

#Preview {
    Mercury()
        .environment(ViewModel())
}
