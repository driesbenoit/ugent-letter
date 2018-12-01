# Version v0.1-0
The aim of this letter template for UGent-style letters in LaTeX:
* A theme that closely resembles the official UGent MS Word letter themes.
* Similar theme options as the [UGent beamer theme](https://github.com/driesbenoit/ugent-beamer).
* Faculty specific versions.
* Ease-of-use for the average LaTeX user.

Requires the package [helvet](https://ctan.org/pkg/helvet) and [letter](https://ctan.org/pkg/letter) to be 
installed in your LaTeX distribution. Also depends on other packages that are include in most LaTeX 
distributions (kvoptions, graphicx, xcolor, ifthen, fontenc, inputenc and lastpage).

Demo
----
Extended examples are available. See the `example` folder.

Some example letters:

![](https://github.com/driesbenoit/ugent-letter/blob/master/example-screenshots/example1.png)
![](https://github.com/driesbenoit/ugent-letter/blob/master/example-screenshots/example2.png)
![](https://github.com/driesbenoit/ugent-letter/blob/master/example-screenshots/example3.png)

Download
========
Download the latest release by following [this](https://github.com/driesbenoit/ugent-letter/releases) link.

Installation
============
The theme is an addendum for LaTeX, hence it is assumed that you have a running LaTeX installation.

Once you have the files, all that is required for the theme to work is putting the files into a directory where LaTeX can find them. This boils down to mimicking the so called TDS (or TeX Directory Structure).

Ad-hoc installation 
-------------------
After downloading, copy the files named ugent-letter.cls, defaultsender-nl.tex, defaultsender-en.tex, together with all *.png files from the image folder, into the same folder as your LaTeX source file.

Then load the ugent-letter class by writing:
```latex
\documentclass[faculty=eb]{ugent-letter}
```
in the preamble of your document.

Global installation
-------------------
In case you're using your favorite flavor of Unix (and/or TeX Live) you need to have a local directory (this will probably be ~/texmf/) and you need to place all the files from the theme folder in the directory ~/texmf/tex/latex/mystyles/ugent-letter/, finishing it by running texhash.

If on the other hand you're on Windows (probably MiK\TeX) the walkthrough at [this url](http://docs.miktex.org/manual/localadditions.html) explains in detail how to create a local installation. Don't forget to Refresh FNDB as explained [here](http://docs.miktex.org/manual/configuring.html#fndbupdate).

Usage
=====
Refer to the extended examples (`example/exampleX.tex`) for an overview of the possibilities of the style file.

Class options
-------------
The theme options can be set as follows:
`\usepackage[optionshere]{ugent-letter}`

* `language=x`, where x is the language
  * `nl`: dutch (default)
  * `en`: english
* `faculty=x`, where x is the abbreviation of the faculty
  * `lw`: Faculty of Literature & Philosophy
  * `re`: Faculty of Law
  * `we`: Faculty of Science
  * `ge`: Faculty of Medicine and Health Sciences
  * `ea`: Faculty of Engineering and Architecture
  * `eb`: Faculty of Economics and Business Administration
  * `di`: Faculty of Veterinary Medicine
  * `pp`: Faculty of Psychology and Educational Sciences
  * `bw`: Faculty of Bioscience Engineering
  * `fw`: Faculty of Pharmaceutical Sciences
  * `ps`: Faculty of Political and Social Sciences
* `signature` 
  * Add this option to use the signature file to sign the letter (see below)
  * Replace the file `signature.png` by your own signature
* `pagenumbers`
  * This option enables page numbers in the format [current page]/[total pages]
* `rightcolwidth`
  * This option defines the width of the right column (where department and 'from' information appears)
  * It represents the the percentage of the total `\textwidth` and defaults to 0.25
  * You might want to change this value in case of e.g. long department names
  
Default 'from' information
--------------------------
Adjust the `defaultsender-en.tex` and `defaultsender-nl.tex` to set the default 'from' information. By doing so,
the 'from' macro's do not have to be defined for every new letter.

Signature file
--------------
Replace the `signature.png` file in the image folder with your own signature to sign letter electronically. This file
can, for example, be created with [ImageMagic](https://www.imagemagick.org):
* Make a scan of your signature
* Run the following ImageMagic commands:
  * `convert inputfile.png -white-threshold 70% outputfile.png`
  * `convert inputfile.png -trim outputfile.png`
  * `convert inputfile.png -transparent white outputfile.png`

Note that you might want to increase one ore more margins of the resulting file, so that the size of the signature matches
the fontsize of the letter.
  
License
=======
This software is released under the [GNU GPL v3.0 License](https://www.gnu.org/licenses/gpl-3.0.en.html).

Contact
=======
If you are enjoying this theme please share it with your colleagues or friends!

Any suggestions, comments, criticism or appreciation are welcome!
