#!/bin/bash
# wprotate
# chooeses and sets a random wallpaper from your wallpaper-directory

WP_DIR="${HOME}/img/wallpapers/"

NO_OF_WALLPAPERS=$(ls -1 ${WP_DIR} | wc -l)
RND=$(shuf -i 1-${NO_OF_WALLPAPERS} -n 1)
RND_FILE=$(ls -1 ${WP_DIR} | sed "${RND}q;d")

feh --bg-fill "${WP_DIR}/black.png" "${WP_DIR}/${RND_FILE}"
