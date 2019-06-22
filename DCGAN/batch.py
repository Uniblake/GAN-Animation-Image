# -*- coding: utf-8 -*-
"""
Created on Fri May 31 11:20:49 2019

@author:（王舒凡）
"""

import os
import random

def main():    
#    os.system("cd /d E:\SJTU_Files\application_design\pytorch-book\chapter7")
    for i in range(36, 40):
        idx = 10*i
        prefix = "python main.py generate --vis=False --netd-path=checkpoints/netd_"
        mid = ".pth --netg-path=checkpoints/netg_"
        posfix = ".pth  --gen-img=result_{0}.png  --gen-num=64".format(idx)
        cmd = "".join([prefix, str(idx), mid, str(idx), posfix])
        os.system(cmd)
        print("{0} is finished".format(cmd))
    
if __name__ == "__main__":
    main()