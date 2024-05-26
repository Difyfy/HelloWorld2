//
//  MarsEntity.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/20.
//  Copyright © 2024 Apple. All rights reserved.
//

import RealityKit
import SwiftUI
import WorldAssets

/// An entity that represents Mars and its configuration.
class MarsEntity: Entity {

    // MARK: - Sub-entities

    /// The model that draws Mars's surface features.
    private var marsSolar: Entity = Entity()

    // MARK: - Initializers

    /// Creates a new blank Mars entity.
    @MainActor required init() {
        super.init()
    }

    /// Creates a new Mars entity with the specified configuration.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Mars.
    init(configuration: Configuration) async {
        super.init()

        // Load the Mars model.
        guard let marsSolar = await WorldAssets.entity(named: "MarsSolar") else { return }
        self.marsSolar = marsSolar

        // Attach the Mars model to the entity.
        self.addChild(marsSolar)

        // Configure everything for the first time.
        update(configuration: configuration, animateUpdates: false)
    }

    // MARK: - Updates

    /// Updates all the entity's configurable elements.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Mars.
    ///   - animateUpdates: A Boolean that indicates whether changes to certain
    ///     configuration values should be animated.
    func update(configuration: Configuration, animateUpdates: Bool) {
        // Set the rotation of Mars.
        marsSolar.orientation = configuration.rotation

        // Set the speed of Mars's rotation on its axis.
        if var rotation: RotationComponent = marsSolar.components[RotationComponent.self] {
            rotation.speed = configuration.currentSpeed
            marsSolar.components[RotationComponent.self] = rotation
        } else {
            marsSolar.components.set(RotationComponent(speed: configuration.currentSpeed))
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

    /// Create an accessibility component suitable for the Mars entity.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Mars.
    /// - Returns: A new accessibility component.
    private func makeAxComponent(configuration: Configuration) -> AccessibilityComponent {
        // Create an accessibility component.
        var axComponent = AccessibilityComponent()
        axComponent.isAccessibilityElement = true

        // Add a label.
        axComponent.label = "Mars model"

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

