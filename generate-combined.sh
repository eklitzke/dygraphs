#!/bin/bash
# Generates a single JS file that's easier to include.

if [ -z "$TMPDIR" ]; then
  TMPDIR=/tmp
fi

# Pack the dygraphs JS and rgbcolor
cat \
dygraph-canvas.js \
dygraph.js \
rgbcolor/rgbcolor.js \
strftime/strftime-min.js \
> ${TMPDIR}/dygraph.js

java -jar yuicompressor-2.4.2.jar /tmp/dygraph.js \
> ${TMPDIR}/dygraph-packed.js

# TODO(danvk): ensure the dygraphs copyright, etc. gets into the packed js.

cat \
${TMPDIR}/dygraph-packed.js \
> dygraph-combined.js
