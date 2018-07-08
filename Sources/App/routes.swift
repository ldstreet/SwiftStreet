import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return try Page(name: "Swift Street", body: Social.init(links: [])).render()
    }
}



