//
//  ConsoleLog.swift
//
//
//  Created by Morris Richman on 3/31/24.
//

import Foundation
import Ignite

struct ConsoleLog: Action {
    let string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    func compile() -> String {
        "console.log('\(string)')"
    }
}
