//
//  AboutBlurb.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

struct AboutBlurb: Renderable, HTMLed {
    
    var text: String
    var socialLinks: [Social.SocialLink]
    
    var html: String {
        return """
        <div class="col-full s-content__main">
        <h3>About Swift Street</h3>
        
        <p>
        \(text)
        </p>
        
        \(Social(links: socialLinks, socialClass: .about))
        </div> <!-- end about -->
        """
    }
    
    static var extraAboutBlurb: AboutBlurb {
        let text = """
        Swift Street is a blog centered around the Swift programming language. Posts will range in topic from the language itself to platform specific (iOS, Server Side, Command Line) to my experiences as a young and learning developer. Please feel free to reach out to me at any time, I'd love to chat with you!
        """
        return AboutBlurb(text: text, socialLinks: [.github, .twitter])
    }
    
    static var mainAbout: AboutBlurb {
        let text = """
        Swift Street is a blog centered around the Swift programming language. Posts will range in topic from the language itself to platform specific (iOS, Server Side, Command Line) to my experiences as a young and learning developer. Please feel free to reach out to me at any time, I'd love to chat with you!
        """
        return AboutBlurb(text: text, socialLinks: [])
    }
}
