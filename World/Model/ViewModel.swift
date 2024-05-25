/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The stored data for the app.
*/

import SwiftUI

/// The data that the app uses to configure its views.
@Observable
class ViewModel {
    
    // MARK: - Navigation
    var navigationPath: [Module] = []
    var titleText: String = ""
    var isTitleFinished: Bool = false
    var finalTitle: String = "Quantum Cosmology"//Hello World

    // MARK: - Globe
    var isShowingGlobe: Bool = false
    var globeEarth: EarthEntity.Configuration = .globeEarthDefault
    var isGlobeRotating: Bool = true //false
    var globeTilt: GlobeTilt = .none

    // MARK: - Orbit
    var isShowingOrbit: Bool = false
    var orbitEarth: EarthEntity.Configuration = .orbitEarthDefault
    var orbitSatellite: SatelliteEntity.Configuration = .orbitSatelliteDefault
    var orbitMoon: SatelliteEntity.Configuration = .orbitMoonDefault

    // MARK: - Solar System
    var isShowingSolar: Bool = false
    var solarEarth: EarthEntity.Configuration = .solarEarthDefault
    var solarSatellite: SatelliteEntity.Configuration = .solarTelescopeDefault
    var solarMoon: SatelliteEntity.Configuration = .solarMoonDefault
    
    //THIS IS DISTANCE of the Sun away from the Earth. I must put the Earth and moon at 700, and the Sun at ZERO!! ******************
    var solarSunDistance: Double = 500//Was 700
    var solarSunPosition: SIMD3<Float> {
        [Float(solarSunDistance * sin(solarEarth.sunAngle.radians)),
         0,
         Float(solarSunDistance * cos(solarEarth.sunAngle.radians))]
    }
    // MARK: - Mercury
    var solarMercuryDistance: Double = 68 // Example distance of Mercury from the Sun .. was 1200
    var solarMercuryPosition: SIMD3<Float> {
        [Float(solarMercuryDistance * sin(solarEarth.sunAngle.radians)),
         0,//WAS 0
         Float(solarMercuryDistance * cos(solarEarth.sunAngle.radians))]
    }
    // MARK: - Venus
    var solarVenusDistance: Double = 72 // Example distance of Venus from the Sun .. was 1200
    var solarVenusPosition: SIMD3<Float> {
        [Float(solarVenusDistance * sin(solarEarth.sunAngle.radians)),
         0,//WAS 0
         Float(solarVenusDistance * cos(solarEarth.sunAngle.radians))]
    }
    // MARK: - Mars
    var solarMarsDistance: Double = 84 // Example distance of Mars from the Sun .. was 1200
    var solarMarsPosition: SIMD3<Float> {
        [Float(solarMarsDistance * sin(solarEarth.sunAngle.radians)),
         0,//WAS 0
         Float(solarMarsDistance * cos(solarEarth.sunAngle.radians))]
    }
    // MARK: - Jupiter
    var solarJupiterDistance: Double = 120 // Example distance of Jupiter from the Sun .. was 1200
    var solarJupiterPosition: SIMD3<Float> {
        [Float(solarJupiterDistance * sin(solarEarth.sunAngle.radians)),
         0,//WAS 0
         Float(solarJupiterDistance * cos(solarEarth.sunAngle.radians))]
    }
    // MARK: - Saturn
    var solarSaturnDistance: Double = 150 // Example distance of Saturn from the Sun .. was 1200
    var solarSaturnPosition: SIMD3<Float> {
        [Float(solarSaturnDistance * sin(solarEarth.sunAngle.radians)),
         0,//WAS 0
         Float(solarSaturnDistance * cos(solarEarth.sunAngle.radians))]
    }
    // MARK: - Uranus
    var solarUranusDistance: Double = 170 // Example distance of Uranus from the Sun .. was 1200
    var solarUranusPosition: SIMD3<Float> {
        [Float(solarUranusDistance * sin(solarEarth.sunAngle.radians)),
         0,//WAS 0
         Float(solarUranusDistance * cos(solarEarth.sunAngle.radians))]
    }
    // MARK: - Neptune
    var solarNeptuneDistance: Double = 195 // Example distance of Neptune from the Sun .. was 1200
    var solarNeptunePosition: SIMD3<Float> {
        [Float(solarNeptuneDistance * sin(solarEarth.sunAngle.radians)),
         0,//WAS 0
         Float(solarNeptuneDistance * cos(solarEarth.sunAngle.radians))]
    }
}
