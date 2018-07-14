//
//  About.swift
//  App
//
//  Created by Luke Street on 7/11/18.
//

struct About: Renderable, HTMLed {
    
    var title: String
    var imagePath: String
    var leadText: String
    var mainText: String
    var quarters: [Quarter]
    
    var html: String {
        return """
        <div class="row">
        
        <div class="s-content__header col-full">
        <h1 class="s-content__header-title">
        \(title)
        </h1>
        </div> <!-- end s-content__header -->
        
        <div class="s-content__media col-full">
        <div class="s-content__post-thumb">
        <img class="header__logo" src="\(imagePath)">
        </div>
        </div> <!-- end s-content__media -->
        
        <div class="col-full s-content__main">
        
        <p class="lead">\(leadText)</p>
        
        <p>\(mainText)
        </p>
        
        <div class="row block-1-2 block-tab-full">
        
        \(quarters.html)
        
        </div>
        
        
        </div> <!-- end s-content__main -->
        
        </div> <!-- end row -->
        """
    }
    
    struct Quarter: Renderable, HTMLed {
        
        var title: String
        var text: String
        
        var html: String {
            return """
            <div class="col-block">
            <h3 class="quarter-top-margin">\(title)</h3>
            <p>\(text)</p>
            </div>
            """
        }
    }
}
