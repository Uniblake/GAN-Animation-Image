# -*- coding: utf-8 -*-
#created by 张旭
import os
import cv2
import sys
from glob import glob


        

def main():
    imagelist=glob('image/*.jpg')
    for oldimage in imagelist:
        detect(oldimage,"lbpcascade_animeface.xml")

def detect(target,standard):
    mystandard = cv2.CascadeClassifier(standard)
    image=cv2.imread(target)
    scale=cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
    realscale=cv2.equalizeHist(scale)

    face=mystandard.detectMultiScale(realscale,scaleFactor=1.1,minNeighbors=5,minSize=(24,24))
    
    for i,(x,y,w,h) in enumerate(face):
        myface=image[y: y + h, x:x + w, :]
        newimage=cv2.resize(myface, (96, 96))
        save_filename = '%s-%d.jpg' % (os.path.basename(target).split('.')[0], i)
        cv2.imwrite("faces/" + save_filename, newimage)

main()
        
