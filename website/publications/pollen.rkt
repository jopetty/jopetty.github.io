#lang racket

(require racket/format racket/path
         txexpr
         colophon/common colophon/components colophon/predicates
         pollen/cache pollen/core pollen/decode pollen/file)

(require "../pollen.rkt")

(define breadcrumb 
  (list (cons "Jackson Petty" "/")
        (cons "Publications" "/publications/")))

(define (interleave lst itm)
  (if (empty? lst)
    '()
    (list* (car lst) itm (interleave (rest lst) itm))))

(define bc-list
  (drop-last(interleave
    (for/list ([b breadcrumb]) 
      `(span (a ((href ,(cdr b)) (class "breadcrumb-link")) ,(car b)))) '(span ((class "breadcrumb-spacer")) "/"))))

(define (navbar)
  `(header (nav 
    ,@(for/list ([b bc-list]) b))))


;;; 

(define (make-t-summary metas doc output-path )
  (let* ((title     (select-from-metas 'title metas))
         (subtitle  (select-from-metas 'subtitle metas))
         (started   (select-from-metas 'started metas))
         (published (select-from-metas 'published metas))
         (modified  (select-from-metas 'modified metas))
         (excerpt   (select-from-metas 'excerpt metas))
         (post      (path->string output-path))

         (title-txt
          (if title `(dd ((class "post-title"))
                         ,(link post title)) ""))
         )

    `(@ (dt ,published) ,title-txt)
    ))

(define (make-full-index d)
  (define (summarize f)
    (let* ([source-path f]
           [metas (cached-metas source-path)]
           [doc (cached-doc source-path)]
           [output-path (->output-path source-path)] )
      (make-t-summary metas doc output-path)))

  (define (sort-by-modification p1 p2)
    (> (file-or-directory-modify-seconds	p1)
       (file-or-directory-modify-seconds	p2) ))

  (let* ((unsorted-files (filter indexable-source? (directory-list d #:build? #t)))
         (sorted-files (sort unsorted-files sort-by-modification))
         (summaries (map summarize sorted-files)) )
    `(dl ,@summaries))
  )

;;; 

(module setup racket/base
  (provide (all-defined-out))
  (require pollen/setup)
  (define block-tags (cons 'more default-block-tags)))

(provide (all-defined-out))
(provide (all-from-out "../pollen.rkt"))