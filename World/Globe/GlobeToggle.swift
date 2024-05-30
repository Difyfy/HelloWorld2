/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A toggle that activates or deactivates the globe volume.
*/
/*
import SwiftUI

/// A toggle that activates or deactivates the globe volume.
struct GlobeToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        @Bindable var model = model

        Toggle(Module.globe.callToAction, isOn: $model.isShowingGlobe)
            .onChange(of: model.isShowingGlobe) { _, isShowing in
                if isShowing {
                    openWindow(id: Module.globe.name)
                } else {
                    dismissWindow(id: Module.globe.name)
                }
            }
            .toggleStyle(.button)
            .toggleStyle(.button)
    }
}

#Preview {
    GlobeToggle()
        .environment(ViewModel())
}
*/
import SwiftUI

/// A toggle that activates or deactivates the globe volume.
struct GlobeToggle: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        @Bindable var model = model
        VStack {
            HStack {
                Toggle("View Sun", isOn: $model.isShowingGlobe)
                    .onChange(of: model.isShowingGlobe) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeSun")//WAS Module.globe.name
                        } else {
                            dismissWindow(id: "GlobeSun")
                        }
                    }
                    .toggleStyle(.button)
                
                Toggle("View Mercury", isOn: $model.isShowingMercury)
                    .onChange(of: model.isShowingMercury) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeMercury")
                        } else {
                            dismissWindow(id: "GlobeMercury")
                        }
                    }
                    .toggleStyle(.button)
                
                Toggle("View Venus", isOn: $model.isShowingVenus)
                    .onChange(of: model.isShowingVenus) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeVenus")
                        } else {
                            dismissWindow(id: "GlobeVenus")
                        }
                    }
                    .toggleStyle(.button)
                
                }
            
            HStack {
                Toggle(Module.globe.callToAction, isOn: $model.isShowingGlobe)
                    .onChange(of: model.isShowingGlobe) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeEarth")//WAS Module.globe.name
                        } else {
                            dismissWindow(id: "GlobeEarth")
                        }
                    }
                    .toggleStyle(.button)
                                
                Toggle("View Mars", isOn: $model.isShowingMars)
                    .onChange(of: model.isShowingMars) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeMars")//This 'id' RELATES to defining the window in "WorldApp" I get it!
                        } else {
                            dismissWindow(id: "GlobeMars")
                        }
                    }
                    .toggleStyle(.button)
                
                Toggle("View Jupiter", isOn: $model.isShowingJupiter)
                    .onChange(of: model.isShowingJupiter) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeJupiter")//This 'id' RELATES to defining the window in "WorldApp" I get it!
                        } else {
                            dismissWindow(id: "GlobeJupiter")
                        }
                    }
                    .toggleStyle(.button)
                }
            
            HStack {
                Toggle("View Saturn", isOn: $model.isShowingSaturn)
                    .onChange(of: model.isShowingSaturn) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeSaturn")
                        } else {
                            dismissWindow(id: "GlobeSaturn")
                        }
                    }
                    .toggleStyle(.button)
                Toggle("View Uranus", isOn: $model.isShowingUranus)
                    .onChange(of: model.isShowingUranus) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeUranus")//This 'id' RELATES to defining the window in "WorldApp" I get it!
                        } else {
                            dismissWindow(id: "GlobeUranus")
                        }
                    }
                    .toggleStyle(.button)
                
                Toggle("View Neptune", isOn: $model.isShowingNeptune)
                    .onChange(of: model.isShowingNeptune) { _, isShowing in
                        if isShowing {
                            openWindow(id: "GlobeNeptune")//This 'id' RELATES to defining the window in "WorldApp" I get it!
                        } else {
                            dismissWindow(id: "GlobeNeptune")
                        }
                    }
                    .toggleStyle(.button)
                }
            }
        }
}

/*
#Preview {
    GlobeToggle()
        .environment(ViewModel())
}*/









/*==================THIS IS THE ORIGINAL FILE===============================*/
/*
 import SwiftUI

 /// A toggle that activates or deactivates the globe volume.
 struct GlobeToggle: View {
     @Environment(ViewModel.self) private var model
     @Environment(\.openWindow) private var openWindow
     @Environment(\.dismissWindow) private var dismissWindow

     var body: some View {
         @Bindable var model = model

         Toggle(Module.globe.callToAction, isOn: $model.isShowingGlobe)
             .onChange(of: model.isShowingGlobe) { _, isShowing in
                 if isShowing {
                     openWindow(id: Module.globe.name)
                 } else {
                     dismissWindow(id: Module.globe.name)
                 }
             }
             .toggleStyle(.button)
     }
 }

 #Preview {
     GlobeToggle()
         .environment(ViewModel())
 }
 */
