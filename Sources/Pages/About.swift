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
        personCards(context: context)
    }
    
    func personCards( context: PublishingContext) -> Section {
        Section {
            for person in context.content(ofType: "author") {
                Card {
                    if let image = person.image {
                        Text(
                            Image(image, description: person.imageDescription)
                                .resizable()
                                .frame(width: "50%")
                        )
                        .horizontalAlignment(.center)
                    }
                    Text(markdown: person.title.replacingOccurrences(of: "-", with: " ").capitalized)
                        .font(.title3)
                        .horizontalAlignment(.center)
                    
                    if let subtitle = person.subtitle {
                        Text {
                            Badge("\(subtitle.replacingOccurrences(of: "-", with: " ").capitalized)")
                                .role(.success)
                        }
                        .font(.lead)
                        .horizontalAlignment(.center)
                    }
                    
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
