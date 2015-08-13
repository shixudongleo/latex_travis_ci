# LaTeX Build with Travis CI

## Dependency
* TextLive
* latexmk

## Configure .travis.yml

``` YAML
install:
    - sudo add-apt-repository -y ppa:texlive-backports/ppa
    - sudo apt-get update
    - sudo apt-get install -y texlive-latex-extra
    - sudo apt-get install -y texlive-luatex
    - sudo apt-get install -y texlive-fonts-extra
    - sudo apt-get install -y texlive-bibtex-extra
    - sudo apt-get install -y latexmk

script:
    - make once

deploy:
    provider: releases
    api_key:
        secure: pR/INcpVYqAeJGeuFab+V79FAykRjeuodM5X2uBI6w3T5/MAUy/Ddwic9HBgGn2WMKrfXIyFvOvQL9tF8hhALncjjlsFsD9dMNR1bx7QJ29578caIM0G2BWPVEdYGJSMco4mJk2glgvy++BiId+tnbnegjIA50yLtdZyPnLduaoTVGTk2u5zgmlCJXfCz6RT103MCtALgjEh8Ooc2CAGagV4jlDnGmrTsSzKRuXxI2fMwOd46KjMcvHNriRS6dsV/3VqiUI0avdb/TES0H2NzaiCu8rdpU3K9ALNq03wZeWJOxhgNPLVgB/JJ2T32qet06Lgah8SY1Y5byc3TO+C6oTpSmBi5NKtG4B9nnZsT/daUecKY0s1Zl9ILdMv3PaxYDrNlosJtIQagLHJOICMPfpt+I3Sdn5DedMzBStqoDFCjEx+HpnRGa3GTjbblzpnTb0BOWMW+WQF7lt/JdP1rNubRq8f1fKbF9h8Q2vht8trbl+XR8u9yu1BZxoZPxLBFprpYoPKicPN7+DRphq0ZzlElT6pGaFA9Hh+4kRzBJJkNA4ZyjStl6k4G5UBhvcJy4ALqHiLJcJ4TrhjavDAdVCEPm1upq+jww19AUPx/su6LfMx0Y1xVKyL9yaK7hgfYjQEmdDmFl8SWQ+hxlDJ5gY/Gt2Jekr4egrQVEco1yA=
    file: main.pdf
    skip_cleanup: true
    on:
        tags: true
```

The "api_key" is generated from Github.
The recommend way of authentication is to generate secure oauth token using
[travis command line
tool](https://github.com/travis-ci/travis.rb#installation).

``` shell
$ travis setup releases
```

## How It Works
The Travis CI works by, for each build, create a virtual machine(new infrastructure
use container), clone the code, install the required environment, run the test case,
upload the build package if required.

1. code modify will trigger build
    Each time the code is push to Github, the build start.

    ``` shell
    $ git push origin master
    ```
2. tag commit will trigger build and upload releases
    Tag commit can be done using the following command:

    ``` shell
    $ # create a new tag
    $ git tag -a v1.0 -m "v1.0 tag commit"
    $ # push all tags
    $ git push --tag
    $ # push single tag
    $ git push origin v1.0
    ```

## Reference:
* [LaTex, Github and Travis CI](http://johntfoster.github.io/posts/managing-a-professional-website.html)
* [Setup LaTeX and Travis CI](http://harshjv.github.io/blog/setup-latex-pdf-build-using-travis-ci)
* [Travis CI Docs for release upload](http://docs.travis-ci.com/user/deployment/releases)



