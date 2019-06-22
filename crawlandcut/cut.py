# -*- coding: utf-8 -*-
#created by 张旭
import os
import cv2
import sys
from glob import glob


        

def main():
    imagelist=glob('image/*.jpg')
    for oldimage in imagelist:
        try:
            detect(oldimage,"lbpcascade_animeface.xml")
            print "success!"
        except Exception,e:
            print "failed!"
            continue
def detect(target,standard):
    mystandard = cv2.CascadeClassifier(standard)#级联分类器对象
    image=cv2.imread(target)#读取图片文件的数据
    scale=cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
    realscale=cv2.equalizeHist(scale)#增强对比度

    face=mystandard.detectMultiScale(realscale,scaleFactor=1.1,minNeighbors=5,minSize=(24,24))
    #级联分类器调用识别人脸，检测矩形最少为5
    for i,(x,y,w,h) in enumerate(face):
        myface=image[y: y + h, x:x + w, :]
        newimage=cv2.resize(myface, (96, 96))#放大人脸
        save_filename = '%s-%d.jpg' % (os.path.basename(target).split('.')[0], i)
        cv2.imwrite("faces/" + save_filename, newimage)
        #保存识别出的图片
main()
        
