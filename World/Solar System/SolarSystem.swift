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
            //The SUN
            Sun(scale: 50, position: [0, 0, 0]
                /*scale: 100,//WAS 50
                position: [0, 0, 0]//model.solarSunPosition*/
            )
            //The PLANETS
            Mercury(scale: 15, position: [70, 0, 10]
                /*scale: 10, // Adjust scale as needed WAS 1
                position: model.solarMercuryPosition // Use the new solarMercuryPosition*/
            )
            Venus(scale: 22, position: [85, 0, 0]
                /*scale: 17, // Shoud be 17
                position: model.solarVenusPosition // Use the new solarVenusPosition*/
            )
            Earth(
                earthConfiguration: model.solarEarth,
                satelliteConfiguration: [model.solarSatellite],
                moonConfiguration: model.solarMoon
            )

            //I am ADDING the code for Mars into the Solar System
            Mars(scale: 45, position: [115, 0, -10]
                /*scale: 30, // Adjust scale as needed WAS 1
                position: model.solarMarsPosition // Use the new solarMarsPosition*/
            )
            Jupiter(scale: 95, position: [230, 0, 0]
                /*scale: 66, // Adjust scale as needed WAS 1
                position: model.solarJupiterPosition // Use the new solarJupiterPosition*/
            )
            Saturn(scale: 90, position: [360, 0, 0]
                /*scale: 54, // Adjust scale as needed Should be 60
                position: model.solarSaturnPosition // Use the new solarSaturnPosition*/
            )
            Uranus(scale: 40, position: [420, 0, 0]
                /*scale: 30, // Adjust scale as needed Should be 50
                position: model.solarUranusPosition // Use the new solarUranusPosition*/
            )
            Neptune(scale: 39, position: [470, 0, 0]
                /*scale: 28, // Adjust scale as needed Should be 50
                position: model.solarNeptunePosition // Use the new solarNeptunePosition*/
            )
            
            Starfield()
            
            //ADDING A CAMERA
            
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
