//
// Article.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Article: ContentPage {
    
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Group {
            if let image = content.image {
                if let imageHidden = content.metadata["image-hidden"] as? String {
                    if imageHidden == "false" {
                        Text {
                            Image(image, description: content.imageDescription)
                                .resizable()
                                .frame(width: "50%")
                        }
                    }
                } else {
                    Text {
                        Image(image, description: content.imageDescription)
                            .resizable()
                            .frame(width: "50%")
                    }
                }
            }
            
            Text(content.title)
                .font(.title1)
            
            Text(content.date.formatted(date: .abbreviated, time: .shortened))
            if let author = content.author {
                Text(markdown: "By: [\(author)](/author/\(author.lowercased().replacingOccurrences(of: " ", with: "-")))")
            }
            
            if content.hasTags {
                Text {
                    content.tagLinks(in: context)
                }
                .font(.title3)
            }
            
            Text(content.body)
        }
//        .padding(.top, .extraLarge)
    }
}
