FROM linuxserver/medusa
RUN \
echo "**** install packages ****" && \
apk update && apk add --no-cache \
ffmpeg \
git \
python3 \
py2-pip \
py3-pip \
python3-dev \
python3-dev \
nano && \
# install pip, venv, and set up a virtual self contained python environment
pip install --upgrade pip && \
pip install requests && \
pip install requests[security] && \
pip install requests-cache && \
pip install babelfish && \
pip install 'guessit<2' && \
pip install 'subliminal<2' && \
pip install stevedore==1.19.1 && \
pip install python-dateutil && \
pip install qtfaststart && \
  python3 -m pip install --user --upgrade pip && \
  python3 -m pip install --user virtualenv && \
  mkdir /usr/local/bin/sma && \
  python3 -m virtualenv /usr/local/bin/sma/env && \
  /usr/local/bin/sma/env/bin/pip install requests \
    requests[security] \
    requests-cache \
    babelfish \
    'guessit<2' \
    'subliminal<2' \
    'stevedore==1.19.1' \
    python-dateutil \
    qtfaststart && \
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/autoProcess.ini
