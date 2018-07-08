//
//  PageHeader.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct PageHeader: Renderable, HTMLed {
    
    var additional: (Renderable & HTMLed)?
    
    init(additional: (Renderable & HTMLed)? = nil) {
        self.additional = additional
    }
    
    var html: String {
        return """
        <!-- pageheader
        ================================================== -->
        <section class="s-pageheader s-pageheader--home">
        \(Header())
        \(additional?.html ?? "")
        </section> <!-- end s-pageheader -->
        """
    }
    
}
