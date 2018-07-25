(TeX-add-style-hook
 "title1"
 (lambda ()
   (TeX-run-style-hooks
    "graphicx"
    "ifthen"
    "tikz")
   (TeX-add-symbols
    "titlepageauthor"
    "titlepageabstractauthor"
    "titlepagebottom"
    "titlepagedecoration"))
 :latex)

