package com.example.platform.domain;

/**
 * @author: 毛伟俊
 * @Date: 2019/6/5  8:38
 * @Description:
 */
public class Image {
    private int likes = 0;
    private int dislikes = 0;
    private String path;
    private int pid;
    private int abslikes = 0;
    public void add_support(){ this.likes += 1; this.abslikes+=1;}
    public void add_against(){ this.dislikes += 1; this.abslikes-=1;}
    public void set_path(String pa){this.path = pa;}
    public int getSupport(){  return this.likes; }
    public int getAgainst(){  return this.dislikes; }
    public int getId(){return this.pid;}
    public String getPath() {return this.path;}
    public int getAbso(){return this.abslikes;}
}

