//
//  Coming Soon Landing
//
//
//  Created by Morris Richman on 3/22/24.
//

import Foundation
import Ignite

struct ComingSoonLanding: StaticPage {
    var title: String = "Coming Soon"
    var image: URL? = URL("/images/logo-color-social-share.png")
    
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
                        if let post = context.content(ofType: "blog").sorted(by: { $0.date > $1.date }).first(1, offsetBy: i).first {
                            if let image = post.metadata["clipped-image"] as? String {
                                blogPost(post, image: image)
                            } else if let image = post.image {
                                blogPost(post, image: image)
                            } else {
                                blogPost(post, image: nil)
                            }
                        } else {
//                            Card {
                                Spacer()
//                            }
                            .frame(height: "100%")
                        }
                    }
                }
            }
        }
        .horizontalAlignment(.center)
    }
    
    func blogPost(_ post: Content, image: String?) -> any BlockElement {
        Card {
            Section {
                if let image {
                    Image(image)
                        .resizable()
                        .frame(width: "50%")
                }
                Group {
                    Text(post.title)
                        .font(.title2)
                    if let author = post.author {
                        Text(markdown: "\(post.date.formatted(date: .abbreviated, time: .shortened)) by [\(author)](/author/\(author.replacingOccurrences(of: " ", with: "-")))")
                    } else {
                        Text(post.date.formatted(date: .abbreviated, time: .shortened))
                    }
                }
            }
            .padding(.bottom)
            Text(post.description)
            
            Link("Read Full Article...", target: post.path)
        }
        .frame(height: "100%")
        .style("cursor:pointer")
        .onClick {
            OpenURL(url: post.path)
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
