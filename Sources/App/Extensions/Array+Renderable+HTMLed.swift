//
//  Array+Renderable+HTMLed.swift
//  App
//
//  Created by Luke Street on 7/11/18.
//

import Foundation

extension Array: Renderable, HTMLed where Element: Renderable, Element: HTMLed {
    var html: String {
        return reduce("", { (result, element) -> String in
            return """
            \(result)
            \(element)
            """
        })
    }
    
    func html(above: String = "", below: String = "", transform: ((Element) -> String)? = nil) -> String {
        return reduce("", { (result, element) -> String in
            return """
            \(result)
            \(above)
            \(transform?(element) ?? element.html)
            \(below)
            """
        })
    }
}
