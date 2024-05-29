//
//  GlobeVenusControls.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/28.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

/// Controls that people can use to manipulate Venus in a volume.
struct VenusControls: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        @Bindable var model = model

        HStack(spacing: 17) {
            Toggle(isOn: $model.marsConfiguration.showSun) {
                Label("Sun", systemImage: "sun.max")
            }

            Toggle(isOn: $model.isMarsRotating) {
                Label("Rotate", systemImage: "arrow.triangle.2.circlepath")
            }
        }
        .toggleStyle(.button)
        .buttonStyle(.borderless)
        .labelStyle(.iconOnly)
        .padding(12)
        .glassBackgroundEffect(in: .rect(cornerRadius: 50))
        .alignmentGuide(.controlPanelGuide) { context in
            context[HorizontalAlignment.center]
        }
        .accessibilitySortPriority(2)
    }
}

#Preview {
    VenusControls()
        .environment(ViewModel())
}
