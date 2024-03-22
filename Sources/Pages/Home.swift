//
// Home.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Text("Welcome to The Indie Developer Awards!")
            .font(.title1)

        Text("We are a brand new annual award show to celebrate things that developers did in 2024.")
            .font(.lead)
        
        Text("Award Categories Coming Soon...")
            .font(.title2)
        Table {
            for _ in 0..<5 {
                Row {
                    for _ in 0..<4 {
                        Image("/images/award.svg", description: "Award")
                            .frame(width: "25%")
                    }
                }
            }
        }
        .horizontalAlignment(.center)
    }
}
