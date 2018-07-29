//
//  Header.swift
//  App
//
//  Created by Luke Street on 6/20/18.
//

import Foundation

internal struct Head: Renderable, HTMLed {
    
    var pageName: String
    
    var html: String {
        return """
        <head>
            <!--- basic page needs
            ================================================== -->
            <meta charset="utf-8">
            <title>\(pageName)</title>
            <meta name="description" content="">
            <meta name="author" content="">
        
            <!-- mobile specific metas
            ================================================== -->
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        
            <!-- CSS
            ================================================== -->
            <link rel="stylesheet" href="/css/base.css">
            <link rel="stylesheet" href="/css/vendor.css">
            <link rel="stylesheet" href="/css/main.css">
            <link href="/css/prism.css" rel="stylesheet" />
        
            <!-- script
            ================================================== -->
            <script src="/js/modernizr.js"></script>
            <script src="/js/pace.min.js"></script>

        
            <!-- favicons
            ================================================== -->
            <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
            <link rel="icon" href="/favicon.ico" type="image/x-icon">
        
        </head>
        """
    }
    
    
}
