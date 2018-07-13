//
//  PageHeader.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct PageHeader: Renderable, HTMLed {
    
    var additional: (Renderable & HTMLed)?
    
    var currentItem: Nav.Items
    
    init(additional: (Renderable & HTMLed)? = nil, currentItem: Nav.Items) {
        self.additional = additional
        self.currentItem = currentItem
    }
    
    var html: String {
        return """
        <!-- pageheader
        ================================================== -->
        <section class="s-pageheader \(additional != nil ? "s-pageheader--home" : "")">
        \(Header(currentItem: currentItem))
        \(additional?.html ?? "")
        </section> <!-- end s-pageheader -->
        """
    }
    
}
