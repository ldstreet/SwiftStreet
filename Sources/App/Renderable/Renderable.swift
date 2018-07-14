//
//  Renderable.swift
//  App
//
//  Created by Luke Street on 5/26/18.
//

import Vapor

enum RenderableError: Error, Debuggable {
    
    case badHTMLString(String)
    
    var identifier: String {
        switch self {
        case .badHTMLString(_):
            return "badHTMLString"
        }
    }
    
    var reason: String {
        switch self {
        case .badHTMLString(let str):
            return "\(str) could not be converted to data"
        }
    }
}

protocol Renderable {
    func render() throws -> View
}

protocol HTMLed: CustomStringConvertible {
    var html: String { get }
}

extension HTMLed {
    var description: String {
        return html
    }
}

extension Renderable where Self: HTMLed {
    func render() throws -> View {
        guard let data = html.data(using: .utf8) else { throw RenderableError.badHTMLString(html) }
        return View(data: data)
    }
}
