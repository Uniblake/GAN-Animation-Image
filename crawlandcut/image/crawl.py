# -*- coding: utf-8 -*-
#created by 张旭
import urllib
import re
from bs4 import BeautifulSoup
# -*- coding: utf-8 -*-
#created by 张旭
import requests
import os
import traceback

x=0
def getHtml(url):#打开url
    try:
        html = urllib.urlopen(url)
        return html
    except Exception,e:
        print "openerror"
        return 0
    #html = page.read().decode('utf-8')

def getImg(html):#下载图片
    global x
    soup = BeautifulSoup(html,'html.parser')#解析html文件
    all_image = soup.find_all('img',class_ = "preview")#识别出图片对象

    for img in all_image:
        try:
            urllib.urlretrieve(img['src'],"%s.jpg"%x)#下载图片
        except Exception,e:
            print "downloaderror"
            continue
        x+=1
    return all_image
for i in range(1, 8001):
    global x
    myurl = 'http://konachan.net/post?page=%d&tags=' % i
    x+=1
    html=getHtml(myurl)
    if html!=0:
        getImg(html)
    else:
        print "it's 0 "
        continue
    print i
