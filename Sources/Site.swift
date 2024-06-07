import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = IndieDevAwards()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct IndieDevAwards: Site {
    var name = "The Indie Dev Awards"
    var baseTitle = " – The Indie Dev Awards"
    var url = URL("https://indiedevawards.com")
    
    var favicon = URL(string: "/images/favicon.png")

    var builtInIconsEnabled = true
    var syntaxHighlighters = [SyntaxHighlighter.swift, .python, .ruby]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://indiedevawards.com/images/favicon.png", width: 32, height: 32))
    var robotsConfiguration = Robots()
    var author = "Morris Richman"

    var homePage = Home()
    var tagPage = Tags()
    var theme = MyTheme()

    var pages: [any StaticPage] {
        homePage
        Blog()
        About()
    }

    var layouts: [any ContentPage] {
        Author()
        Article()
    }
}


