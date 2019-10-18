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
py2-pip \
py3-pip \
python2-dev \
python3-dev \
nano && \
# install pip, venv, and set up a virtual self contained python environment
#pip install --upgrade pip && \
#pip install requests && \
#pip install requests[security] && \
#pip install requests-cache && \
#pip install babelfish && \
#pip install 'guessit<2' && \
#pip install 'subliminal<2' && \
#pip install stevedore==1.19.1 && \
#pip install python-dateutil && \
#pip install qtfaststart && \
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
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/autoProcess.ini
