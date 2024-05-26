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
                        openWindow(id: Module.globe.name)
                    } else {
                        dismissWindow(id: Module.globe.name)
                    }
                }
                .toggleStyle(.button)
            
            Toggle("Another Action", isOn: $model.isShowingAnotherFeature)
                .onChange(of: model.isShowingAnotherFeature) { _, isShowing in
                    // Define what happens when the second toggle is switched
                    if isShowing {
                        // Perform some action
                    } else {
                        // Perform some other action
                    }
                }
                .toggleStyle(.button)
        }
    }
}

#Preview {
    GlobeToggle()
        .environment(ViewModel())
}

