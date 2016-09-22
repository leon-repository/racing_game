<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="prjroot"></spring:url>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理控台</title>
<link href="${prjroot}css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${prjroot}css/inner.css">
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container">
        <div id="header-info" class="row">
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="btn-group">
                <button data-group="one" class="group-item btn btn-success active">1-5</button>
                <button data-group="two" class="group-item btn btn-success">6-10</button>
                <button data-group="three" class="group-item btn btn-success">冠亚组合</button>
                <input type="button" value="统计记录"
                        onclick="window.open('/stake/history', '_blank')">
            </div>
        </div>
        <div class="col-md-3">
            <div class="input-group">
              <span class="input-group-addon">￥</span>
              <input type="text" class="form-control" placeholder="请输入押注金额" />
              <span class="input-group-addon">.00</span>
            </div>
        </div>
        <div class="col-md-3">
            <button class="sub btn btn-info">确定</button>
            <button class="reset btn btn-default">重置</button>
        </div>
        <div class="col-md-3">
            <strong class="notice-info">现在是押注时间</strong>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12">
            <div id="table-box_1" class="table-box table-responsive"></div>
            <div id="table-box_2" class="table-box table-responsive"></div>
            <div id="table-box_3" class="table-box table-responsive"></div>
        </div>
    </div>


    <div class="row money">
        <div class="col-md-3 col-sm-offset-3">
            <div class="input-group">
              <span class="input-group-addon">￥</span>
              <input type="text" class="form-control" placeholder="请输入押注金额" />
              <span class="input-group-addon">.00</span>
            </div>
        </div>
        <div class="col-md-3">
            <button class="sub btn btn-info">确定</button>
            <button class="reset btn btn-default">重置</button>
        </div>
    </div>
</div>
<div id="computering" class="pos-box">
    <div class="alert alert-danger text-center">正在计算比赛结果，请稍后。。。</div>
</div>
<div id="modifying" class="pos-box">
    <div class="alert alert-info">
        <h3 class="text-center">拖动数字修改比赛结果修改比赛结果</h3>
        <div class="drag-box"></div>
        <div class="modify-notice text-center"></div>
        <div class="text-center">
            <button id="domodify" class="btn btn-primary">修改比赛结果</button>
        </div>
    </div>
</div>
<div class="toast"></div>
<div class="mask"></div>
</body>
<script type="text/html" id="notice-title">
    <div class="col-md-3">
        <h4>香港赛车（PK10）</h4>
        <p>{{racingNum}}期</p>
    </div>
    <div class="col-md-3">
        <h4>今日输赢：{{todayIncome}}</h4>
        <p>距离封盘：{{stopTime}}</p>
    </div>
    <div class="col-md-6">
        <h4 class="old-code">
            {{preRacingNum}}期开奖：
            {{each preResult as v}}
                <span class="color-{{v}}">{{v}}</span>
            {{/each}}
        </h4>
        <p>距离开奖：{{startTime}}</p>
    </div>
</script>
<script id="tabelOne" type="text/html">
<table class="table table-bordered table-striped">
    <thead>
        {{if flag}}
        <tr>
            <td>冠军</td>
            <td>亚军</td>
            <td>第三名</td>
            <td>第四名</td>
            <td>第五名</td>
        </tr>
        {{else}}
        <tr>
            <td>第六名</td>
            <td>第七名</td>
            <td>第八名</td>
            <td>第九名</td>
            <td>第十名</td>
        </tr>
        {{/if}}
    </thead>
    <tbody>
        {{each data as value trid}}
        <tr>
            {{each [1,2,3,4,5] as index}}
            <td data-sort="{{ flag ? index : index+5 }}" data-key="{{value.key}}" data-trid={{trid+1}}>
                <div class="item-td">
                    <p class="item-code">{{value.codeName}}</p>
                    <p class="item-value">{{value.codeValue}}</p>
                </div>
            </td>
            {{/each}}
        </tr>
        {{/each}}
    </tbody>
</table>
</script>
<script id="tabelTwo" type="text/html">
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <td colspan="4">冠、亚军和（冠军车号 + 亚军车号 = 和）</td>
        </tr>
    </thead>
    <tbody>
        {{each data as value}}
        <tr>
            {{each value.codeName as v k}}
            <td data-key="commonStake" data-keycode="{{k}}">
                <div class="item-td">
                    <p class="item-code">{{v}}</p>
                    <p class="item-value">{{value.codeValue[k]}}</p>
                </div>
            </td>
            {{/each}}
        </tr>
        {{/each}}
    </tbody>
</table>
</script>
<script src="${prjroot}js/jquery-1.9.1.js"></script>
<script src="${prjroot}js/template.js"></script>
<script src="${prjroot}js/inner.js"></script>
</html>