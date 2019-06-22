<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>rank</title>
    <link href="/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <script  src="/js/jquery-1.11.1.js"></script>
    <style>
        .image{
            margin: 0 auto;
            width: 100%;
            height: 13%;
            opacity: 0.8;
            z-index: 2;
            position: absolute;
            background-color: #ced4da;
            text-align: center;
            font-weight:bold;
            color: #e0344c;
        }
        .bb1{
            border:1px solid #101010;
            margin: 0 auto;
            width: 60%;
            height: 65%;
            top: 12%;
            position: relative;
        }

        body{
            background-image: url(pic/2.jpg);
            background-size:cover;
        }
    </style>
</head>
<body onload="get_rank();">
<div class="top-content">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="100%">
        <a class="navbar-brand" href="#">VERA</a>
        <ul class="navbar-nav">
            <li class="nav-item ">
                <a class="nav-link" href="/">Go</a>
            </li>
            <li class="nav-item  active">
                <a class="nav-link" href="/rank">Rank</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/hunt">Hunt</a>
            </li>
        </ul>
    </nav>

    <div style="width:1520px; height:280px; position: relative">
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img0" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num0">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%; position: relative; " align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support0" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against0" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img1" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num1">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support1" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against1" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img2" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num2">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support2" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against2" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img3" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num3">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support3" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against3" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img4" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num4">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support4" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against4" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
    </div>
    <div style="width:1520px; height:280px; position: relative">
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img5" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num5">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support5" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against5" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img6" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num6">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support6" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against6" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img7" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num7">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support7" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against7" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img8" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num8">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support8" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against8" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
        <div style="width:20%; height:280px;float:left;">
            <div class="bb1">
                <img src="/pic/0.jpg" id = "img9" style="width: 100%; height: 101%;  z-index: 1;position: absolute">
                <div class="image" id = "num9">0</div>
            </div>
            <div style="margin: 0 auto; width: 60%; height: 35%; top:12%;  position: relative" align="center">
                <div style="height:50%; top: 20%; position: relative" >
                    <button name="support" type="button" class="btn btn-info" id = "support9" onclick="like_or_not(this)">support</button>
                    <button name="against" type="button" class="btn btn-info" id = "against9" onclick="like_or_not(this)">against</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="position: relative;width:30%; text-align: center; top: 20px">
        <ul class="pagination" >
            <li class="page-item" style="float: left;width:20% "><a class="page-link" href="#" onclick="change_page(1)">1</a></li>
            <li class="page-item" style="float: left;width:20% "><a class="page-link" href="#" onclick="change_page(2)">2</a></li>
            <li class="page-item" style="float: left;width:20% "><a class="page-link" href="#" onclick="change_page(3)">3</a></li>
            <li class="page-item" style="float: left;width:20% "><a class="page-link" href="#" onclick="change_page(4)">4</a></li>
            <li class="page-item" style="float: left;width:20% "><a class="page-link" href="#" onclick="change_page(5)">5</a></li>
        </ul>


    </div>
</div>
<script type="text/javascript">
    var s_like = [];
    var i;
    for (i=0;i<100;i++)
        s_like[i] = 0;
    var fl_like = 0;
    var now_page = 1;
    function get_rank()
    {
        $.get( "/get_rank",
                function (data) {
                    var ret = eval("(" + data + ")");
                    show_num(ret);
                    show_image(ret);
                })
    }
    function show_num(ret) {
        $("#num0").html(ret.abs0);
        $("#num1").html(ret.abs1);
        $("#num2").html(ret.abs2);
        $("#num3").html(ret.abs3);
        $("#num4").html(ret.abs4);
        $("#num5").html(ret.abs5);
        $("#num6").html(ret.abs6);
        $("#num7").html(ret.abs7);
        $("#num8").html(ret.abs8);
        $("#num9").html(ret.abs9);
    }
    function show_image(ret){
        $("#img0").attr("src",ret.path0);
        $("#img1").attr("src",ret.path1);
        $("#img2").attr("src",ret.path2);
        $("#img3").attr("src",ret.path3);
        $("#img4").attr("src",ret.path4);
        $("#img5").attr("src",ret.path5);
        $("#img6").attr("src",ret.path6);
        $("#img7").attr("src",ret.path7);
        $("#img8").attr("src",ret.path8);
        $("#img9").attr("src",ret.path9);
    }

    function change_page(ii) {
        for (i=0;i<100;i++)
            s_like[i] = 0;
        now_page = ii;
        $.post(
                "/change_page",{page:now_page},
                    function (data) {
                        var ret = eval("(" + data + ")");
                        show_num(ret);
                        show_image(ret);
                    })
    }
    function like_or_not(obj) {
        switch (obj.id)
        {
            case "support0": fl_like = 0; break;
            case "support1": fl_like = 1; break;
            case "support2": fl_like = 2; break;
            case "support3": fl_like = 3; break;
            case "support4": fl_like = 4; break;
            case "support5": fl_like = 5; break;
            case "support6": fl_like = 6; break;
            case "support7": fl_like = 7; break;
            case "support8": fl_like = 8; break;
            case "support9": fl_like = 9; break;
            case "against0": fl_like = 10; break;
            case "against1": fl_like = 11; break;
            case "against2": fl_like = 12; break;
            case "against3": fl_like = 13; break;
            case "against4": fl_like = 14; break;
            case "against5": fl_like = 15; break;
            case "against6": fl_like = 16; break;
            case "against7": fl_like = 17; break;
            case "against8": fl_like = 18; break;
            case "against9": fl_like = 19; break;
            default:;
        }
        var temp_like;
        temp_like = fl_like+(now_page-1)*20;

        if (s_like[temp_like] === 0) {
            s_like[temp_like] = 1;
            $.post(
                    "/like_or_not", {flag: fl_like,page:now_page},
                    function (data) {
                        var ret = eval("(" + data + ")");
                        show_num(ret);
                    }
            )
        }

    }
</script>
</body>
</html>