//
// EmbedExamples.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct EmbedExamples: StaticPage {
    var title = "Embeds"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Embeds")
            .font(.title1)

        Text("Embeds let you place external content onto your page, such as YouTube or Vimeo videos.")
            .font(.lead)

        Alert {
            Text(markdown: "**Important:** Always attach an `aspectRatio()` modifier to embeds, so they scale correctly.")
        }
        .role(.warning)

        Text("For example, here's a YouTube video:")

        CodeBlock(language: "swift", """
        Embed(youTubeID: "dQw4w9WgXcQ", title: "There was only ever going to be one video used here.")
            .aspectRatio(.r16x9)
        """)

        Embed(youTubeID: "dQw4w9WgXcQ", title: "There was only ever going to be one video used here.")
            .aspectRatio(.r16x9)
            .margin(.bottom, .extraLarge)

        Text("Here's a Vimeo video:")

        CodeBlock(language: "swift", """
        Embed(vimeoID: 291590798, title: "Teaching Swift at Scale – Paul Hudson at NSSpain.")
            .aspectRatio(.r16x9)
        """)

        Embed(vimeoID: 291590798, title: "Teaching Swift at Scale – Paul Hudson at NSSpain.")
            .aspectRatio(.r16x9)
            .margin(.bottom, .extraLarge)

        Text("And here's a very important embedded website:")

        CodeBlock(language: "swift", """
        Embed(title: "Upgrade your Mac at Apple.com", url: URL("https://www.zombo.com"))
            .aspectRatio(.r16x9)
        """)

        Embed(title: "Upgrade your Mac at Apple.com", url: URL("https://www.zombo.com"))
            .aspectRatio(.r16x9)
    }
}
