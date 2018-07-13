//
//  Shell.swift
//  App
//
//  Created by Luke Street on 5/21/18.
//

struct Nav: Renderable, HTMLed {
    
    var items: [Items]
    var currentItem: Items
    
    var html: String {
        return """
        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        
        <nav class="header__nav-wrap">
        
        <h2 class="header__nav-heading h6">Site Navigation</h2>
        
        <ul class="header__nav">
        \(
        items.html { item in
        if item == self.currentItem {
            return item.htmlSelected
        } else {
            return item.html
        }
        }
        )
        </ul> <!-- end header__nav -->
        
        <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>
        
        </nav> <!-- end header__nav-wrap -->
        """
    }
    
    enum Items: Renderable, HTMLed {
        
        case home
        case about
        
        var html: String {
            switch self {
            case .home:
                return Item.single(link: .home, current: false).html
            case .about:
                return Item.single(link: .about, current: false).html
            }
        }
        
        var htmlSelected: String {
            switch self {
            case .home:
                return Item.single(link: .home, current: true).html
            case .about:
                return Item.single(link: .about, current: true).html
            }
        }
        
        enum Item: Renderable, HTMLed {
            case single(link: Link, current: Bool)
            case children(name: String, links: [Link], current: Bool)
            
            var html: String {
                switch self {
                case .single(let link, let current):
                    let classStr = current ? "current" : ""
                    return """
                    <li class="\(classStr)">\(link.html)</li>
                    """
                case .children(let name, let links, let current):
                    let classStr = current ? "has-children current" : ""
                    return """
                    <li class="\(classStr)">
                    <a href="#0" title="">\(name)</a>
                    <ul class="sub-menu">
                    \(
                    links.html(above: "<li>", below: "</li>")
                    )
                    </ul>
                    </li>
                    """
                }
            }
            
            enum Link: String, Renderable, HTMLed {
                case home
                case about
                
                var html: String {
                    switch self {
                    case .home:
                        return """
                        <a href="/">Home</a>
                        """
                    case .about:
                        return """
                        <a href="/about">About</a>
                        """
                    }
                }
            }
        }
    }

}

