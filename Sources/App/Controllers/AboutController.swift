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
            
            let about = About(title: "What is Swift Street",
                              imagePath: "",
                              leadText: "This is my lead text...",
                              mainText: "Hello, welcome to Swift Street!",
                              quarters: [.init(title: "Title", text: "Some Text"),
                                         .init(title: "Title", text: "Some Text"),
                                         .init(title: "Title", text: "Some Text"),
                                         .init(title: "Title", text: "Some Text")]
            )
            
            return try Page(name: "About",
                            body: Body(content: about),
                            hasExtra: false,
                            currentItem: .about
                    ).render()
        }
    }
}
