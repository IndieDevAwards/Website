//
//  File.swift
//  
//
//  Created by Morris Richman on 5/18/24.
//

import Foundation
import Ignite

struct AwardCell: Component {
    let award: Award
    
    init(_ award: Award) {
        self.award = award
    }
    
    func body(context: PublishingContext) -> [any PageElement] {
        Group {
            Group {}
                .frame(width: 6, height: 125)
                .backgroundColor(Color(hex: "#ff4057"))
                .cornerRadius(.leading, "6px")
            Group {
                Text(award.title)
                    .font(.lead)
                    .horizontalAlignment(.leading)
                Text(award.description)
                    .horizontalAlignment(.leading)
                    .foregroundStyle(Color.gray)
            }
            .style("display: flex")
            .style("flex-direction: column")
            .style("justify-content: center")
            .margin([.leading])
        }
        .style("display:flex")
        .backgroundColor(Color(hex: "#eaeef0"))
        .cornerRadius("6px")
        .margin()
    }
}
