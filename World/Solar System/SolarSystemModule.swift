/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The module detail content that's specific to the solar system module.
*/

import SwiftUI

//This is the QCARD that is for the Dark Matter Module
/// The module detail content that's specific to the solar system module.
struct SolarSystemModule: View {
    var body: some View {
        Image("dark_matter")//SolarHero
            .resizable()
            .scaledToFit()
            .cornerRadius(40)
    }
}

#Preview {
    SolarSystemModule()
        .padding()
}
