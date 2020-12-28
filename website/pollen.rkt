#lang racket


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Requirements
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require colophon/components
         pollen/cache
         pollen/file
         pollen/html5
         pollen/core
         colophon/tags
         colophon/predicates
         pollen/tag
         txexpr
         "components.rkt"
         "citations.rkt"
         "bibliography.rkt")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide (all-defined-out))
(provide (all-from-out pollen/html5))
(provide (all-from-out colophon/components))
(provide (all-from-out colophon/tags))
(provide (all-from-out colophon/predicates))
(provide (all-from-out "bibliography.rkt"))
(provide (all-from-out "components.rkt"))
(provide declare-work format-work)
(provide make-full-index)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Implementation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (valediction . xs)
  `(div [(class "valediction")] ,@xs))

(define (interleave lst itm)
  (if (empty? lst)
    '()
    (list* (car lst) itm (interleave (rest lst) itm))))

(define (drop-last lst)
  (reverse (cdr (reverse lst))))


(define breadcrumb 
  (list (cons "Jackson Petty" "/")))

(define bc-list
  (drop-last(interleave
    (for/list ([b breadcrumb]) 
      `(span (a ((href ,(cdr b)) (class "breadcrumb-link")) ,(car b)))) 
    '(span ((class "breadcrumb-spacer")) "/"))))

(define (navbar)
  `(header (nav 
    ,@(for/list ([b bc-list]) b))))

; Sections
(define (section . xs)
  `(h2 ,@xs))
(define (subsection . xs)
  `(h3 ,@xs))
(define (sectionlink url . xs)
  `(h2 (a ((href, url) (class "section-link")) ,@xs)))
(define (abstract . xs)
  `(div ((class "abstract") (id "abstract")) ,@xs))

; Index Header
(define (index-name . xs)
  `(h1 ((class, "index-name")) ,@xs))

; Lists
(define items (default-tag-function 'ul))
(define sequence (default-tag-function 'ol))
(define item (default-tag-function 'li 'p))
(define li (default-tag-function 'li))
(define bullet-list (default-tag-function 'ul))

; Links


;;; (define (outlink url . tx-elements)
;;;   (apply link url #:class "out-link" #:target "_blank" tx-elements))
;;; (define (maillink url . tx-elements)
;;;   (let ([link-body (if (empty? tx-elements)
;;;                        (list url)
;;;                        tx-elements)])
;;;     (apply link (string-append "mailto:" url) #:class "mail-link" link-body)))

; Code
(define (code . xs)
  `(pre (code ((class "block")) ,@xs)))
(define (inline-code . xs)
  `(code ((class "inline")) ,@xs))

(define (synlink url #:type [syn-type #f] . xs)
  (if syn-type
    `(a ((href, url) (class "syn-link")) (span ((class "syn-type")) ,syn-type) (span ((class "syn-label")) ,@xs))
    `(a ((href, url) (class "syn-link")) (span ((class "syn-label")) ,@xs))))


;;; Indexing

(define (make-t-summary metas doc output-path )
  (let* ((title     (select-from-metas 'title metas))
         (published (select-from-metas 'published metas))
         (post      (path->string output-path))
         (title-txt
          (if title `(dd ,(link post title)) 
                    "")))

    `(@ (dt ,published) ,title-txt )
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
