# Mattermost Slack Emoji Transfer Tool

# Copyright (c) 2023 Maxwell Power
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom
# the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
# AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

FROM python

LABEL org.opencontainers.image.source = "https://github.com/maxwellpower/mmemoji"

RUN apt-get update \
&& apt-get install -yqq --no-install-recommends ruby-full imagemagick \
&& apt-get autoremove --purge -yqq \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& pip install mmemoji \
&& mkdir mmemoji

COPY docker-entrypoint downloadEmoji resizeEmoji cleanSystemEmoji /usr/local/bin/

WORKDIR ["mmemoji"]

ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "run" ]
