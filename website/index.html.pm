#lang pollen
 
◊(define-meta title "Jackson Petty" )

◊publication[ 
  #:id "anaphora"
  #:type 'conference-paper
  #:author (@ "Robert Frank & " (strong "Jackson Petty"))
  #:title "Sequence-to-Sequence Networks Learn the Meaning of Reflexive Anaphora"
  #:year "2020"
  #:month "December" 
  #:day "2"
  #:url "/publications/sequence-to-sequence-networks-learn-the-meaning-of-reflexive-anaphora.html"
  #:arxiv "2011.00682"
  #:journal "Proceedings of the Third Workshop on Computational Models of Reference, Anaphora and Coreference"
  #:editor "Maciej Ogrodniczuk and Vincent Ng and Yulia Grishina and Sameer Pradhan" 
  #:address "Barcelona, Spain (online)"
  #:publisher "Association for Computational Linguistics"
  #:pages "154--164"
  #:links '(("ACL" . "https://www.aclweb.org/anthology/2020.crac-1.16/")
            ("arxiv" . "https://arxiv.org/abs/2011.00682")
            ("Slides" . "/static/files/CRAC_2020.pdf")
            ("Talk" . "/static/files/CRAC_2020.m4v"))
] 
 
◊publication[ 
  #:id "tiles" 
  #:type 'article 
  #:year "2021"
  #:month "January"
  #:day "30"
  #:editor "John R Parker & Jean-Marc Schlenker"
  #:journal "Geometriae Dedicata"
  #:arxiv "1910.12966"
  #:address "Online"
  #:publisher "Springer"
  #:author (@ "Jack Hirsch & Kevin Li & " (strong "Jackson Petty") " & Christopher Xue")
  #:title "Certain Hyperbolic Regular Polygonal Tiles Are Isoperimetric"
  #:links '(("arxiv" . "https://arxiv.org/abs/1910.12966"))
] 

◊publication[
  #:id "bubbles"
  #:type 'article
  #:year "2021"
  #:month "January"
  #:day "30"
  #:editor "Timothy All et al"
  #:title '(@ "The Optimal Double Bubble for Density " (em "r" (sup "p")))
  #:author (@ "Jack Hirsch & Kevin Li & " (strong "Jackson Petty") " & Christopher Xue")
  #:journal "Rose-Hulman Undergraduate Mathematics Journal"
  #:publisher "Rose-Hulman Institute of Technology"
  #:address "Online"
  #:arxiv "1908.10766"
  #:links '(("arxiv" . "https://arxiv.org/abs/1908.10766"))
]

◊publication[
  #:id "tiles-extra"
  #:type 'article
  #:year "2021"
  #:month "January" 
  #:day "30"
  #:editor "Timothy All et al"
  #:title "Optimal Monohedral Tilings of Hyperbolic Surfaces"
  #:author (@ "Leonardo DiGiosia & Jahangir Habib & Jack Hirsch & Lea Kenigsberg & Kevin Li & Dylanger Pittman & " (strong "Jackson Petty") " & Christopher Xue & Weitao Zhu")
  #:journal "Rose-Hulman Undergraduate Mathematics Journal"
  #:publisher "Rose-Hulman Institute of Technology"
  #:address "Online"
  #:arxiv "1911.04476"
  #:links '(("arxiv" . "https://arxiv.org/abs/1911.04476"))
]
  
◊items[#:class "link-list" #:style "display: inline !important;"]{
  ◊li{◊sectionlink["/about/"]{About}}
  ◊li{◊sectionlink["/publications/"]{Publications}}
  ◊li{◊sectionlink["/essays/"]{Essays}}
}
 
◊h2{Recent}

◊items[#:class "feed"]{
  ◊item{
    ◊span[#:class "feed-header"]{publication • 2021} ◊get-citation["tiles"]
  }
  ◊item{
    ◊span[#:class "feed-header"]{publication • 2021} ◊get-citation["tiles-extra"]
  }
  ◊item{
    ◊span[#:class "feed-header"]{publication • 2021} ◊get-citation["bubbles"]
  }
  ◊item{
    ◊span[#:class "feed-header"]{publication • 2 December 2020} ◊get-citation["anaphora"] 
  }
}
