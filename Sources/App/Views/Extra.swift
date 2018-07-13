//
//  Extra.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

struct Extra: Renderable, HTMLed {
    
    var html: String {
        return """
        <section class="s-extra">
        <div class="row top">
        \(AboutBlurb.extraAboutBlurb)
        </div> <!-- end row -->
        </section> <!-- end s-extra -->
        """
    }
}
