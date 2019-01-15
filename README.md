# medusa_ffmpeg_mp4_automator
Combination of Medusa, FFMPEG, and MP4_Automator

Base Image:
https://hub.docker.com/r/pymedusa/medusa

MP4 conversion script:
https://github.com/mdhiggins/sickbeard_mp4_automator

Image update:
Additional python dependencines and FFMPEG


So I created this image to ensure video files are in a format that will play best on my Plex clients. I chose to go with h264/mp4/aac sinced it seems to be the most universal format for the devices that will play content from my Plex server.

Basic Instructions:
1.) pull the docker image:
I used the following as a guide to build my docker server on Ubuntu 16.04
https://www.smarthomebeginner.com/docker-home-media-server-2018-basic

docker-compose.yml sample
https://github.com/rrd911/medusa_ffmpeg_mp4_automator/blob/master/docker-compose.yml

 medusa-kids-mp4:
    image: raydiasdockerhub/medusa_ffmpeg_mp4_automator
    container_name: medusa-kids-mp4
    hostname: medusa-kids-mp4
    ports:
    - "8083:8081"
    volumes:
    - ${USERDIR}/docker/medusa-kids-mp4:/config
    - ${USERDIR}/Downloads/completed/anime:/downloads/anime
    - ${USERDIR}/Downloads/completed/tvshows:/tv2
    - ${USERDIR}/Downloads/completed/kids_tv:/kids_tv
    - ${USERDIR}/docker/certs:/certs
    - /media/tv_shows:/media/tv_shows
    - /media/tv:/media/tv
    - /media/PlexNAS/TV_Shows:/media/PlexNAS/TV_Shows
    - /media/anime:/media/anime
    - /media/PlexNAS/LittleRay:/media/PlexNAS/LittleRay
    - /media/ramdisk:/ramdisk
    - /media/qnap_kidstv:/media/qnap_kidstv
    - /media/qnap_tv:/media/qnap_tv
    - /media/qnap_anime:/media/qnap_anime
    environment:
    - PUID=${PUID}
    - PGID=${PGID}
    - TZ=${TZ}
    restart: unless-stopped

2.) Either copy the autoProcess.ini from my git repo or copy the autoProcess.ini.sample from within the docker image /app/sickbeard_mp4_automator directory to /config directory of the docker image and rename it autoProcess.ini

The /app/sickbeard_mp4_automator/autoProcess.ini file is a symlink to the /config/autoProcess.ini so the settings should be retained when the image is updated.

3.) modify Sickbeard and Sickrage section of the the /config/autoProcess.ini adding the api key for medusa. Modify any other paramaters you like.

4.) Enable post process in the Post Processing settings of medusa and add to the extra scripts the path to the post processing script: /usr/bin/python /app/sickbeard_mp4_automator/postConversion.py then save the settings. Be sure verify they are saved correctly 

5.) I restarted the docker medusa image and watched the logs via portainer to see if there are any errors. Then I took a video file and ran a test post processing while watching the medusa logs for any errors.

I may have missed something so let me know.

