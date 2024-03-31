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
    let image: String?
    let showAuthor: Bool
    
    init(_ article: Content, image: String?, showAuthor: Bool = true) {
        self.article = article
        self.image = image
        self.showAuthor = showAuthor
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
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
                        Text(markdown: "\(article.date.formatted(date: .abbreviated, time: .shortened)) by [\(author)](/author/\(author.replacingOccurrences(of: " ", with: "-")))")
                    } else {
                        Text(article.date.formatted(date: .abbreviated, time: .shortened))
                    }
                }
            }
            .padding(.bottom)
            Text(article.description)
            
            Link("Read Full Article...", target: article.path)
        }
        .frame(height: "100%")
        .style("cursor:pointer")
        .onClick {
            OpenURL(url: article.path)
        }
        .padding()
    }
}
