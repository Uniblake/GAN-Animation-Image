<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Go</title>
    <link href="/bootstrap-4.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <script  src="/js/jquery-1.11.1.js"></script>
    <style>
        body{
            background-image: url(pic/2.jpg);
            background-size: cover;
        }
    </style>
</head>
<body>
<!-- Top content -->
<div class="top-content">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="width: 100%">
        <a class="navbar-brand" href="#">VERA</a>
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="/">Go</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/rank">Rank</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/hunt">Hunt</a>
            </li>
        </ul>
    </nav>
    <div style="width:1520px; height:400px; position: relative">
        <div style="width:16.8%;float:left;height:400px; "></div>
        <div style="width:16.6%;float:left;height:400px; ">
            <div style="border:1px  solid #101010; margin: 0 auto; width: 75%; height:50%; top: 12%; position: relative ">
                <img src="/pic/v.png" id = "img1" style="width: 100%; height: 100%">
            </div>
            <div style="margin: 0 auto; width: 75%; height: 50%; top: 12%;  position: relative" align="center">
                <div style="height: 30%; top: 15%; position: relative" >
                    <button id="support1" type="button" class="btn btn-info" onclick="like_or_not(this)">support</button>
                    <button id="against1" type="button" class="btn btn-info" onclick="like_or_not(this)">against</button>
                </div>
                <button id="submit1" type="button" style="width:90%; top: 15%; position: relative" class="btn btn-info btn-primary btn-lg btn-block" onclick="submit_ch(this)">submit</button>
            </div>
        </div>
        <div style="width:16.6%;float:left;height:400px; ">
            <div style="border:1px  solid #101010; margin: 0 auto; width: 75%; height:50%; top: 12%; position: relative ">
                <img src="/pic/e.png" id = "img2" style="width: 100%; height: 100%">
            </div>
            <div style="margin: 0 auto; width: 75%; height: 50%; top: 12%;  position: relative" align="center">
                <div style="height: 30%; top: 15%; position: relative" >
                    <button id="support2" type="button" class="btn btn-info" onclick="like_or_not(this)">support</button>
                    <button id="against2" type="button" class="btn btn-info" onclick="like_or_not(this)">against</button>
                </div>
                <button id="submit2" type="button" style="width:90%;  top: 15%; position: relative" class="btn btn-info btn-primary btn-lg btn-block" onclick="submit_ch(this)">submit</button>
            </div>
        </div>
        <div style="width:16.6%;float:left;height:400px; ">
            <div style="border:1px  solid #101010; margin: 0 auto; width: 75%; height:50%; top: 12%; position: relative ">
                <img src="/pic/r.png" id = "img3" style="width: 100%; height: 100%">
            </div>
            <div style="margin: 0 auto; width: 75%; height: 50%; top: 12%;  position: relative" align="center">
                <div style="height: 30%; top: 15%; position: relative" >
                    <button id="support3" type="button" class="btn btn-info" onclick="like_or_not(this)">support</button>
                    <button id="against3" type="button" class="btn btn-info" onclick="like_or_not(this)">against</button>
                </div>
                <button id="submit3" type="button" style="width:90%;  top: 15%; position: relative" class="btn btn-info btn-primary btn-lg btn-block" onclick="submit_ch(this)">submit</button>
            </div>
        </div>
        <div style="width:16.6%;float:left;height:400px; ">
            <div style="border:1px  solid #101010; margin: 0 auto; width: 75%; height:50%; top: 12%; position: relative ">
                <img src="/pic/a.png" id = "img4" style="width: 100%; height: 100%">
            </div>
            <div style="margin: 0 auto; width: 75%; height: 50%; top: 12%;  position: relative" align="center">
                <div style="height: 30%; top: 15%; position: relative" >
                    <button id="support4" type="button" class="btn btn-info" onclick="like_or_not(this)">support</button>
                    <button id="against4" type="button" class="btn btn-info" onclick="like_or_not(this)">against</button>
                </div>
                <button id="submit4" type="button" style="width:90%; top: 15%; position: relative" class="btn btn-info btn-primary btn-lg btn-block" onclick="submit_ch(this)">submit</button>
            </div>
        </div>
        <div style="width:16.8%;float:left;height:400px; "></div>
    </div>
    <div class="container" style="height: 200px; width:1520px; position: relative; top:0px">
        <form class="bs-example bs-example-form" role="form" style="top: 50px;position: relative">
            <div class="row" >
                <div class="col-lg-6 m-auto">
                    <div class="input-group">
                        <input type="text" class="form-control" id = "what_you_want">
                        <span class="input-group-btn">
                            <button id="create" class="btn btn-default" type="button" onclick="GoGo()">Go!</button>
                        </span>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>

<!-- Javascript -->

<script type="text/javascript">
    var s_like = [0,0,0,0,0,0,0,0];
    var s_sub = [0,0,0,0];
    var fl_like = 0;
    var fl_sub = 0;
function like_or_not(obj) {
    switch (obj.id)
    {
        case "support1": fl_like = 0; break;
        case "support2": fl_like = 1; break;
        case "support3": fl_like = 2; break;
        case "support4": fl_like = 3; break;
        case "against1": fl_like = 4; break;
        case "against2": fl_like = 5; break;
        case "against3": fl_like = 6; break;
        case "against4": fl_like = 7; break;
        default:;
    }
    if (s_like[fl_like] === 0) {
        s_like[fl_like] = 1;
       $.post(
                "/like_or_not", {flag: fl_like,page:0},
                function (data) {
               //     var ret = eval("(" + data + ")");
                //    alert(ret.re);
                }
        )
    }

}
function submit_ch(obj) {
    switch (obj.id) {
        case "submit1": fl_sub = 0; break;
        case "submit2": fl_sub = 1; break;
        case "submit3": fl_sub = 2; break;
        case "submit4": fl_sub = 3; break;
    }
    if (s_sub[fl_sub] === 0)
    {
        s_sub[fl_sub] = 1;
        $.post("/submit_to_fight", {flag:fl_sub})
    }
}
function GoGo() {
    var input = $("#what_you_want").val();
    $.post(
        "/get_word",{word:input},function (path) {
                var path = eval("(" + path + ")");
                $("#img1").attr("src",path.path0);
                $("#img2").attr("src",path.path1);
                $("#img3").attr("src",path.path2);
                $("#img4").attr("src",path.path3);
            }
    );
    s_like = [0,0,0,0,0,0,0,0];
    s_sub = [0,0,0,0];
}
</script>

</body>
</html>  