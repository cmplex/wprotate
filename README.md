wprotate
========

Helper script that sets a random wallpaper from your wallpaper-directory using feh


**Requirements:**

* xattr support on $HOME
* feh image viewer
* bash


**Installation:**

* Install `attr` and `feh` on your system, e.g.:
```# apt-get install attr feh```

The xattr kernel module for your file system should be included in your distribution's stock kernel.

* Optional: copy the script to a folder included in your $PATH, e.g.:

```# cp wprotate.sh /usr/bin/wprotate```

* Optional: call the script on regular intervals in a userspace startup script, e.g.:

`~/.config/openbox/autostart.sh`:

```
{
  while true; do
    wprotate
    sleep 20m
  done
} &
```
