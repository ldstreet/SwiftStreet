//
//  Footer.swift
//  App
//
//  Created by Luke Street on 7/8/18.
//

struct Footer: Renderable, HTMLed {
    var html: String {
        return """
        <!-- s-footer
        ================================================== -->
        <footer class="s-footer">
        <div class="s-footer__bottom">
        <div class="row">
        <div class="col-full">
        <div class="s-footer__copyright">
        <span>© Copyright Swift Street 2018</span>
        <span>Built with Swift</span>
        <span>
        Logo created on <a href="http://logomakr.com" title="Logo Makr">LogoMakr.com</a>
        </span>
        <span>Site Template by <a href="https://colorlib.com/">Colorlib</a></span>
        </div>
        
        <div class="go-top">
        <a class="smoothscroll" title="Back to Top" href="#top"></a>
        </div>
        </div>
        </div>
        </div> <!-- end s-footer__bottom -->
        </footer> <!-- end s-footer -->
        """
    }
}
