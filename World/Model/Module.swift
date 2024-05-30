/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The modules that the app can present.
*/


import Foundation

/// A description of the modules that the app can present.
enum Module: String, Identifiable, CaseIterable, Equatable {
    case globe, orbit, solar
    var id: Self { self }
    var name: String { rawValue.capitalized }

    var eyebrow: String {
        switch self {
        case .globe:
            "THE COSMOS: The Visible Universe"//A Day in the Life
        case .orbit:
            "DARK MATTER: The Invisible Universe"//Our Nearby Neighbors
        case .solar:
            "The Integrated Universe"//Soaring Through Space
        }
    }

    var heading: String {
        switch self {
        case .globe:
            "Galaxies +"//Planet Earth
        case .orbit:
            "Dark Matter ="//Objects in Orbit
        case .solar:
            "The Universe"//The Solar System
        }
    }

    //FIRST TIER CONTENT: These are the text content of the OPENING QCard in the app
    var abstract: String {
        switch self {
        case .globe:
            "The Cosmos are the Visible part of the universe, and they include galaxies, planets and you. In the above image, everything in yellow represents the Cosmos."//A lot goes into making a day happen on Planet Earth! Discover how our globe turns and tilts to give us hot summer days, chilly autumn nights, and more.
        case .orbit:
            "There is a second - invisible - building component to the structure of the universe: Dark Matter. Everything black in the background image represents Dark Matter."//Get up close with different types of orbits to learn more about how satellites and other objects move in space relative to the Earth.
        case .solar:
            "As a whole, the universe is composed of 80% dark & 20% cosmic matter. Learning how they interact with each other teaches us how the universe works."//Take a trip to the solar system and watch how the Earth, Moon, and its satellites are in constant motion rotating around the Sun.
        }
    }
    
    //SECOND TIER CONTENT: These are the text content of the SECOND STAGE QCards in the app
    var overview: String {
        switch self {
        case .globe:
            "Made of visible baryonic matter, the Cosmos represents everything we can see with our eyes as we look out into the universe. Baryons, like neutrons and protons, are subatomic particles. It is the fact that Atoms have electrons and thus electromagnetic repulsion that makes baryonic matter SOLID & VISIBLE."
        case .orbit:
            "There is a second, non-baryonic form of matter, called Dark Matter. Since non-baryonic matter does not have protons, neutrons and electrons, it doesn't have the property of electronic repuslsion, which means it does not interact with light, and is non-selfinterfering. Hence dark matter is both NON-SOLID and INVISIBLE."
        case .solar:
            "The Universe is composed of both dark and baryonic matter - and their dynamics are interconnected. We thus cannot explain all the effects of visible matter, without understanding how dark matter interacts with, and impacts it. For it is the intersection of their interdependent behaviours that gives rise to the observable data we can see from earth. These effects include everything from redshift to gravitational lensing, to the Hubble tension.\n\nIn addition to the popular term \"dark matter,\" the invisible part of the universe is also known as the \"Cosmic Web\" because it is a one-piece structure that spans the entire universe, Lastly, dark matter is also known as the scaffolding of the universe, because the entire visible part of the universe is located - within it."
        }
    }

    var callToAction: String {
        switch self {
        case .globe: "View Earth"//View Globe
        case .orbit: "View Dark Matter"//Orbits
        case .solar: "How the Universe Works"//Outer Space
        }
    }

    static let funFacts = [
        "The Earth orbits the Sun on an invisible path called the ecliptic plane.",
        "All planets in the solar system orbit within 3°–7° of this plane.",
        "As the Earth orbits the Sun, its axial tilt exposes one hemisphere to more sunlight for half of the year.",
        "Earth's axial tilt is why different hemispheres experience different seasons."
    ]
}
