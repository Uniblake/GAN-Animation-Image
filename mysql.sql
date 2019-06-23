create database icon;

use icon;
create table icon
(
  pid int(11) auto_increment primary key comment '头像序号',
  path varchar(50) not null comment '路径',
  likes int(11) default 0 comment '赞',
  dislikes int(11) default 0 comment '踩',
  abslikes int(11) default 0 comment '评分'
)
  
use icon;
create table model
(
  id int(11) auto_increment primary key comment '模型序号',
  path varchar(50) not null comment '路径',
  descri varchar(50) default null comment '备注'
)

select path,abslikes from icon order by abslikes desc, likes desc limit 50;

update icon set likes = likes + 1, abslikes = abslikes + 1 where pid = 10; #赞
update icon set dislikes = dislikes + 1, abslikes = abslikes - 1 where pid = 10; #踩

alter table icon AUTO_INCREMENT 1;

delete from icon;

insert into icon values(null,'/pic/0-0.png',0,0,0); #直接提交
insert into icon values(null,'/pic/0-1.png',1,0,1); #赞后提交
insert into icon values(null,'/pic/0-2.png',0,1,-1);#踩后提交

# 截短数据后随机排序
select path,abslikes from icon where pid in 
    (select pid from icon order by rand()) limit 10
    
# 直接随机排序
select path,abslikes from icon order by rand() limit 10

# 概率随机排序
select path,abslikes from icon where
(select rand() <= 10/(select max(pid) from icon))
