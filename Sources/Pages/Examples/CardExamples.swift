//
// CardExamples.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct CardExamples: StaticPage {
    var title = "Cards"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Cards")
            .font(.title1)

        Text("Cards provide a standard way of representing group information.")
            .font(.lead)

        Text("They have various options depending on what data you want to provide and how you want it to look.")

        Text("Here's an example card, with image, content, and a button going back to the homepage:")

        CodeBlock(language: "swift", """
        Card(imageName: "/images/photos/dishwasher.jpg") {
            Text("Before putting your dishes into the dishwasher, make sure and give them a quick pre-clean.")

            Link("Back to the homepage", target: "/")
                .linkStyle(.button)
        }
        .frame(maxWidth: 300)
        """)

        Card(imageName: "/images/photos/dishwasher.jpg") {
            Text("Before putting your dishes into the dishwasher, make sure and give them a quick pre-clean.")

            Link("Back to the homepage", target: "/")
                .linkStyle(.button)
        }
        .frame(maxWidth: 300)


        Text("Headers and footers")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: """
        You can attach headers and/or footers to your cards, and they automatically get styled appropriately. \
        This is in *addition* to any image you provide, or any titles used in the card body.
        """)

        CodeBlock(language: "swift", """
        Card {
            Text("This is important!")
                .font(.title3)
            Text("This is card body text. This is card body text. This is card body text. This is card body text. This is card body text.")
        } header: {
            "Header Example"
        } footer: {
            "Your footer goes here footer"
        }
        """)

        Card {
            Text("This is important!")
                .font(.title3)
            Text("This is card body text. This is card body text. This is card body text. This is card body text. This is card body text.")
        } header: {
            "Header Example"
        } footer: {
            "Your footer goes here footer"
        }


        Text("Card styles")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: """
        Cards have three styles: `.default`, `.solid`, and `.bordered`, and can also be assigned roles. \
        The `.default` style does nothing special, but both `.solid` and `.bordered` apply coloring based on role.
        """)

        CodeBlock(language: "swift", """
        for style in Card.CardStyle.allCases {
            if style != .default {
                Text(markdown: "`\\(style)` style")
                    .font(.title3)

                for role in Role.allCases {
                    Card {
                        "This is a \\(style) card with the \\(role) role."
                    } header: {
                        "Header"
                    }
                    .role(role)
                    .cardStyle(style)
                    .margin(.bottom)
                }

                Spacer(size: .extraLarge)
            }
        }
        """)

        for style in Card.CardStyle.allCases {
            if style != .default {
                Text(markdown: "`\(style)` style")
                    .font(.title3)
                    .margin(.top, .extraLarge)

                for role in Role.allCases {
                    Card {
                        "This is a \(style) card with the \(role) role."
                    } header: {
                        "Header"
                    }
                    .role(role)
                    .cardStyle(style)
                    .margin(.bottom)
                }
            }
        }
    }
}
