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
                Image(image)
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
                    if let image = post.metadata["clipped-image"] as? String {
                        blogPost(post, image: image)
                    } else if let image = post.image {
                        blogPost(post, image: image)
                    } else {
                        blogPost(post, image: nil)
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
        context.content(ofType: "blog").filter({ $0.author == content.title.replacingOccurrences(of: "-", with: " ").capitalized }).sorted(by: { $0.date > $1.date })
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
                    Text(post.date.formatted(date: .abbreviated, time: .shortened))
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
        .padding()
    }
}

extension Divider: BlockElement {}
extension Card: InlineElement {}
