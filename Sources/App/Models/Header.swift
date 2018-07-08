//
//  Header.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct Header: Renderable, HTMLed {
    
    var html: String {
        return """
        <header class="header">
        <div class="header__content row">
        \(Logo(imagePath: "images/logo.svg", link: ""))
        \(Social(links: [.github, .twitter]))
        \(Nav(items: [.home, .test]))
        </div> <!-- header-content -->
        </header> <!-- header -->
        """
    }
}
