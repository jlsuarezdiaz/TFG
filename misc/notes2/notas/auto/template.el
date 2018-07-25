(TeX-add-style-hook
 "template"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("parskip" "parfill") ("fncychap" "Lenny")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "microtype"
    "fancyhdr"
    "lastpage"
    "calc"
    "extramarks"
    "geometry"
    "parskip"
    "fncychap"
    "float"
    "hyperref")
   (TeX-add-symbols
    "pageWord"
    "ofWord"
    "rheadtext"
    "chaptermark"))
 :latex)

