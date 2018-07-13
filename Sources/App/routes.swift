import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get(use: HomeController().home)
    router.get("article", Article.parameter, use: ArticleController().article)
    router.get("about", use: AboutController().about)
}



