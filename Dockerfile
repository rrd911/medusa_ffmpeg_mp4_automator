FROM pymedusa/medusa
RUN \
echo "**** install packages ****" && \
apk add --no-cache \
ffmpeg \
nano && \
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
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/autoProcess.ini
