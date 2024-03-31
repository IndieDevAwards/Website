//
// Author.swift
// IndieDevAwardsWebsite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Author: ContentPage {
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Text(content.title.replacingOccurrences(of: "-", with: " ").capitalized)
            .font(.title1)
        
        Text {
            if let image = content.image {
                Image(image, description: content.imageDescription)
                    .resizable()
                    .frame(width: "20%")
            }
            content.body
        }
        
        Text("\(content.title.replacingOccurrences(of: "-", with: " ").capitalized)'s Articles")
            .font(.title2)
        Divider()
        Section {
            for rowNum in 0..<Int(Double(posts(content, context: context).count/2).rounded()+1) {
                for post in articles(forRow: rowNum, content: content, context: context) {
                    Group {
                        ArticleCell(post, showAuthor: false)
                    }
                }
                if articles(forRow: rowNum, content: content, context: context).count == 1 {
                    Spacer()
                        .frame(height: "100%")
                }
                Spacer()
                Spacer()
            }
        }
        .columns(2)
    }
    
    func articles(forRow row: Int, content: Content, context: PublishingContext) -> [Content] {
        Array(posts(content, context: context).dropFirst(row*2)).first(2)
    }
    
    func posts(_ content: Content, context: PublishingContext) -> [Content] {
        context.content(ofType: "article").filter({ $0.author == content.title.replacingOccurrences(of: "-", with: " ").capitalized }).sorted(by: { $0.date > $1.date })
    }
}

extension Divider: BlockElement {}
extension Card: InlineElement {}
