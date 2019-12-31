FROM linuxserver/medusa
RUN \
echo "**** install packages ****" && \
apk update && apk add --no-cache \
ffmpeg \
git \
python3 \
gcc \
libffi-dev \
libc-dev \
openssl-dev \
libxml2-dev \
libxslt-dev \
py3-pip \
python3-dev \
nano && \
# install pip, venv, and set up a virtual self contained python environment
python3 -m pip install --user --upgrade pip && \
python3 -m pip install requests && \
python3 -m pip install requests[security] && \
python3 -m pip install requests-cache && \
python3 -m pip install babelfish && \
python3 -m pip install 'guessit<2' && \
python3 -m pip install 'subliminal<2' && \
python3 -m pip install 'stevedore==1.19.1' && \
python3 -m pip install python-dateutil && \
python3 -m pip install qtfaststart && \
python3 -m pip install tmdbsimple && \
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/autoProcess.ini
