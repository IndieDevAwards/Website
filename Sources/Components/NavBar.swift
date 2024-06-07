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
    let currentPage: Page
    
    enum Pages: String, CaseIterable {
        case home, blog, about
        
        var title: String {
            switch self {
            case .home:
                "Home"
            case .blog:
                "Blog"
            case .about:
                "Our Team"
            }
        }
        
        var path: String {
            switch self {
            case .home:
                "/"
            case .blog:
                "/blog"
            case .about:
                "/about"
            }
        }
    }
    
    var currentPagePath: String {
        currentPage.url.absoluteString.replacingOccurrences(of: "https://", with: "").replacingOccurrences(of: "http://", with: "").replacingOccurrences(of: "indiedevawards.com", with: "")
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: Image("/images/logo-white.svg", description: "Site logo").frame(width: "300px", height: "70%")) {
            for page in Pages.allCases {
                if (currentPagePath.contains(page.path) && page.title.lowercased() != "home") || page.path == currentPagePath {
                    Link(Text(markdown: "**\(page.title)**"), target: page.path)
                        .foregroundStyle(.white)
                } else if currentPagePath.contains("article") && page.rawValue.lowercased() == "blog" {
                    Link(Text(markdown: "**\(page.title)**"), target: page.path)
                        .foregroundStyle(.white)
                } else if currentPagePath.contains("author") && page.rawValue.lowercased() == "about" {
                    Link(Text(markdown: "**\(page.title)**"), target: page.path)
                        .foregroundStyle(.white)
                } else {
                    Link(Text(markdown: "\(page.title)"), target: page.path)
                }
            }
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.dark)
        .background(.init(hex: "#ed3e55"))
        .position(.fixedTop)
    }
}
