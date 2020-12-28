#lang racket

(require pollen/core "components.rkt")

(provide (all-defined-out))

(define (if-else item value)
  (if item item value))

(define the-bibliography (make-hash))

(define (publication 
  #:id id; unique identifier
  #:type type
  #:title [title #f] 
  #:author [author #f] ; authors, separated by &, grouped with { ... }
  #:editor [editor #f] ; editors, separated by &, grouped with { ... }
  #:year [year #f] 
  #:month [month #f]
  #:day [day #f]
  #:publisher [publisher #f]
  #:address [address #f]
  #:url [url #f]
  #:arxiv [arxiv #f]
  #:github [github #f]
  #:journal [journal #f]
  #:pages [pages #f]
  #:links [links #f]
  #:abstract [abstract #f])
    (define this-work
      (hash 'type type
            'title title
            'author author
            'editor editor
            'year year
            'month month
            'day day
            'publisher publisher
            'address address
            'url url
            'arxiv arxiv
            'github github
            'journal journal
            'pages pages
            'links links
            'abstract abstract))
    (hash-set! the-bibliography id this-work))

(define (get-citation id)
  ;;; Retreive the publication and it's type from bibliography
  (define pub (hash-ref the-bibliography id))
  (define type (hash-ref pub 'type))

  ;;; (format-full-work type pub)

  
  ;;; These fields should substitute default values if none are provided
  (define author (if-else (hash-ref pub 'author) "No Author"))
  (define title (if-else (hash-ref pub 'title) "Untitled"))
  
  ;;; ... otherwise, just pull them from the hash table
  (define url (hash-ref pub 'url))
  (define links (hash-ref pub 'links))
  (define pages (hash-ref pub 'pages))

  `(@
    ,author 
    ", " 
    ,(if url
      `(a [(href ,url) (class "x-link")] (@ "“" ,title ".”"))
      `(@ "“" ,title ".”"))
    " In: "
    (em ,(hash-ref pub 'journal))
    ". Ed. by "
    ,(hash-ref pub 'editor)
    ". "
    ,(hash-ref pub 'address)
    ": "
    ,(hash-ref pub 'publisher)
    ,(when pages 
      `(@ ", pages " ,(hash-ref pub 'pages) ))
    ". "
    ,(if links 
      (for/splice ([l links])
        `(@ "[" ,(apply link (cdr l) (list (car l))) "] "))
      "")
    ))