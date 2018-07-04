import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return try Page(name: "Swift Street").render()
    }
}



