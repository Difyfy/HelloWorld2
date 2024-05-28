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
                        openWindow(id: "GlobeMars")
                    } else {
                        dismissWindow(id: "GlobeMars")
                    }
                }
                .toggleStyle(.button)
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
