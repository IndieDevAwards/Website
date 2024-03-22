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
    var name = "My Awesome Site"
    var baseTitle = " – My Awesome Site"
    var url = URL("https://indiedevawards.com")

    var builtInIconsEnabled = true
    var syntaxHighlighters = [SyntaxHighlighter.swift, .python, .ruby]
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://indiedevawards.com/images/icon32.png", width: 32, height: 32))
    var robotsConfiguration = Robots()
    var author = "Paul Hudson"

    var homePage = Home()
    var tagPage = Tags()
    var theme = MyTheme()

    var pages: [any StaticPage] {
        ContentExamples()
        GridExamples()
        NavigationExamples()
        TextExamples()

        AccordionExamples()
        AlertExamples()
        BadgeExamples()
        CardExamples()
        CarouselExamples()
        CodeExamples()
        DropdownExamples()
        EmbedExamples()
        ImageExamples()
        IncludeExamples()
        LinkExamples()
        ListExamples()
        QuoteExamples()
        StylingExamples()
        TableExamples()
    }

    var layouts: [any ContentPage] {
        Story()
        CustomStory()
    }
}


