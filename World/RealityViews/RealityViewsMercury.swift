//
//  Mercury.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/24.
//  Copyright © 2024 Apple. All rights reserved.
//
/*
import SwiftUI
import RealityKit
import WorldAssets

/// A model of Mercury.
struct MercurySolar: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    @State private var mercurySolar: MercuryEntity?

    var body: some View {
        RealityView { content in
            if mercurySolar == nil {
                // Load the Mercury entity only if it hasn't been loaded yet
                //This part of the code just CREATES the actual MercuryEntity
                let configuration = MercuryEntity.Configuration(
                    scale: scale,
                    position: position
                )
                //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                let mercuryEntity = await MercuryEntity(configuration: configuration)
                content.add(mercuryEntity)
                self.mercurySolar = mercuryEntity
            }
        }
        .onAppear {
            configure()
        }
    }

    private func configure() {
        guard let mercury = mercurySolar else { return }
        mercury.update(configuration: MercuryEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Mercury configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    MercurySolar(scale: 1)
}
*/

import SwiftUI
import RealityKit
import WorldAssets

/// A model of Mercury. //THIS STRUCT GIVES ME A 3D RENDERING PLUS BASIC CONTROLS, BUT NO COOL CONTROLS
/// //On the OTHER HAND: "GlobeMercury" gives me CONTROLS, but no Planet.
struct MercurySolar: View {
    var scale: Float = 2.5//was 1
    var position: SIMD3<Float> = .zero
    
    @Environment(ViewModel.self) private var model
    
    @State private var mercuryEntity: MercuryEntity?
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    
    @State private var mercurySolar: MercuryEntity?
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            RealityView { content in
                if mercurySolar == nil {
                    // Load the Mercury entity only if it hasn't been loaded yet
                    //This part of the code just CREATES the actual MercuryEntity
                    let configuration = MercuryEntity.Configuration(
                        scale: scale,
                        position: position
                    )
                    //This NEXT PART MAKES SURE IT IS ONLY LOADED ONCE!
                    let mercuryEntity = await MercuryEntity(configuration: configuration)
                    content.add(mercuryEntity)
                    self.mercurySolar = mercuryEntity
                }
            }
            .onAppear {
                configure()
            }
            //NEW CODE: Trying to ADD CONTROLS to the 3D Model!
            .onChange(of: model.isMercuryRotating) { _, isRotating in
                model.mercuryConfiguration.speed = isRotating ? 0.1 : 0
            }
            .onDisappear {
                model.isShowingMercury = false
            }
        }
    }
    
    private func configure() {
        guard let mercury = mercurySolar else { return }
        mercury.update(configuration: MercuryEntity.Configuration(scale: scale, position: position), animateUpdates: false)
        print("Mercury configured with position: \(position) and scale: \(scale)")
    }
}

#Preview {
    MercurySolar()
}
