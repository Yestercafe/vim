#!env python3

import os
import time


def main():
    print(time.localtime())
    os.system('./add-submodule.sh')
    os.system('git add -A')
    os.system('git commit -m "%s"' % time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
    os.system('git push origin master')


if __name__ == '__main__':
    main()
