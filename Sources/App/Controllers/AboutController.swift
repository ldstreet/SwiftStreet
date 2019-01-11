//
//  AboutController.swift
//  App
//
//  Created by Luke Street on 7/11/18.
//

import Vapor

struct AboutController {
    func about(_ req: Request) -> Future<View> {
        return .map(on: req) {
            
            let about = About(title: "About",
                              imagePath: "/images/logo.png",
                              leadText: "Welcome to Swift Street",
                              mainText: """
                                        I used to think my calling was to be a writer. I would spend hours perfecting my latest short story, editing late into the night until until my eyelids felt like they were supporting cinder blocks. And yet, I couldn't help myself. As the words carefully poured from my fingers and splattered onto the bright white canvas of Microsoft Word, I felt alive and invigorated. Eventually, my interest in writing waned and my desire to make a comfortable living waxed. Thankfully that led me to programming. Fast forward a few years and here I am with cinder blocks settled on my eyelids as my words carefully pour from my fingers to my Mojave dark Xcode editor feeling alive and invigorated.

                                        </br></br>
                                        So then, why this blog? Well it should be obvious. I like to write, I like to code. A blog about coding? Now thats O(n) efficient. So buckle up, because there are plenty of bad programming jokes ahead of us. We are going to talk about Swift, iOS, Server Side Swift, and anything else that catches my fancy. My goal is to publish on average 1 post a week for a grand total of 52 posts in 2019. Can I do it? We will find out in 2020!
                                        """,
                              
                              quarters: []
            )
            
            return try Page(name: "About",
                            body: .init(content: about),
                            hasExtra: false,
                            currentItem: .about
                    ).render()
        }
    }
}
