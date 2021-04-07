FROM pymedusa/medusa
RUN \
echo "**** install packages ****" && \
apk add --update --no-cache bash \
ffmpeg \
git \
python3 \
gcc \
libffi-dev \
libc-dev \
openssl-dev \
libxml2-dev \
libxslt-dev \
musl-dev \
cargo \
py3-pip \
python3-dev \
nano && \

# download sickbeard_mp4_automator repo
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
#chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/config/autoProcess.ini && \

# install pip, venv, and set up a virtual self contained python environment
python3 -m pip install --user -U pip && \
python3 -m pip install setuptools && \
python3 -m pip install requests[security] && \
python3 -m pip install cryptography && \
python3 -m pip install requests && \
python3 -m pip install requests-cache && \
python3 -m pip install babelfish && \
python3 -m pip install guessit && \
python3 -m pip install subliminal && \
python3 -m pip install stevedore && \
python3 -m pip install python-dateutil && \
python3 -m pip install qtfaststart && \
python3 -m pip install tmdbsimple && \
python3 -m pip install idna && \
python3 -m pip install wheel && \
python3 -m pip install mutagen

