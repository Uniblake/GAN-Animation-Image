# coding:utf8
# author: 王舒凡
# Stu ID: 516030910114

import os
import hashlib
import ipdb
import torch
import torchvision as tv
import tqdm
from model import NetG, NetD
from torchnet.meter import AverageValueMeter
import random
import numpy as np
from PIL import Image as Image


# t.cuda.set_device(1)
class Config(object):
    gpu = True  # 是否使用GPU
    nz = 100  # 噪声维度
    ngf = 64  # 生成器feature map数
    ndf = 64  # 判别器feature map数
    save_path = 'imgs/'  # 生成图片保存路径

    netd_path = 'checkpoints600/netd_650.pth'  # 'checkpoints/netd_.pth' #预训练模型
    netg_path = 'checkpoints600/netg_650.pth'  # 'checkpoints/netg_211.pth'

    gen_dst = './serve_img/'
    base_name = ''
    gen_img = 'result.png'
    gen_id = '516030910'
    # 从512张生成的图片中保存最好的64张
    gen_num = 4
    gen_search_num = 2048
    gen_mean = 0  # 噪声的均值
    gen_std = 1  # 噪声的方差


opt = Config()

@torch.no_grad()
def generate(**kwargs):
    """
    随机生成动漫头像，并根据netd的分数选择较好的
    """
    for k_, v_ in kwargs.items():
        setattr(opt, k_, v_)

    device = torch.device('cuda') if opt.gpu else torch.device('cpu')

    hash_id = hash(opt.gen_id) % 51603
    torch.manual_seed(hash_id)

    netg, netd = NetG(opt).eval(), NetD(opt).eval()

    noises = torch.randn(opt.gen_search_num, opt.nz, 1, 1).normal_(opt.gen_mean, opt.gen_std)
    noises = noises.to(device)

    map_location = lambda storage, loc: storage
    netd.load_state_dict(torch.load(opt.netd_path, map_location=map_location))
    netg.load_state_dict(torch.load(opt.netg_path, map_location=map_location))
    netd.to(device)
    netg.to(device)

    # 生成图片，并计算图片在判别器的分数
    fake_img = netg(noises)
    scores = netd(fake_img).detach()

    # 挑选最好的某几张
    indexs = scores.topk(opt.gen_num)[1]
    result = []
    for ii in indexs:
        result.append(fake_img.data[ii])
    # 保存图片
    # epoch_num = opt.netd_path[opt.netd_path.find("_") + 1:opt.netd_path.rfind(".")]

    # pic_stack_name = "".join(["result_", str(epoch_num), "_", str(randid), ".png"])
    print(result[0])
    print(result[0].size())
    # np_array = result[0].cpu().numpy()
    #
    # trans_array = np.zeros((96,96,3))
    #
    # trans_array[:,:,0] = np_array[0,:,:]
    # trans_array[:,:,1] = np_array[1,:,:]
    # trans_array[:,:,2] = np_array[2,:,:]
    #
    # print(trans_array.shape)
    #
    # img_ = Image.fromarray(np.uint8(trans_array*255))
    # img_ = img_.resize((224, 224), Image.BILINEAR) #resize to
    # t_img = torch.from_numpy(np.array(img_))
    # tv.utils.save_image(t_img, "PIL_test_img.png", normalize=True, range=(-0.8, 0.8))

    tv.utils.save_image(torch.stack(result), "save_test.png", normalize=True, range=(-1, 1))

    base_dir = opt.gen_dst
    base_name = opt.base_name
    if not os.path.exists(base_dir):
        os.mkdir(base_dir)
    for picx in range(len(result)):
        picx_name = "".join([base_dir, base_name, str(picx), ".png"])
        tv.utils.save_image(result[picx], picx_name, normalize=True, range=(-0.8, 0.8))
        img = Image.open(picx_name)
        img = img.resize((188, 188), Image.ANTIALIAS)
        img.save(base_dir + "new_"+str(picx)+".png", "png")
        os.remove(picx_name)


if __name__ == '__main__':
    import fire
    fire.Fire()
