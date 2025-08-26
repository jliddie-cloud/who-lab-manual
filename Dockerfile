FROM conoria/alpine-r-bookdown

WORKDIR /usr/src

COPY . .

# (Usually these are already in the base image, but harmless if repeated)
RUN R -q -e 'install.packages(c("bookdown","rmarkdown"), repos="https://cloud.r-project.org")'

# Respect _bookdown.yml (which sets output_dir: "docs")
RUN R -q -e 'bookdown::render_book("index.Rmd")' \
 && touch docs/.nojekyll
