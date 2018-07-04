//
//  AnyRenderable.swift
//  App
//
//  Created by Luke Street on 5/26/18.
//

//internal struct AnyRenderable: Encodable {
//    
//    var renderable: Renderable
//    
//    init(_ renderable: Renderable) {
//        self.renderable = renderable
//    }
//    
//    private enum CodingKeys : CodingKey {
//        case renderable
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try renderable.encode(to: container.superEncoder(forKey: .renderable))
//    }
//}
