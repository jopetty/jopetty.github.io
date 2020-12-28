#lang racket

(require pollen/core pollen/tag txexpr)
(provide (all-defined-out))

(define (link url . tx-elements)
  (cond
    [(string-prefix? url "http") ; external link
      (apply anchor url #:class "out-link" #:target "_blank" tx-elements)] 
    [(string-prefix? url "mailto") ; mailto link
      (if (empty? tx-elements)
        (apply anchor url (list (string-trim url "mailto:"))) ; use address as text, minus "mailto:"
        (apply anchor url tx-elements))] 
    [else (apply anchor url #:class "x-link" tx-elements) ] ; internal link
  ))

(define (anchor url #:class [class #f] #:target [target #f] . tx-elements)
  (let* ([tx-elements (if (empty? tx-elements)
                          (list url)
                          tx-elements)]
         [link-tx (txexpr 'a empty tx-elements)]
         [link-tx (attr-set link-tx 'href url)]
         [link-tx (if target (attr-set link-tx 'target target) link-tx)])
  (if class
    (attr-set link-tx 'class class)
    link-tx)))