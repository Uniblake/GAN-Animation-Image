﻿﻿﻿﻿﻿﻿﻿# ﻿﻿Animation Image Generation

## Overview

This is a team project of class `IS305`.

Team members：黄浩铭，毛伟俊，张旭，郑思祺，王舒凡

## Requirements

Basics

- Platform: Windows10
- Database: MySQL on Ubuntu 16.04
- Python: 3.6.5

Pakages

- DCGAN Framework: Pytorch 0.4.1, torchvision
- Crawler: urllib, re, BeautifulSoup4, requests, traceback
- Others: tqdm, PIL

## Usage

##### Generate images by the pretrained models.
``` 
$ generate_faces.py generate --gpu=True --gen-dst= ./imgs/ --netd-path=./netd.pth --netg-path=./netg.pth --gen-id=51603
```

If you do not have a GPU, just set `--gpu=False`.

`--netd-path` indicates the path your discriminator exists.

`--netg-path` indicates the path your generator exists.

`--gen-dst` indicates the path you want to store the images generated.

`--gen-id` is the string the user input as his unique symbol.

Detailed input parameters:

```
class Config(object):
	nz = 100  # 噪声维度
	ngf = 64  # 生成器feature map数
	ndf = 64  # 判别器feature map数
	gen_search_num = 2048
	gen_mean = 0  # 噪声的均值
	gen_std = 1  # 噪声的方差

	gpu = True  # 是否使用GPU
	netd_path = None  # 预训练判别器path
	netg_path = None  # 与训练生成器path
	gen_dst = './serve_img/' #图像文件夹位置
	base_name = '' #生成图像名字前缀: (eg: img -> img0.png, img1.png, img2.png, img3.png)
	gen_id = '516030910' #用户输入字符串
	gen_num = 64 #生成的数量
```

##### Crawler
Get images from conachan.net. 

Just run `crawl.py`

```
for i in range(1, 8001):
    global x
    myurl = 'http://konachan.net/post?page=%d&tags=' % i
    x+=1
    html=getHtml(myurl)
    getImg(html)
print getImg(html)
```

Get images from Baidu.

Just run `baidu_crawler.py`

You can just modify the parameters in the below to get images of a certain key word.

```
if __name__ == '__main__':
    dataList = getManyPages('动漫男生头像',80)  # 参数1:关键字，参数2:要下载的页数
    getImg(dataList,'./imgs/') # 参数2:指定保存的路径
```

And if you want to get images from other websites, you should fulfill your own crawlers.





