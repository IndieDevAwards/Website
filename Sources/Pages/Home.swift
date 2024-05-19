//
//  Coming Soon Landing
//
//
//  Created by Morris Richman on 3/22/24.
//

import Foundation
import Ignite

struct Home: StaticPage {
    var title: String = "The Indie Dev Awards"
    var image: URL? = URL("/images/logo-color-social-share.png")
    var theme = ComingSoonTheme()
    
    func body(context: PublishingContext) -> [BlockElement] {
        NavigationBar {
            Link(Text(markdown: "**Home**"), target: "/")
            Link("Blog", target: "/blog")
            Link("Our Team", target: "/about")
        }
        .navigationItemAlignment(.trailing)
        .navigationBarStyle(.light)
        .position(.fixedTop)
        Group {
            Image("/images/logo-color.svg", description: "Site logo")
                .resizable()
                .frame(width: "50%")
            Text("We are a brand new award show dedicated to spotlighting indie projects and innovation in a variety of categories across the development industry.")
                .margin(.vertical)
            
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
                
                // Desktop Blog Posts
                blogPosts(context: context)
                .columns(2)
                .style("display: none; min-width: 500px;")
                // Mobile Blog Posts
                blogPosts(context: context)
                .columns(1)
                .style("display: block; max-width: 500px;")
                
                Link("See More →", target: "/blog")
                    .linkStyle(.button)
                    .margin()
            }
            .style("padding-top: calc(40px + min(0px, (510px - 100vw) / 2));")
            
            Group {
                Text("Awards")
                    .font(.title1)
                    .horizontalAlignment(.leading)
                Divider()
                
                Group {
                    Text("Innovation Leaders")
                        .font(.title3)
                        .horizontalAlignment(.leading)
                        .margin(.leading)
                    
                    // Desktop Awards
                    awards(for: .innovationLeader)
                        .columns(2)
                }
                
                Group {
                    Text("Best UI/UX")
                        .font(.title3)
                        .horizontalAlignment(.leading)
                        .margin(.leading)
                    
                    // Desktop Awards
                    awards(for: .bestUIX)
                        .columns(2)
                }
                
                Group {
                    Text("Best Consumer Product")
                        .font(.title3)
                        .horizontalAlignment(.leading)
                        .margin(.leading)
                    
                    // Desktop Awards
                    awards(for: .bestConsumerProduct)
                        .columns(2)
                }
            }
        }
        .horizontalAlignment(.center)
    }
    
    func blogPosts(context: PublishingContext) -> Section {
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
    }
    
    func awards(for category: Award.Category) -> Section {
        Section {
            for award in Award.awards(for: category) {
                Group {
                    AwardCell(award)
                }
            }
        }
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

struct Award: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    
    enum Category: String, CaseIterable {
        case innovationLeader, bestUIX, bestConsumerProduct
    }
    static private let innovationLeader: [Self] = [
        .init(title: "AI", description: "Pushing the boundaries of what artificial intelligence can do."),
        .init(title: "Data Management & Security", description: "Creating or improving new ways to securely and efficiently store/manage data."),
        .init(title: "Web Tools", description: "Arming developers with new web tools to create even better websites."),
        .init(title: "Augmented Reality", description: "Opening new avenues for the questioning of reality."),
        .init(title: "Virtual Reality", description: "Pushing the boundaries of immersion in a virtual experience.")
    ]
    static private let bestUIX: [Self] = [
        .init(title: "Web", description: "The best user experience crafted with an incredible design for the web."),
        .init(title: "iOS", description: "The best user experience crafted with an incredible design for iOS."),
        .init(title: "Android", description: "The best user experience crafted with an incredible design for Android.")
    ]
    static private let bestConsumerProduct: [Self] = [
        .init(title: "AI", description: "Enabling consumers to do even crazier things with artifical intelligence."),
        .init(title: "Developer Tools", description: "Empowering developers to build incredible products."),
        .init(title: "Augmented Reality", description: "Bringing ReadyPlayerOne to life?"),
        .init(title: "Virtual Reality", description: "Immersing people in a whole other world, providing an experience only found with virtual reality.")
    ]
    
    static func awards(for category: Category) -> [Self] {
        switch category {
        case .innovationLeader:
            innovationLeader
        case .bestUIX:
            bestUIX
        case .bestConsumerProduct:
            bestConsumerProduct
        }
    }
}
