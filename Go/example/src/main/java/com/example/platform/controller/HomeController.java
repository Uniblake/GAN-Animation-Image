package com.example.platform.controller;

import com.example.platform.repository.mapper.IImageDao;
import com.example.platform.domain.Image;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

/**
 * @author 夏之阳
 *         创建时间：2018-09-28 23:52
 *         创建说明：Home
 */
@Controller
public class HomeController {
    int num = 100;
    List<Image> all_image;
    List<Image> rand_image;
    int [] temp_sa = {0,0,0,0,0,0,0,0};
    @Autowired
    IImageDao imageDao;
    private String ans(List<Image> all_image1, int sta)
    {
        return "{\"abs0\":\""+ all_image1.get(sta).getAbso() +"\",\"path0\":\""+all_image1.get(sta).getPath()+"\","+
                "\"abs1\":\""+ all_image1.get(sta+1).getAbso() +"\",\"path1\":\""+all_image1.get(sta+1).getPath()+"\","+
                "\"abs2\":\""+ all_image1.get(sta+2).getAbso() +"\",\"path2\":\""+all_image1.get(sta+2).getPath()+"\","+
                "\"abs3\":\""+ all_image1.get(sta+3).getAbso() +"\",\"path3\":\""+all_image1.get(sta+3).getPath()+"\","+
                "\"abs4\":\""+ all_image1.get(sta+4).getAbso() +"\",\"path4\":\""+all_image1.get(sta+4).getPath()+"\","+
                "\"abs5\":\""+ all_image1.get(sta+5).getAbso() +"\",\"path5\":\""+all_image1.get(sta+5).getPath()+"\","+
                "\"abs6\":\""+ all_image1.get(sta+6).getAbso() +"\",\"path6\":\""+all_image1.get(sta+6).getPath()+"\","+
                "\"abs7\":\""+ all_image1.get(sta+7).getAbso() +"\",\"path7\":\""+all_image1.get(sta+7).getPath()+"\","+
                "\"abs8\":\""+ all_image1.get(sta+8).getAbso() +"\",\"path8\":\""+all_image1.get(sta+8).getPath()+"\","+
                "\"abs9\":\""+ all_image1.get(sta+9).getAbso() +"\",\"path9\":\""+all_image1.get(sta+9).getPath()+"\"}";
    }
    @RequestMapping(value = "")
    public String adminHome(){
        return "/home";
    }
    @RequestMapping(value = "/rank")
    public String rank(){
        return "/rank";
    }

    @RequestMapping(value = "/hunt")
    public String hunt(){
        return "/hunt";
    }

    @RequestMapping(value = "/get_rank",method = RequestMethod.GET)
    @ResponseBody
    public String get_rank()
    {
        all_image = imageDao.rank_image();
        return  ans(all_image,0);
    }
    @RequestMapping(value = "/change_page",method = RequestMethod.POST)
    @ResponseBody
    public String change_page(int page)
    {
        int sta=(page-1)*10;
        return ans(all_image,sta);
    }
    @RequestMapping(value = "/like_or_not",method = RequestMethod.POST)
    @ResponseBody
    public String like_or_not(int flag,int page){
        if (page == 0) {
            temp_sa[flag] = 1;
            return "success";
        }
        Image example;
        int id1,id;
        int sta = (page-1)*10;
        id1 = flag % 10;
        id = sta+id1;
        example = all_image.get(id);
        if (flag % 20 > 10) {
            example.add_against();
            imageDao.AddAgainst(example.getId());
        }
        else {
            example.add_support();
            imageDao.AddSupport(example.getId());
        }
        all_image.set(id,example);
        return  ans(all_image,sta);
    }
    @RequestMapping(value = "/refresh",method = RequestMethod.GET)
    @ResponseBody
    public String refresh()
    {
        rand_image  = imageDao.rand_image();
        return ans(rand_image,0);
    }
    @RequestMapping(value = "/like",method = RequestMethod.POST)
    @ResponseBody
    public String like(int flag){
        Image example;
        example = rand_image.get(flag);

        example.add_support();
        imageDao.AddSupport(example.getId());

        rand_image.set(flag,example);
        return ans(rand_image,0);
    }
    @RequestMapping(value = "/submit_to_fight",method = RequestMethod.POST)
    @ResponseBody
    public String submit_to_fight(int flag) throws IOException, InterruptedException {
        String path;
        String command = "cmd /c copy target\\classes\\static\\tmp\\" + num + "\\" + flag + ".png target\\classes\\static\\pic\\" + num + "-" + flag + ".png";
        Process p = Runtime.getRuntime().exec(command);
        p.waitFor();
        if (p.exitValue() != 0) {
            System.out.print("error1");
        }
        String command1 = "cmd /c copy target\\classes\\static\\tmp\\" + num + "\\" + flag + ".png src\\main\\resources\\static\\pic\\" + num + "-" + flag + ".png";
        Process p1 = Runtime.getRuntime().exec(command1);
        p1.waitFor();
        if (p1.exitValue() != 0) {
            System.out.print("error2");
        }
        path ="/pic/"+ num +"-"+ flag + ".png";
        if (imageDao.Submit(path,temp_sa[flag],temp_sa[flag+4],temp_sa[flag]-temp_sa[flag+4]) == 0)
            return "false";
        else return "true";
    }

    @RequestMapping(value = "/get_word",method = RequestMethod.POST)
    @ResponseBody
    public String get_word(String word) throws IOException, InterruptedException {
        int i;
        for (i=0;i<8;i++)
            temp_sa[i] = 0;
        num = num + 1;
        String command = "cmd /c D:\\conda\\Scripts\\activate.bat&&cd send&&python generate_faces.py generate --gen-dst=..\\target\\classes\\static\\tmp\\"
                +num+" --gen-id="+word+ "&&cd ..";
        Process p = Runtime.getRuntime().exec(command);
        p.waitFor();
        if (p.exitValue() != 0) {
           return "error";
        }
        return "{\"path0\":\"/tmp/"+num+"/0.png"+"\","+
                "\"path1\":\"/tmp/"+num+"/1.png"+"\","+
                "\"path2\":\"/tmp/"+num+"/2.png"+"\","+
                "\"path3\":\"/tmp/"+num+"/3.png"+"\"}";
    }

}
