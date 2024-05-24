//
//  JupiterEntity.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import RealityKit
import SwiftUI
import WorldAssets

/// An entity that represents Jupiter and its configuration.
class JupiterEntity: Entity {

    // MARK: - Sub-entities

    /// The model that draws Jupiter's surface features.
    private var jupiter: Entity = Entity()

    // MARK: - Initializers

    /// Creates a new blank Jupiter entity.
    @MainActor required init() {
        super.init()
    }

    /// Creates a new Jupiter entity with the specified configuration.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Jupiter.
    init(configuration: Configuration) async {
        super.init()

        // Load the Jupiter model.
        guard let jupiter = await WorldAssets.entity(named: "Jupiter") else { return }
        self.jupiter = jupiter

        // Attach the Jupiter model to the entity.
        self.addChild(jupiter)

        // Configure everything for the first time.
        update(configuration: configuration, animateUpdates: false)
    }

    // MARK: - Updates

    /// Updates all the entity's configurable elements.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Jupiter.
    ///   - animateUpdates: A Boolean that indicates whether changes to certain
    ///     configuration values should be animated.
    func update(configuration: Configuration, animateUpdates: Bool) {
        // Set the rotation of Jupiter.
        jupiter.orientation = configuration.rotation

        // Set the speed of Jupiter's rotation on its axis.
        if var rotation: RotationComponent = jupiter.components[RotationComponent.self] {
            rotation.speed = configuration.currentSpeed
            jupiter.components[RotationComponent.self] = rotation
        } else {
            jupiter.components.set(RotationComponent(speed: configuration.currentSpeed))
        }

        // Set the sunlight, if corresponding controls have changed.
        setSunlight(intensity: configuration.currentSunIntensity)

        // Scale and position the entire entity.
        move(
            to: Transform(
                scale: SIMD3(repeating: configuration.scale),
                rotation: orientation,
                translation: configuration.position),
            relativeTo: parent)

        // Set an accessibility component on the entity.
        components.set(makeAxComponent(configuration: configuration))
    }

    /// Create an accessibility component suitable for the Jupiter entity.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Jupiter.
    /// - Returns: A new accessibility component.
    private func makeAxComponent(configuration: Configuration) -> AccessibilityComponent {
        // Create an accessibility component.
        var axComponent = AccessibilityComponent()
        axComponent.isAccessibilityElement = true

        // Add a label.
        axComponent.label = "Jupiter model"

        // Add a value that describes the model's current state.
        var axValue = configuration.currentSpeed != 0 ? "Rotating, " : "Not rotating, "
        axValue.append(configuration.showSun ? "with the sun shining, " : "with the sun not shining, ")
        axComponent.value = LocalizedStringResource(stringLiteral: axValue)

        // Add custom accessibility actions, if applicable.
        if !configuration.axActions.isEmpty {
            axComponent.customActions.append(contentsOf: configuration.axActions)
        }

        return axComponent
    }
}
