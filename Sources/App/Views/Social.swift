//
//  Social.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct Social: Renderable, HTMLed {
    
    var links: [SocialLink]
    var socialClass: SocialClass
    
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
        <ul class="\(socialClass.rawValue)">
        \(linkStr)
        </ul> <!-- end header__social -->
        """
    }
    
    enum SocialClass: String {
        case header = "header__social"
        case about = "about__social"
    }
    
    enum SocialLink: String, Renderable, HTMLed {
        case twitter
        case github
        
        var html: String {
            switch self {
                
            case .twitter:
                return """
                <a href="https://twitter.com/street_luke"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                """
            case .github:
                return """
                <a href="https://github.com/ldstreet"><i class="fa fa-github" aria-hidden="true"></i></a>
                """
            }
        }
    }
}
