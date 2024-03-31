//
// SuggestedArticleTheme.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ComingSoonTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                page.body
                IgniteFooter()
            }
            .padding(.vertical, 80)
        }
    }
}
