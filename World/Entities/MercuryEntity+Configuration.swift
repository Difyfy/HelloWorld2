//
//  MercuryEntity+Configuration.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

extension MercuryEntity {
    /// Configuration information for Mercury entities.
    struct Configuration {
        var scale: Float = 1.0
        var rotation: simd_quatf = .init(angle: 0, axis: [0, 1, 0])
        var speed: Float = 0
        var isPaused: Bool = false
        var position: SIMD3<Float> = .zero

        var showSun: Bool = true
        var sunIntensity: Float = 13//Was 10
        var sunAngle: Angle = .degrees(280)//Was 0

        var axActions: [LocalizedStringResource] = []

        var currentSpeed: Float {
            isPaused ? 0 : speed
        }

        var currentSunIntensity: Float? {
            showSun ? sunIntensity : nil
        }

        static var defaultConfiguration: Configuration = .init(
            scale: 2.5,//WAS 1.0
            speed: 0.05,
            position: [0, 0, 0]
        )
    }
}
