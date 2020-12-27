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
</html>