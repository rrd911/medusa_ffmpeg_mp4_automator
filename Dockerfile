FROM linuxserver/medusa
RUN \
echo "**** install packages ****" && \
apk update && apk add --no-cache \
ffmpeg \
git \
rust \
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

# download sickbeard_mp4_automator repo
git clone git://github.com/mdhiggins/sickbeard_mp4_automator.git /app/sickbeard_mp4_automator && \
chown -R abc:ping /app/sickbeard_mp4_automator && \
ln -s /config/autoProcess.ini /app/sickbeard_mp4_automator/config/autoProcess.ini && \

# install pip, venv, and set up a virtual self contained python environment
python3 -m pip install --user --upgrade pip && \
python3 -m pip install r /app/sickbeard_mp4_automator/setup/requirements.txt
