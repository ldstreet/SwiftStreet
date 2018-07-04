//
//  Social.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct Social: Renderable, HTMLed {
    
    var links: [SocialLink]
    
    var html: String {
        
        let linkStr = links.reduce("") { (result, links) -> String in
            return """
            \(result)
            <li>
            \(links.html)
            </li>
            """
        }
        
        return """
        <ul class="header__social">
        \(linkStr)
        </ul> <!-- end header__social -->
        """
    }
    
    enum SocialLink: String, CaseIterable, Renderable, HTMLed {
        case twitter
        case github
        
        var html: String {
            switch self {
                
            case .twitter:
                return """
                <a href="https://github.com/ldstreet"><i class="fa fa-github" aria-hidden="true"></i></a>
                """
            case .github:
                return """
                <a href="https://twitter.com/street_luke"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                """
            }
        }
    }
}
