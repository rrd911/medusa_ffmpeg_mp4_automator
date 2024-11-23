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
pipx \
python3-dev \
nano && \

# install pip, venv, and set up a virtual self contained python environment
python3 -m venv ~/py_envs
source ~/py_envs/bin/activate
python3 -m pip install --user --upgrade pip && \
python3 -m pip install --user setuptools && \
python3 -m pip install --user requests[security] && \
python3 -m pip install --user wheel && \
python3 -m pip install --user idna && \
python3 -m pip install --user requests && \
python3 -m pip install --user requests-cache && \
python3 -m pip install --user babelfish && \
python3 -m pip install --user guessit && \
python3 -m pip install --user subliminal && \
python3 -m pip install --user stevedore && \
python3 -m pip install --user python-dateutil && \
python3 -m pip install --user qtfaststart && \
python3 -m pip install --user tmdbsimple && \
python3 -m pip install --user mutagen && \
python3 -m pip install --user cleanit && \

# download sickbeard_mp4_automator repo
git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator

#set permissions on sickbeard_mp4_automator directory
RUN chown -R 1000:998 /app/sickbeard_mp4_automator

# link autoProcess.ini under persistant config folder
RUN ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/config/autoProcess.ini
