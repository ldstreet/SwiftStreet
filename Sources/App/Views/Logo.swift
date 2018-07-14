//
//  Logo.swift
//  App
//
//  Created by Luke Street on 7/4/18.
//

struct Logo: Renderable, HTMLed {
    
    let imagePath: String
    let link: String
    
    var html: String {
        return """
        <div class="header__logo">
        <a class="logo" href="\(link)">
        <img src="\(imagePath)" alt="Homepage">
        <!-- <h1 class="header__logo">Swift Street</h1> -->
        </a>
        </div> <!-- end header__logo -->
        """
    }
}
