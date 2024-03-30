import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() {
        let site = IndieDevAwards()

        do {
            try site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct IndieDevAwards: Site {
    var name = "The Indie Dev Awards"
    var baseTitle = " – The Indie Dev Awards"
    var url = URL("https://indiedevawards.com")

    var builtInIconsEnabled = true
    var syntaxHighlighters = [SyntaxHighlighter.swift, .python, .ruby]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://indiedevawards.com/images/favicon.png", width: 32, height: 32))
    var robotsConfiguration = Robots()
    var author = "Morris Richman"

    var homePage = ComingSoonLanding()
    var tagPage = Tags()
    var theme = MyTheme()
    
    var favicon = URL("/images/favicon.png")

    var pages: [any StaticPage] {
        homePage
    }

    var layouts: [any ContentPage] {
        Story()
        CustomStory()
    }
}


