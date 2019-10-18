FROM linuxserver/medusa
RUN \
echo "**** install packages ****" && \
apk add --no-cache \
ffmpeg \
git \
python3 \
python3-pip \
nano && \
# install pip, venv, and set up a virtual self contained python environment
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
# download repo
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/autoProcess.ini
