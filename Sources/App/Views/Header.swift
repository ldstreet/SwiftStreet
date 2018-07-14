//
//  Header.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct Header: Renderable, HTMLed {
    
    var currentItem: Nav.Items
    
    var html: String {
        return """
        <header class="header">
        <div class="header__content row">
        \(Logo(imagePath: "/images/header-logo.png", link: "/"))
        \(Social(links: [.github, .twitter], socialClass: .header))
        \(Nav(items: [.home, .about], currentItem: currentItem))
        </div> <!-- header-content -->
        </header> <!-- header -->
        """
    }
}
