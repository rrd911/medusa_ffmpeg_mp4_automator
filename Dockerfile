FROM pymedusa/medusa:latest

RUN \
echo "**** install packages ****" && \
apk add --no-cache \
ffmpeg && \
pip install --upgrade pip && \
pip install requests && \
pip install requests[security] && \
pip install requests-cache && \
pip install babelfish && \
pip install 'guessit<2' && \
pip install 'subliminal<2' && \
pip install stevedore==1.19.1 && \
pip install python-dateutil && \
pip install qtfaststart

RUN \
echo "**** install mp4_automator ****" && \
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /config/sickbeard_mp4_automator && \
chown -R abc:ping /config/sickbeard_mp4_automator
