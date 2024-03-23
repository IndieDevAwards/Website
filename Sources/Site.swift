import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() {
        let site = ExampleSite()

        do {
            try site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExampleSite: Site {    
    var name = "The Indie Dev Awards"
    var baseTitle = " – The Indie Dev Awards"
    var url = URL("https://indiedevawards.com")

    var builtInIconsEnabled = true
    var syntaxHighlighters = [SyntaxHighlighter.swift, .python, .ruby]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://indiedevawards.com/images/icon32.png", width: 32, height: 32))
    var robotsConfiguration = Robots()
    var author = "Morris Richman"

    var homePage = Home()
    var tagPage = Tags()
    var theme = MyTheme()

    var pages: [any StaticPage] {
        homePage
    }

    var layouts: [any ContentPage] {
        Story()
        CustomStory()
    }
}


