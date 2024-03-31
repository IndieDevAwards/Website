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
    var image: URL? = URL("/images/logo-color-social-share.png")
    
    func body(context: PublishingContext) -> [any BlockElement] {
        Text("Blog")
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
    }
    
    func blogPosts(context: PublishingContext) -> Section {
        Section {
            for rowNum in 0..<Int(Double(posts(context: context).count/2).rounded()+1) {
                for post in articles(forRow: rowNum, context: context) {
                    Group {
                        ArticleCell(post)
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
    }
    
    func articles(forRow row: Int, context: PublishingContext) -> [Content] {
        Array(posts(context: context).dropFirst(row*2)).first(2)
    }
    
    func posts(context: PublishingContext) -> [Content] {
        context.content(ofType: "article").sorted(by: { $0.date > $1.date })
    }
}
