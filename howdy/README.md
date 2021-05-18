use latest verison of howdy on github
apply commit mentioned on howdy page in arch wiki
rebuild and install


An example with i3lock or betterlockscreen, change permissions for the howdy folder in /lib/security by running the command:
```chmod -R 755 /lib/security/howdy```
and edit the i3lock file `/etc/pam.d/i3lock`: 
```
#
# PAM configuration file for the i3lock-color screen locker. By default, it includes
# the 'system-auth' configuration file (see /etc/pam.d/system-auth) for Arch and Gentoo
# and 'login' for Debian. Note that vanilla i3lock upstream uses 'login' instead.
#

auth sufficient pam_python.so /lib/security/howdy/pam.py
auth include system-auth # For Arch/Gentoo
#auth include login # For Debian
```

##Real Fix
`chmod -R 755 /lib/security/howdy`
