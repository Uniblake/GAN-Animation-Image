package com.example.platform.repository.mapper;

/**
 * @author: 毛伟俊
 * @Date: 2019/6/5  8:39
 * @Description:
 */
import com.example.platform.domain.Image;

import java.util.List;

/**
 * @author: 毛伟俊
 * @Date: 2019/5/28  20:18
 * @Description:
 */
public interface IImageDao {
    /**
     * 查询支持人数前五十的图片
     * @return 前五十的图片信息
     */
    List<Image> rank_image();

    /**
     * 随机返回图片
     * @return 随机的图片信息
     */
    List<Image> rand_image();

    /**
     * 支持人数加1
     * @param id 图片id
     * @return 是否成功
     */
    int AddSupport(int id);

    /**
     * 反对人数加1
     * @param id 图片id
     * @return 是否成功
     */
    int AddAgainst(int id);

    /**
     * 添加一张图片
     * @param path1 图片路径
     * @param s 支持数
     * @param a 反对数
     * @param b 喜欢人数净值
     * @return 是否成功
     */
    int Submit(String path1, int s, int a,int b);
}
