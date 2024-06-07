//
//  ArticleCell.swift
//
//
//  Created by Morris Richman on 3/31/24.
//

import Foundation
import Ignite

struct ArticleCell: Component {    
    let article: Content
    let showAuthor: Bool
    
    init(_ article: Content, showAuthor: Bool = true) {
        self.article = article
        self.showAuthor = showAuthor
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
        if let image = article.metadata["clipped-image"] as? String {
            innerWorkings(image: image)
        } else if let image = article.image {
            if let imageHidden = article.metadata["image-hidden"] as? String {
                if imageHidden == "false" {
                    innerWorkings(image: image)
                } else {
                    innerWorkings(image: nil)
                }
            } else {
                innerWorkings(image: image)
            }
        } else {
            innerWorkings(image: nil)
        }
    }
    
    func innerWorkings(image: String?) -> any PageElement {
        Card {
            Section {
                if let image {
                    Image(image, description: article.imageDescription)
                        .resizable()
                        .frame(width: "50%")
                }
                Group {
                    Text(article.title)
                        .font(.title2)
                    if let author = article.author, showAuthor {
                        Text(markdown: "\(article.date.formatted(date: .abbreviated, time: .shortened)) by [\(author)](/author/\(author.lowercased().replacingOccurrences(of: " ", with: "-")))")
                    } else {
                        Text(article.date.formatted(date: .abbreviated, time: .shortened))
                    }
                }
            }
            .padding(.bottom)
            if let description = article.metadata["description"] as? String {
                Text(markdown: description)
            }
            
            Link("Read Full Article", target: article.path)
                .linkStyle(.button)
        }
        .frame(height: "100%")
        .style("cursor:pointer")
        .onClick {
            OpenURL(url: article.path)
        }
        .padding()
    }
}
