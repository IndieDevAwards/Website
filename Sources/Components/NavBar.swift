//
// NavBar.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

/// An example navigation bar, demonstrating how to create reusable components.
struct NavBar: Component {
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo-white.svg", description: "Site logo").frame(width: "300px", height: "70%")) {
            Link("Home", target: "/")
            Link("Blog", target: "/blog")
            Link("Our Team", target: "/about")
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .backgroundColor(.init(hex: "#ed3e55"))
        .position(.fixedTop)
    }
}
