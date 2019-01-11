//
//  World.swift
//  App
//
//  Created by Luke Street on 1/10/19.
//

import PlayDocsKit

let Current = World()

struct World {
    var fetchArticles: () throws -> [Article] = ProgramaticArticleDatasource.fetchArticles(.init())
    var renderSwiftToHTML: (String) throws -> String = convertToHTML
}
