FROM ghcr.io/gohugoio/hugo:v0.166.0 AS HUGO 

USER root
COPY --chmod=666 . /foo/
RUN chown hugo:hugo -R -v /foo/
RUN chown hugo:hugo -R -v /usr/bin/hugo
RUN git config --global --add safe.directory /foo


ENTRYPOINT ["hugo", "server", "-s", "/foo/", "--bind", "0.0.0.0" ]

