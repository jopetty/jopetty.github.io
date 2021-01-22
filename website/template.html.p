<!DOCTYPE html>
<html lang="en">
  ◊(->html (head-with 
              #:theme "/static/css/index.css"
              #:fonts "/static/css/fonts.css"
              #:style "/static/css/style.css"))
  ◊(->html (body-with
            #:navigation (navbar)
            #:contents `(div ((id "content")) (article
                             ,@(select* 'root doc)))))
  <footer>
    <nav>
    <div id="sitemap">
      <ul>
        <li>
          ◊(->html `(span (a ((href "/") (class "breadcrumb-link")) "Home")))
        </li>
        <li>
          ◊(->html `(span (a ((href "/about/") (class "breadcrumb-link")) "About")))
        </li>
        <li>
          ◊(->html `(span (a ((href "/publications/") (class "breadcrumb-link")) "Publications")))
        </li>
        <li>
          ◊(->html `(span (a ((href "/essays/") (class "breadcrumb-link")) "Essays")))
        </li>
      </ul>
    </div>
    <div id="elsewhere">
      <ul>
        <li>
          ◊(->html `(span (a ((href "https://github.com/jopetty") (class "breadcrumb-link")) "GitHub")))
        </li>
        <li>
          ◊(->html `(span (a ((href "https://linkedin.com/in/jackson-petty/") (class "breadcrumb-link")) "LinkedIn")))
        </li>
      </ul>
    </div>
    </nav>
  </footer> 
</html>