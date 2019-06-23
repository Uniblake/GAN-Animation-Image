﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿# ﻿﻿Animation Image Generation

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

500个epoch后，16张生成结果

![测试生成结果](https://graph.baidu.com/resource/112310e8fd8aef6f95c5001561174805.jpg)

##### Web Server

服务器为阿里云的云服务器ECS，操作系统为阿里云共享镜像中的windows server 2019 数据中心版 64位中文版，1 vCPU，2Gib内存，处理器型号为Intel Xeon E5-2682v4，40GiB系统盘，无数据盘。

JDK配置

1.  获得jdk1.8.0_181文件夹
2.  将该文件夹放置在C:\Program Files (x86)\Java目录下
3.  在系统环境变量中设置JAVA_HOME为C:\Program Files (x86)\Java\jdk1.8.0_181。

##### 源码修改

- pom.xml:

 1. 增加`<packaging>war</packaging>`，使可以导出war包。
 2. 增加
```
	    <dependency>
        	 <groupId>org.springframework.boot</groupId>
              <artifactId>spring-boot-starter-tomcat</artifactId>
             <scope>provided</scope>
        </dependency>

```
 
        3. 使在项目打包时，剔除springboot内置tomcat。

- application.java:
  1. 继承`SpringBootServletInitializer`类，并重写覆盖`configure`方法.
```
			public class application extends SpringBootServletInitializer{
   				 @Override
    				protected SpringApplicationBuilder 	configure(SpringApplic-							ationBuilder builder) {
        			return builder.sources(application.class);
    				}
    				public static void main(String[] args) {
        				SpringApplication.run(application.class, args);
    				}
			}
```
- 在`pom.xml`所在目录下在命令行执行`mvn clean; mvn package`，在该目录`target/`子目录下生成`web-1.0-Go.war`包。

##### Tomcat配置
1. 下载`Tomcat 8.5.42`，解压。
1. 将解压后的`apache-tomcat-8.5.42`放置在`C:\Program Files (x86)`目录。
1. 将`web-1.0-Go.war`放置在`C:/ Program Files (x86)/apache-tomcat-8.5.42/webapps`目录下。
1. 在`C:/ Program Files (x86)/apache-tomcat-8.5.42/conf`目录下 找到`server.xml`，在`</Host>`之前加
```
				<Context 
    					crossContext="true" 
   				 	docBase="C:/ Program Files (x86)/apache-tomcat-8.5.42/webapps/web-1.0-Go" 
    					path="/" 
    					reloadable="true">
				</Context>
```

##### 运行
- 上述步骤完成后，运行`C:/ Program Files (x86)/apache-tomcat-8.5.42/bin/startup.bat`，即部署成功。访问`8080`端口即可访问网站。


Web界面首页

![首页](https://graph.baidu.com/resource/11291ab1b6d727a4c8b7101561204394.jpg)

Web界面-查看当前排行榜

![排行榜](https://graph.baidu.com/resource/112e1256a6777e7a3976201561204434.jpg)

- 项目位置
`https://github.com/Uniblake/GAN-Animation-Image`


















