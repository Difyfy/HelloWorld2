//
//  AlignmentGuides.swift
//  World
//
//  Created by Jeqe wakaJehovah on 2024/05/26.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under Mars or Globe.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    /// A custom alignment guide to center the control panel.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )
}

