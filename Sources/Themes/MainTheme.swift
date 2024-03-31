//
// MainTheme.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                NavBar()

                Group {
                    page.body
                }
                .style("padding-top: calc(40px + min(0px, (395px - 100vw) / 2));")
                IgniteFooter()
            }
            .padding(.vertical, 80)
            .padding(.horizontal, .small)
        }
    }
}
