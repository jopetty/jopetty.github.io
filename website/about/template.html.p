<!DOCTYPE html>
<html lang="en">
  ◊(->html (head-with #:theme "/css/grayscale.css"))
  ◊(->html (body-with
            #:navigation (navbar)
            #:contents `(div ((id "content")) (article
                             ,@(select* 'root doc)))))
</html>