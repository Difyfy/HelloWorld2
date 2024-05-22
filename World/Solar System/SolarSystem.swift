/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The model content for the solar system module.
*/

import SwiftUI
import RealityKit

/// The model content for the solar system module.
struct SolarSystem: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        ZStack {
            Earth(
                earthConfiguration: model.solarEarth,
                satelliteConfiguration: [model.solarSatellite],
                moonConfiguration: model.solarMoon
            )

            Sun(
                scale: 350,//WAS 50
                position: model.solarSunPosition
            )
            
            //I am ADDING the code for Mars into the Solar System
            Mars(
                            scale: 20, // Adjust scale as needed WAS 1
                            position: model.solarMarsPosition // Use the new solarMarsPosition
                        )
            
            Starfield()
        }
        .onAppear {
            model.isShowingSolar = true
            var announcement = AttributedString("Entered the immersive star filled solar system!")
            announcement.accessibilitySpeechAnnouncementPriority = .high
            AccessibilityNotification.Announcement(announcement).post()
        }
        .onDisappear {
            model.isShowingSolar = false
        }
    }
}
