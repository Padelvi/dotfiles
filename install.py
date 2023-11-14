#!/usr/bin/python

import os
import sys
import platform
import json

def install():
    print("Installing...")
    print(sys.argv)
    print(platform.freedesktop_os_release()["ID"])

if __name__ == "__main__":
    if sys.platform != "linux":
        print("Get linux!")
        sys.exit(1)
    install()
