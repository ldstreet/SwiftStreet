//
//  Shell.swift
//  App
//
//  Created by Luke Street on 5/21/18.
//

struct Nav: Renderable, HTMLed {
    var items: [NavItems]
    
    var html: String {
        return """
        <a class="header__toggle-menu" href="#0" title="Menu"><span>Menu</span></a>
        
        <nav class="header__nav-wrap">
        
        <h2 class="header__nav-heading h6">Site Navigation</h2>
        
        <ul class="header__nav">
        \(
        items.reduce("", { result, item in
        return """
        \(result)
        \(item.html)
        """
        })
        )
        </ul> <!-- end header__nav -->
        
        <a href="#0" title="Close Menu" class="header__overlay-close close-mobile-menu">Close</a>
        
        </nav> <!-- end header__nav-wrap -->
        """
    }
}

enum NavItems: String, Renderable, HTMLed {
    
    case home
    case test
    
    var html: String {
        switch self {
        case .home:
            return NavItem.single(link: .home).html
        case .test:
            return NavItem.children(name: "Test", links: [.home, .home]).html
        }
    }
    

    
    enum NavItem: Renderable, HTMLed {
        case single(link: NavItemLink)
        case children(name: String, links: [NavItemLink])
        
        var html: String {
            switch self {
            case .single(let link):
                return """
                <li class="current"><a href="\(link.link)" title="">\(link.rawValue)</a></li>
                """
            case .children(let name, let links):
                return """
                <li class="has-children">
                    <a href="#0" title="">\(name)</a>
                    <ul class="sub-menu">
                        \(
                        links.reduce("", { result, link in
                            return """
                            \(result)
                            <li><a href="\(link.link)">\(link.rawValue)</a></li>
                            """
                        })
                        )
                    </ul>
                </li>
                """
            }
        }
        
        enum NavItemLink: String {
            case home = "Home"
            
            var link: String {
                switch self {
                case .home:
                    return "/"
                }
            }
        }
    }
}
