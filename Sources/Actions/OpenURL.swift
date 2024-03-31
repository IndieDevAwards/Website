//
//  OpenURL.swift
//  
//
//  Created by Morris Richman on 3/31/24.
//

import Foundation
import Ignite

struct OpenURL: Action {
    let url: String
    let openInNewWindow: Bool
    
    init(url: URL, openInNewWindow: Bool = false) {
        self.url = url.absoluteString
        self.openInNewWindow = openInNewWindow
    }
    
    init(url: String, openInNewWindow: Bool = false) {
        self.url = url
        self.openInNewWindow = openInNewWindow
    }
    
    func compile() -> String {
        switch openInNewWindow {
        case true:
            return "window.open('\(url)')"
        case false:
            return "window.open('\(url)', '_self')"
        }
    }
}
