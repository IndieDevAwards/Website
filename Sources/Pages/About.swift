//
//  About.swift
//
//
//  Created by Morris Richman on 3/31/24.
//

import Foundation
import Ignite

struct About: StaticPage {
    var title: String = "Our Team | Indie Dev Awards"
    var image: URL? = URL("/images/logo-color-social-share.png")
    
    func body(context: PublishingContext) -> [any BlockElement] {
        Text("Our Team")
            .font(.title1)
            .horizontalAlignment(.leading)
        Divider()
        // Desktop Blog Posts
        personCards(context: context)
        .columns(3)
        .style("display: none; min-width: 500px;")
        // Mobile Blog Posts
        personCards(context: context)
        .columns(1)
        .style("display: block; max-width: 500px;")
    }
    
    func personCards( context: PublishingContext) -> Section {
        Section {
            for person in context.content(ofType: "author") {
                Card {
                    if let image = person.image {
                        Text(
                            Image(image)
                                .resizable()
                                .frame(width: "50%")
                        )
                        .horizontalAlignment(.center)
                    }
                    Text(markdown: person.title.replacingOccurrences(of: "-", with: " ").capitalized)
                        .font(.title3)
                        .horizontalAlignment(.center)
                    
//                    if person.description.count <= 60 {
                        Text(markdown: "*\(String(person.description))*")
                            .horizontalAlignment(.center)
//                    } else {
//                        Text(markdown: "*\(String(person.description.prefix(60)))...*")
//                            .horizontalAlignment(.center)
//                    }
                }
                .frame(height: "100%")
                .style("cursor:pointer")
                .onClick {
                    OpenURL(url: person.path)
                }
            }
        }
    }
}
