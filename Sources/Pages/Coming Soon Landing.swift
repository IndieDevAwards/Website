//
//  Coming Soon Landing
//
//
//  Created by Morris Richman on 3/22/24.
//

import Foundation
import Ignite

struct ComingSoonLanding: StaticPage {
    var title: String = "Coming Soon | Indie Dev Awards"
    var image: URL? = URL("/images/logo-color-social-share.png")
    var theme = ComingSoonTheme()
    
    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Image("/images/logo-color.svg", description: "Site logo")
                .resizable()
                .frame(width: "50%")
            Text("We are a brand new award show dedicated to spotlighting indie projects and innovation in a variety of categories across the development industry.")
                .margin(.vertical)
            Text("More Coming Soon...")
                .font(.title3)
            
            Group {
                Link("Get Involved!", target: URL("mailto:info@indiedevawards.com"))
                    .linkStyle(.button)
                    .margin(.trailing, .small)
                    .role(.primary)
                Link("Sponsor Us", target: URL("mailto:sponsor@indiedevawards.com"))
                    .linkStyle(.button)
                    .margin(.leading, .small)
                    .role(.success)
            }
            Link("Follow Us on 𝕏", target: URL("https://x.com/dev_awards"))
                .linkStyle(.button)
                .margin(.top, .medium)
                .role(.secondary)
            Group {
                Text("Latest News")
                    .font(.title1)
                    .horizontalAlignment(.leading)
                Divider()
                Section {
                    for i in 0..<2 {
                        Group {
                            if let post = context.content(ofType: "article").sorted(by: { $0.date > $1.date }).first(1, offsetBy: i).first {
                                ArticleCell(post)
                            } else {
                                Spacer()
                                    .frame(height: "100%")
                            }
                        }
                    }
                }
                Link("See More →", target: "/blog")
                    .linkStyle(.button)
                    .margin()
            }
        }
        .horizontalAlignment(.center)
    }
}

extension Link: BlockElement {
    public var columnWidth: ColumnWidth {
        get {
            ColumnWidth.automatic
        }
        set(newValue) {
            
        }
    }
}
extension Text: NavigationItem {
    
}

extension Array {
    func first(_ k: Int, offsetBy: Int) -> [Element] {
        Array(self.dropFirst(offsetBy)).first(k)
    }
    
    func first(_ k: Int) -> [Element] {
        if self.count <= k {
            return self
        } else {
            return self.dropLast(self.count-k)
        }
    }
}
