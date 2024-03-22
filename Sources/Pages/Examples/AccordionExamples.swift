//
// AccordionExamples.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct AccordionExamples: StaticPage {
    var title = "Accordions"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Accordions")
            .font(.title1)

        Text("Accordions are a bit like disclosure groups: users see a group of headings, and can click on one to expand it, revealing its contents.")
            .font(.lead)

        Text("This creates a simple accordion:")

        CodeBlock(language: "swift", """
        Accordion {
            Item("First item") {
                Text("This is the first accordion item.")
            }

            Item("Second item") {
                Text("This is the second accordion item.")
            }

            Item("Third item") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        .margin(.bottom, .extraLarge)
        """)

        Accordion {
            Item("First item") {
                Text("This is the first accordion item.")
            }

            Item("Second item") {
                Text("This is the second accordion item.")
            }

            Item("Third item") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        .margin(.bottom, .extraLarge)

        Text("This accordion is set to allow multiple items to be open at a time:")

        CodeBlock(language: "swift", """
        Accordion {
            Item("First") {
                Text("This is the first accordion item.")
            }

            Item("Second") {
                Text("This is the second accordion item.")
            }

            Item("Third") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.all)
        """)


        Accordion {
            Item("First") {
                Text("This is the first accordion item.")
            }

            Item("Second") {
                Text("This is the second accordion item.")
            }

            Item("Third") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.all)
        .margin(.bottom, .extraLarge)

        Text("You can configure individual items to be openy by default if you want:")

        CodeBlock(language: "swift", """
        Accordion {
            Item("First", startsOpen: true) {
                Text("This item will start open by default.")
            }

            Item("Second") {
                Text("This is the second accordion item.")
            }

            Item("Third") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        """)

        Accordion {
            Item("First", startsOpen: true) {
                Text("This item will start open by default.")
            }

            Item("Second") {
                Text("This is the second accordion item.")
            }

            Item("Third") {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        .margin(.bottom, .extraLarge)

        Text("And you can add more complex elements and styling to your accordion titles and contents if you want:")

        CodeBlock(language: "swift", """
        Accordion {
            Item(Emphasis { "This title is italic" }, startsOpen: true) {
                Text {
                    Image("/images/photos/chair.jpg", description: "This is a picture of a chair, and not a dog.")
                        .resizable()
                }

                Text("This is the first accordion item.")
            }

            Item(Underline { "This title is underlined." }) {
                Text("This is the second accordion item.")
            }

            Item(Strong { "This title is bold." }) {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
        """)

        Accordion {
            Item(Emphasis { "This title is italic" }, startsOpen: true) {
                Text {
                    Image("/images/photos/chair.jpg", description: "This is a picture of a chair, and not a dog.")
                        .resizable()
                }

                Text("This is the first accordion item.")
            }

            Item(Underline { "This title is underlined." }) {
                Text("This is the second accordion item.")
            }

            Item(Strong { "This title is bold." }) {
                Text("This is the third accordion item.")
            }
        }
        .openMode(.individual)
    }
}
