//
//  SaturnEntity.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import RealityKit
import SwiftUI
import WorldAssets

/// An entity that represents Saturn and its configuration.
class SaturnEntity: Entity {

    // MARK: - Sub-entities

    /// The model that draws Saturn's surface features.
    private var saturn: Entity = Entity()

    // MARK: - Initializers

    /// Creates a new blank Saturn entity.
    @MainActor required init() {
        super.init()
    }

    /// Creates a new Saturn entity with the specified configuration.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Saturn.
    init(configuration: Configuration) async {
        super.init()

        // Load the Saturn model.
        guard let saturn = await WorldAssets.entity(named: "Saturn") else { return }
        self.saturn = saturn

        // Attach the Saturn model to the entity.
        self.addChild(saturn)

        // Configure everything for the first time.
        update(configuration: configuration, animateUpdates: false)
    }

    // MARK: - Updates

    /// Updates all the entity's configurable elements.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Saturn.
    ///   - animateUpdates: A Boolean that indicates whether changes to certain
    ///     configuration values should be animated.
    func update(configuration: Configuration, animateUpdates: Bool) {
        // Set the rotation of Saturn.
        saturn.orientation = configuration.rotation

        // Set the speed of Saturn's rotation on its axis.
        if var rotation: RotationComponent = saturn.components[RotationComponent.self] {
            rotation.speed = configuration.currentSpeed
            saturn.components[RotationComponent.self] = rotation
        } else {
            saturn.components.set(RotationComponent(speed: configuration.currentSpeed))
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

    /// Create an accessibility component suitable for the Saturn entity.
    ///
    /// - Parameters:
    ///   - configuration: Information about how to configure Saturn.
    /// - Returns: A new accessibility component.
    private func makeAxComponent(configuration: Configuration) -> AccessibilityComponent {
        // Create an accessibility component.
        var axComponent = AccessibilityComponent()
        axComponent.isAccessibilityElement = true

        // Add a label.
        axComponent.label = "Saturn model"

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
