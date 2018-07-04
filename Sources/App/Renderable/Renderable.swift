//
//  Renderable.swift
//  App
//
//  Created by Luke Street on 5/26/18.
//

import Leaf

enum RenderableError: Error, Debuggable {
    
    case badTemplateString(String)
    case badHTMLString(String)
    
    var identifier: String {
        switch self {
        case .badTemplateString(_):
            return "badTemplateString"
        case .badHTMLString(_):
            return "badHTMLString"
        }
    }
    
    var reason: String {
        switch self {
        case .badTemplateString(let str):
            return "\(str) could not be converted to data"
        case .badHTMLString(let str):
            return "\(str) could not be converted to data"
        }
    }
}

protocol Renderable {
    func render(with renderer: TemplateRenderer) throws -> Future<View>
    func render() throws -> View
}

extension Renderable {
    func render(with renderer: TemplateRenderer) throws -> Future<View> {
        throw TemplateKitError.init(identifier: "no implementation", reason: "")
    }
    func render() throws -> View {
        throw TemplateKitError.init(identifier: "no implementation", reason: "")
    }
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

//extension Renderable where Self: TemplatePathed {
//    func render(with renderer: TemplateRenderer) throws -> Future<View> {
//        return renderer.render(templatePath, self)
//    }
//}
//
//extension Renderable where Self: Templated {
//    func render(with renderer: TemplateRenderer) throws -> Future<View> {
//        guard let data = template.data(using: .utf8) else {
//            throw(RenderableError.badTemplateString(template))
//        }
//        return renderer.render(template: data, self)
//    }
//}

protocol Templated {
    var template: String { get }
}

protocol TemplatePathed {
    var templatePath: String { get }
}
