FROM pymedusa/medusa
RUN \
echo "**** install packages ****" && \
apk update && apk upgrade && apk add --no-cache \
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

# install pip, venv, and set up a virtual self contained python environment
python3 -m pip install --user --upgrade pip && \
python3 -m pip install setuptools && \
python3 -m pip install requests[security] && \
python3 -m pip install wheel && \
python3 -m pip install idna && \
python3 -m pip install requests && \
python3 -m pip install requests-cache && \
python3 -m pip install babelfish && \
python3 -m pip install guessit && \
python3 -m pip install subliminal && \
python3 -m pip install stevedore && \
python3 -m pip install python-dateutil && \
python3 -m pip install qtfaststart && \
python3 -m pip install tmdbsimple && \
python3 -m pip install mutagen && \
python3 -m pip install cleanit && \

# download sickbeard_mp4_automator repo
git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator

#set permissions on sickbeard_mp4_automator directory
RUN chown -R 1000:998 /app/sickbeard_mp4_automator

# link autoProcess.ini under persistant config folder
RUN ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/config/autoProcess.ini
