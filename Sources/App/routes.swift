import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return try Page(
            name: "Swift Street",
            body: ArticleStream(articles: ProgramaticArticleDatasource().fetchArticles().map { article in
                return ArticleStream.ArticleTile.standard(title: article.title, articleLink: "", imagePath: article.imagePath, date: article.date, previewText: article.description)
            })
            ).render()
    }
}



