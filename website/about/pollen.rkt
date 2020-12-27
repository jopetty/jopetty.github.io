#lang racket

(require racket/format racket/path
         txexpr
         colophon/common colophon/components colophon/predicates
         pollen/cache pollen/core pollen/decode pollen/file)

(require "../pollen.rkt")

(define breadcrumb 
  (list (cons "Jackson Petty" "/") 
        (cons "About" "/about/")))

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

(module setup racket/base
  (provide (all-defined-out))
  (require pollen/setup)
  (define block-tags (cons 'more default-block-tags)))

(provide (all-defined-out))
(provide (all-from-out "../pollen.rkt"))