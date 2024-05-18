/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The launching point for the app's modules.
*/

import SwiftUI

/// The launching point for the app's modules.
struct TableOfContents: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        @Bindable var model = model
        
        VStack {
            Image("SunSliver")//
                .opacity(model.isTitleFinished ? 1 : 0)
                .accessibility(hidden: true)

            Spacer(minLength: 80)//120 ... 280

            VStack {
                // A hidden version of the final text keeps the layout fixed
                // while the overlaid visible version types on.
                TitleText(title: model.finalTitle)
                    .padding(.horizontal, 70)
                    .hidden()
                    .overlay(alignment: .leading) {
                        TitleText(title: model.titleText)
                            .padding(.leading, 70)
                    }
                //This is the TEXT FOR THE OPENING QCARD! *****
                Text("EMBODIED COGNITION: Discover the only way to understand the universe.")//Discover a new way of looking at the world.
                    .font(.title)
                    .opacity(model.isTitleFinished ? 1 : 0)
            }
            .alignmentGuide(.earthGuide) { context in
                context[VerticalAlignment.top]
            }
            .padding(.bottom, 40)

            HStack(alignment: .top, spacing: 30) {
                ForEach(Module.allCases) {
                    ModuleCard(module: $0)
                }
            }
            .padding(.bottom, 50)
            .opacity(model.isTitleFinished ? 1 : 0)

            Spacer()
        }
        .padding(.horizontal, 50)
        .typeText(
            text: $model.titleText,
            finalText: model.finalTitle,
            isFinished: $model.isTitleFinished,
            isAnimated: !model.isTitleFinished)
        .background(alignment: Alignment(horizontal: .center, vertical: .earthGuide)) {
            Image("1024")//Was EarthHalf. 1024 is dark_matter_1024.png
                .resizable()
                .scaledToFill()
                .frame(width: 1400, height: 600, alignment: .topLeading)
                .alignmentGuide(.earthGuide) { context in
                    context[VerticalAlignment.top] + 300//100
                }
                .opacity(model.isTitleFinished ? 1 : 0)
                .accessibility(hidden: true)
        }
        .animation(.default.speed(0.25), value: model.isTitleFinished)
    }
}

/// The text that displays the app's title.
private struct TitleText: View {
    var title: String
    var body: some View {
        Text(title)
            .monospaced()
            .font(.system(size: 50, weight: .bold))
    }
}

extension VerticalAlignment {
    /// A custom alignment that pins the background image to the title.
    private struct EarthAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }

    /// A custom alignment guide that pins the background image to the title.
    fileprivate static let earthGuide = VerticalAlignment(
        EarthAlignment.self
    )
}

#Preview {
    NavigationStack {
        TableOfContents()
            .environment(ViewModel())
    }
}
