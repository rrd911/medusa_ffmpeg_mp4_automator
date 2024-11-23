FROM linuxserver/medusa:latest
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
py3-setuptools \
pipx \
python3-dev \
py3-setuptools \
py3-wheel \
py3-idna \
py3-requests \
py3-requests-cache \
py3-babelfish \
py3-guessit \
dateutils \
py3-dateutil \
mutagen \
nano && \

# install pip, venv, and set up a virtual self contained python environment
pipx ensurepath && \
#pipx install setuptools && \
#pipx install requests[security] && \
#pipx install wheel && \
#pipx install idna && \
#pipx install requests && \
#pipx install requests-cache && \
#pipx install babelfish && \
#pipx install guessit && \
pipx install subliminal && \
#pipx install stevedore && \
#pipx install python-dateutil && \
pipx install qtfaststart && \
#pip install tmdbsimple && \
#pipx install tmdbsimple && \
#pipx install mutagen && \
pipx install cleanit && \

# download sickbeard_mp4_automator repo
git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator

#set permissions on sickbeard_mp4_automator directory
RUN chown -R 1000:998 /app/sickbeard_mp4_automator

# link autoProcess.ini under persistant config folder
RUN ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/config/autoProcess.ini
