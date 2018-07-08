//
//  Foot.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

struct Foot: Renderable, HTMLed {
    
    var html: String {
        return """
        <!-- preloader
        ================================================== -->
        <div id="preloader">
        <div id="loader">
        <div class="line-scale">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        </div>
        </div>
        </div>
        
        
        <!-- Java Script
        ================================================== -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        """
    }
    
}
