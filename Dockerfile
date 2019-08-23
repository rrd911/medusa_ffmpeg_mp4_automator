FROM linuxserver/medusa
RUN \
echo "**** install packages ****" && \
apk add --no-cache \
ffmpeg \
git \
nano && \
python3 pip install --upgrade pip && \
python3 pip install requests && \
python3 pip install requests[security] && \
python3 pip install requests-cache && \
python3 pip install babelfish && \
python3 pip install 'guessit<2' && \
python3 pip install 'subliminal<2' && \
python3 pip install stevedore==1.19.1 && \
python3 pip install python-dateutil && \
python3 pip install qtfaststart && \
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/autoProcess.ini
