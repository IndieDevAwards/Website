//
//  Blog.swift
//
//
//  Created by Morris Richman on 3/31/24.
//

import Foundation
import Ignite

struct Blog: StaticPage {
    var title: String = "Blog | Indie Dev Awards"
    
    func body(context: PublishingContext) -> [any BlockElement] {
        Text("Blog")
            .font(.title1)
            .horizontalAlignment(.leading)
        Divider()
        Section {
            for rowNum in 0..<Int(Double(posts(context: context).count/2).rounded()+1) {
                for post in articles(forRow: rowNum, context: context) {
                    Group {
                        if let image = post.metadata["clipped-image"] as? String {
                            ArticleCell(post, image: image)
                        } else if let image = post.image {
                            ArticleCell(post, image: image)
                        } else {
                            ArticleCell(post, image: nil)
                        }
                    }
                }
                if articles(forRow: rowNum, context: context).count == 1 {
                    Spacer()
                        .frame(height: "100%")
                }
                Spacer()
                Spacer()
            }
        }
        .columns(2)
    }
    
    func articles(forRow row: Int, context: PublishingContext) -> [Content] {
        Array(posts(context: context).dropFirst(row*2)).first(2)
    }
    
    func posts(context: PublishingContext) -> [Content] {
        context.content(ofType: "article").sorted(by: { $0.date > $1.date })
    }
}
