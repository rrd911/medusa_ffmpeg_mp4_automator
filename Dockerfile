FROM linuxserver/medusa
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
pipx \
python3-dev \
py3-setuptools \
py3-requests \
py3-requests-cache \
py3-wheel \
py3-idna \
py3-babelfish \
py3-guessit \
#subliminal \
#py3-stevedore \
py3-dateutil \
#py3-tmdbsimple \
py3-mutagen \
nano && \
apk update && apk upgrade &&\

# install pip, venv, and set up a virtual self contained python environment
#python3 -m pipx install --upgrade pip && \
#python3 -m pip install setuptools && \
#python3 -m pip install requests[security] && \
#python3 -m pip install wheel && \
#python3 -m pip install idna && \
#python3 -m pip install requests && \
#python3 -m pip install requests-cache && \
#python3 -m pip install babelfish && \
#python3 -m pip install guessit && \
#python3 -m pip install subliminal && \
python3 -m pipx install stevedore && \
#python3 -m pip install python-dateutil && \
#python3 -m pip install qtfaststart && \
#python3 -m pip install tmdbsimple && \
#python3 -m pip install mutagen && \
#python3 -m pip install cleanit && \

# download sickbeard_mp4_automator repo
git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator

#set permissions on sickbeard_mp4_automator directory
RUN chown -R 1000:998 /app/sickbeard_mp4_automator

# link autoProcess.ini under persistant config folder
RUN ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/config/autoProcess.ini
