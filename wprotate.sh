#!/bin/bash
# wprotate
# chooeses and sets a random wallpaper from your wallpaper-directory

WP_DIR="${HOME}/img/wallpapers/"

# find unused files, store in $UNUSED
for file in $(find ${WP_DIR} -type f); do
  attr -g used ${file} > /dev/null 2>&1 || {
    UNUSED+=${file}$'\n'
    ((UNUSED_COUNT++))
  }
done

# if all wallpapers are used, remove used flag from all
if test -z ${UNUSED_COUNT}; then
  for file in $(find ${WP_DIR} -type f); do
    attr -r used ${file}
  done

  UNUSED=$(find ${WP_DIR} -type f)
  UNUSED_COUNT=$(ls -1 ${WP_DIR} | wc -l)
fi


# get a random image file from UNUSED files
RND=$(shuf -i 1-${UNUSED_COUNT} -n 1)
RND_FILE=$(printf '%s\n' ${UNUSED} | sed "${RND}q;d")


feh --bg-fill "${WP_DIR}/black.png" "${RND_FILE}"
attr -s used -V 1 "${RND_FILE}" > /dev/null 2>&1
