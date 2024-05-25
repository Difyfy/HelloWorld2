//
//  Camera.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/25.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Mars.
struct Camera: View {
    
    var position: SIMD3<Float> = .zero

    /*@State private var camera: CameraEntity?*/

    var body: some View {
        RealityView { content in
            let camera = PerspectiveCamera()
            camera.transform.translation = [120, 50, 0]
            content.add(camera)
        }
    }
}

