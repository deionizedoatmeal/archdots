-> clone rmview from github
-> in the repo `python pip .`
-> run `rmview`, autoinstall
-> set up login credentials
-> for password login set 
```
"auth_method":
            "password",
```
in `rmview.json`
-> copy the libcrypto 2 library onto device:
```
scp /path/libcrypto.so.1.0.2 root@192.168.0.109:/usr/lib/. 
```

