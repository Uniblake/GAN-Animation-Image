# -*- coding: utf-8 -*-
#created by 张旭
import urllib
import re
from bs4 import BeautifulSoup
import requests
import os
import traceback

x=0
def getHtml(url):
    html = urllib.urlopen(url)
    #html = page.read().decode('utf-8')
    return html

def getImg(html):
    global x
    soup = BeautifulSoup(html,'html.parser')
    all_image = soup.find_all('img',class_ = "preview")

    for img in soup.find_all('img', class_="preview"):
        urllib.urlretrieve(img['src'],"%s.jpg"%x)
        x+=1
    return all_image
for i in range(1, 8001):
    global x
    myurl = 'http://konachan.net/post?page=%d&tags=' % i
    x+=1
    html=getHtml(myurl)
    getImg(html)
print getImg(html)
