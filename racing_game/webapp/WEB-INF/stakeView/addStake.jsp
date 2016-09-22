<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="prjroot"></spring:url>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理控台</title>
    <style type="text/css">
        html,body{
            margin: 0;
            padding: 0;
            font-size: 12px;
        }
        body{
            padding-top: 100px;
        }
        .text_bg_1{
            background: #f5f5f5;
        }
        .text_bg_2{
            background: #f98c15;
        }
        .text_bg_3{
            background: #28538d;
        }
        .text_bg_4{
            background: #fbe318;
        }
        .text_bg_5{
            background: #666;
        }
        .text_bg_6{
            background: #298649;
        }
        .text_bg_7{
            background: #a2a3a4;
        }
        .text_bg_8{
            background: #3cd6e9;
        }
        .text_bg_9{
            background: #e0393a;
        }
        .text_bg_10{
            background: #2e34b4;
        }
        table{
            font-size: 14px;
        }
        input {
            width: 80px;
            height: 25px;
            border-radius: 3px;
            border:#ccc solid 1px;
        }
        .btns {
            width: 100%;
        }
        .btns input{
            width: 150px;
            height: 40px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            border: 1px solid #999;
        }
        .btns input[type="submit"]{
            background:#ec5e00;
            border: 1px solid #d14233;
            color: #fff;
        }
        .btns input[type="submit"]:hover{
            background: #ea6153;
        }
        .mask{
            display: none;
            position: fixed;
            top:0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,.5);
            text-align: center;
            font-size: 48px;
            font-weight: bold;
            color: #fff;
            z-index: 9;
        }
        .mask .info{
            margin-top: 100px;
        }
        .mask .update{
            display: none;
            color: blue;
            cursor: pointer;
            text-decoration: none;
            border: 5px solid blue;
            padding: 5px 20px;
            border-radius: 5px;
        }
        .mask .update:hover{
            background: blue;
            color: #fff;
        }
        .gridly {
            position: relative;
            width: 800px;
            margin: 30px auto;
        }
        .brick {
            width: 60px;
            height: 60px;
            color: #000;
            border-radius: 5px;
            cursor: pointer;
        }
        .countdown{
            width: 100%;
            height: 50px;
            background: #000;
            position: fixed;
            left: 0;
            top:0;
            z-index: 99;
        }
        .countdown .cont{
            width: 1000px;
            height: 100%;
            margin: 0 auto;
        }
        .countdown .cont div{
            width: 33%;
            height: 50px;
            line-height: 50px;
            color: #fff;
            font-size: 20px;
            float: left;
            text-align: center;
        }
        .countdown div span{
            color: red;
            font-weight: bold;
        }
        .tr{
            text-align: right !important;
        }
        .tl{
            text-align: left !important;
        }
    </style>
    <link href="${prjroot}stake/jquery.gridly.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="countdown">
    <div class="cont">
    <div class="cd1 tr">距比赛开始还剩 <span></span> 秒</div>
    <div class="num">第 <span></span> 期</div>
    <div class="cd2 tl">距下注结束还剩 <span></span> 秒</div>
    </div>
</div>
<div class="mask">
    <div class="info">正在计算比赛结果...</div>
    <div class="gridly"></div>
    <a href="javascript:void(0);" class="update">修改比赛结果</a>
</div>
<c:if test="${not empty message}">
    <div align="center">
        <font color="red">${message}</font>
    </div>
</c:if>
<c:if test="${empty StakeOperationVo}">
    <div align="center">
        <font color="red">暂无比赛</font>
    </div>
</c:if>
<c:if test="${not empty StakeOperationVo}">
    <div align="center">
        <font color="red">当前比赛期号：${StakeOperationVo.racingNum}</font>
    </div>
    <div align="center">
        <font color="red">是否可以押注：${StakeOperationVo.isCanStake?'可以':'停止押注'}</font>
    </div>
    <div align="center">
        <font color="red">比赛开始时间：<fmt:formatDate value="${StakeOperationVo.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font>
    </div>
    <div align="center">
        <font color="red">服务端时间：<fmt:formatDate value="${StakeOperationVo.serverTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font>
    </div>
    <div align="center">
        <font color="red">停止押注时间：<fmt:formatDate value="${StakeOperationVo.endStakeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font>
    </div>
    <div align="center">
        <font color="red">是否可以修改结果：${StakeOperationVo.isCanModifyResult?'可以修改':'停止修改'}</font>
    </div>
    <div align="center">
        <font color="red">修改结果开始时间：<fmt:formatDate value="${StakeOperationVo.startModifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font>
    </div>
    <div align="center">
        <font color="red">修改结果停止时间：<fmt:formatDate value="${StakeOperationVo.endModifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></font>
    </div>
    <div align="center">
        <font color="red">当前比赛结果：${StakeOperationVo.result[0]},${StakeOperationVo.result[1]},${StakeOperationVo.result[2]},
            ${StakeOperationVo.result[3]},${StakeOperationVo.result[4]},${StakeOperationVo.result[5]},${StakeOperationVo.result[6]},
            ${StakeOperationVo.result[7]},${StakeOperationVo.result[8]},${StakeOperationVo.result[9]}</font>
    </div>
</c:if>
<form action="/stake" method="POST">
    <input type="hidden" name="racing_num" value="${StakeOperationVo.racingNum}"/>
    <table align="center" width="960">
        <tr>
            <th colspan="11" align="center"><h3>车号指定押注</h3></th>
        </tr>
        <tr>
            <td></td>
            <td>第一名</td>
            <td>第二名</td>
            <td>第三名</td>
            <td>第四名</td>
            <td>第五名</td>
            <td>第六名</td>
            <td>第七名</td>
            <td>第八名</td>
            <td>第九名</td>
            <td>第十名</td>
        </tr>
        <tr>
            <td>1号车<input type="hidden" name="appointStakeList[0].carNum"
                          value="1"></td>
            <td><input type="text" name="appointStakeList[0].first"
                       value="${empty appointStakeList[0].first ? 0 : appointStakeList[0].first}"></td>
            <td><input type="text" name="appointStakeList[0].second"
                       value="${empty appointStakeList[0].second ? 0 : appointStakeList[0].second}"></td>
            <td><input type="text" name="appointStakeList[0].third"
                       value="${empty appointStakeList[0].third ? 0 : appointStakeList[0].third}"></td>
            <td><input type="text" name="appointStakeList[0].fourth"
                       value="${empty appointStakeList[0].fourth ? 0 : appointStakeList[0].fourth}"></td>
            <td><input type="text" name="appointStakeList[0].fifth"
                       value="${empty appointStakeList[0].fifth ? 0 : appointStakeList[0].fifth}"></td>
            <td><input type="text" name="appointStakeList[0].sixth"
                       value="${empty appointStakeList[0].sixth ? 0 : appointStakeList[0].sixth}"></td>
            <td><input type="text" name="appointStakeList[0].seventh"
                       value="${empty appointStakeList[0].seventh ? 0 : appointStakeList[0].seventh}"></td>
            <td><input type="text" name="appointStakeList[0].eighth"
                       value="${empty appointStakeList[0].eighth ? 0 : appointStakeList[0].eighth}"></td>
            <td><input type="text" name="appointStakeList[0].ninth"
                       value="${empty appointStakeList[0].ninth ? 0 : appointStakeList[0].ninth}"></td>
            <td><input type="text" name="appointStakeList[0].tenth"
                       value="${empty appointStakeList[0].tenth ? 0 : appointStakeList[0].tenth}"></td>
        </tr>
        <tr>
            <td>2号车<input type="hidden" name="appointStakeList[1].carNum"
                          value="2"></td>
            <td><input type="text" name="appointStakeList[1].first"
                       value="${empty appointStakeList[1].first ? 0 : appointStakeList[1].first}"></td>
            <td><input type="text" name="appointStakeList[1].second"
                       value="${empty appointStakeList[1].second ? 0 : appointStakeList[1].second}"></td>
            <td><input type="text" name="appointStakeList[1].third"
                       value="${empty appointStakeList[1].third ? 0 : appointStakeList[1].third}"></td>
            <td><input type="text" name="appointStakeList[1].fourth"
                       value="${empty appointStakeList[1].fourth ? 0 : appointStakeList[1].fourth}"></td>
            <td><input type="text" name="appointStakeList[1].fifth"
                       value="${empty appointStakeList[1].fifth ? 0 : appointStakeList[1].fifth}"></td>
            <td><input type="text" name="appointStakeList[1].sixth"
                       value="${empty appointStakeList[1].sixth ? 0 : appointStakeList[1].sixth}"></td>
            <td><input type="text" name="appointStakeList[1].seventh"
                       value="${empty appointStakeList[1].seventh ? 0 : appointStakeList[1].seventh}"></td>
            <td><input type="text" name="appointStakeList[1].eighth"
                       value="${empty appointStakeList[1].eighth ? 0 : appointStakeList[1].eighth}"></td>
            <td><input type="text" name="appointStakeList[1].ninth"
                       value="${empty appointStakeList[1].ninth ? 0 : appointStakeList[1].ninth}"></td>
            <td><input type="text" name="appointStakeList[1].tenth"
                       value="${empty appointStakeList[1].tenth ? 0 : appointStakeList[1].tenth}"></td>
        </tr>
        <tr>
            <td>3号车<input type="hidden" name="appointStakeList[2].carNum"
                          value="3"></td>
            <td><input type="text" name="appointStakeList[2].first"
                       value="${empty appointStakeList[2].first ? 0 : appointStakeList[2].first}"></td>
            <td><input type="text" name="appointStakeList[2].second"
                       value="${empty appointStakeList[2].second ? 0 : appointStakeList[2].second}"></td>
            <td><input type="text" name="appointStakeList[2].third"
                       value="${empty appointStakeList[2].third ? 0 : appointStakeList[2].third}"></td>
            <td><input type="text" name="appointStakeList[2].fourth"
                       value="${empty appointStakeList[2].fourth ? 0 : appointStakeList[2].fourth}"></td>
            <td><input type="text" name="appointStakeList[2].fifth"
                       value="${empty appointStakeList[2].fifth ? 0 : appointStakeList[2].fifth}"></td>
            <td><input type="text" name="appointStakeList[2].sixth"
                       value="${empty appointStakeList[2].sixth ? 0 : appointStakeList[2].sixth}"></td>
            <td><input type="text" name="appointStakeList[2].seventh"
                       value="${empty appointStakeList[2].seventh ? 0 : appointStakeList[2].seventh}"></td>
            <td><input type="text" name="appointStakeList[2].eighth"
                       value="${empty appointStakeList[2].eighth ? 0 : appointStakeList[2].eighth}"></td>
            <td><input type="text" name="appointStakeList[2].ninth"
                       value="${empty appointStakeList[2].ninth ? 0 : appointStakeList[2].ninth}"></td>
            <td><input type="text" name="appointStakeList[2].tenth"
                       value="${empty appointStakeList[2].tenth ? 0 : appointStakeList[2].tenth}"></td>
        </tr>
        <tr>
            <td>4号车<input type="hidden" name="appointStakeList[3].carNum"
                          value="4"></td>
            <td><input type="text" name="appointStakeList[3].first"
                       value="${empty appointStakeList[3].first ? 0 : appointStakeList[3].first}"></td>
            <td><input type="text" name="appointStakeList[3].second"
                       value="${empty appointStakeList[3].second ? 0 : appointStakeList[3].second}"></td>
            <td><input type="text" name="appointStakeList[3].third"
                       value="${empty appointStakeList[3].third ? 0 : appointStakeList[3].third}"></td>
            <td><input type="text" name="appointStakeList[3].fourth"
                       value="${empty appointStakeList[3].fourth ? 0 : appointStakeList[3].fourth}"></td>
            <td><input type="text" name="appointStakeList[3].fifth"
                       value="${empty appointStakeList[3].fifth ? 0 : appointStakeList[3].fifth}"></td>
            <td><input type="text" name="appointStakeList[3].sixth"
                       value="${empty appointStakeList[3].sixth ? 0 : appointStakeList[3].sixth}"></td>
            <td><input type="text" name="appointStakeList[3].seventh"
                       value="${empty appointStakeList[3].seventh ? 0 : appointStakeList[3].seventh}"></td>
            <td><input type="text" name="appointStakeList[3].eighth"
                       value="${empty appointStakeList[3].eighth ? 0 : appointStakeList[3].eighth}"></td>
            <td><input type="text" name="appointStakeList[3].ninth"
                       value="${empty appointStakeList[3].ninth ? 0 : appointStakeList[3].ninth}"></td>
            <td><input type="text" name="appointStakeList[3].tenth"
                       value="${empty appointStakeList[3].tenth ? 0 : appointStakeList[3].tenth}"></td>
        </tr>
        <tr>
            <td>5号车<input type="hidden" name="appointStakeList[4].carNum"
                          value="5"></td>
            <td><input type="text" name="appointStakeList[4].first"
                       value="${empty appointStakeList[4].first ? 0 : appointStakeList[4].first}"></td>
            <td><input type="text" name="appointStakeList[4].second"
                       value="${empty appointStakeList[4].second ? 0 : appointStakeList[4].second}"></td>
            <td><input type="text" name="appointStakeList[4].third"
                       value="${empty appointStakeList[4].third ? 0 : appointStakeList[4].third}"></td>
            <td><input type="text" name="appointStakeList[4].fourth"
                       value="${empty appointStakeList[4].fourth ? 0 : appointStakeList[4].fourth}"></td>
            <td><input type="text" name="appointStakeList[4].fifth"
                       value="${empty appointStakeList[4].fifth ? 0 : appointStakeList[4].fifth}"></td>
            <td><input type="text" name="appointStakeList[4].sixth"
                       value="${empty appointStakeList[4].sixth ? 0 : appointStakeList[4].sixth}"></td>
            <td><input type="text" name="appointStakeList[4].seventh"
                       value="${empty appointStakeList[4].seventh ? 0 : appointStakeList[4].seventh}"></td>
            <td><input type="text" name="appointStakeList[4].eighth"
                       value="${empty appointStakeList[4].eighth ? 0 : appointStakeList[4].eighth}"></td>
            <td><input type="text" name="appointStakeList[4].ninth"
                       value="${empty appointStakeList[4].ninth ? 0 : appointStakeList[4].ninth}"></td>
            <td><input type="text" name="appointStakeList[4].tenth"
                       value="${empty appointStakeList[4].tenth ? 0 : appointStakeList[4].tenth}"></td>
        </tr>
        <tr>
            <td>6号车<input type="hidden" name="appointStakeList[5].carNum"
                          value="6"></td>
            <td><input type="text" name="appointStakeList[5].first"
                       value="${empty appointStakeList[5].first ? 0 : appointStakeList[5].first}"></td>
            <td><input type="text" name="appointStakeList[5].second"
                       value="${empty appointStakeList[5].second ? 0 : appointStakeList[5].second}"></td>
            <td><input type="text" name="appointStakeList[5].third"
                       value="${empty appointStakeList[5].third ? 0 : appointStakeList[5].third}"></td>
            <td><input type="text" name="appointStakeList[5].fourth"
                       value="${empty appointStakeList[5].fourth ? 0 : appointStakeList[5].fourth}"></td>
            <td><input type="text" name="appointStakeList[5].fifth"
                       value="${empty appointStakeList[5].fifth ? 0 : appointStakeList[5].fifth}"></td>
            <td><input type="text" name="appointStakeList[5].sixth"
                       value="${empty appointStakeList[5].sixth ? 0 : appointStakeList[5].sixth}"></td>
            <td><input type="text" name="appointStakeList[5].seventh"
                       value="${empty appointStakeList[5].seventh ? 0 : appointStakeList[5].seventh}"></td>
            <td><input type="text" name="appointStakeList[5].eighth"
                       value="${empty appointStakeList[5].eighth ? 0 : appointStakeList[5].eighth}"></td>
            <td><input type="text" name="appointStakeList[5].ninth"
                       value="${empty appointStakeList[5].ninth ? 0 : appointStakeList[5].ninth}"></td>
            <td><input type="text" name="appointStakeList[5].tenth"
                       value="${empty appointStakeList[5].tenth ? 0 : appointStakeList[5].tenth}"></td>
        </tr>
        <tr>
            <td>7号车<input type="hidden" name="appointStakeList[6].carNum"
                          value="7"></td>
            <td><input type="text" name="appointStakeList[6].first"
                       value="${empty appointStakeList[6].first ? 0 : appointStakeList[6].first}"></td>
            <td><input type="text" name="appointStakeList[6].second"
                       value="${empty appointStakeList[6].second ? 0 : appointStakeList[6].second}"></td>
            <td><input type="text" name="appointStakeList[6].third"
                       value="${empty appointStakeList[6].third ? 0 : appointStakeList[6].third}"></td>
            <td><input type="text" name="appointStakeList[6].fourth"
                       value="${empty appointStakeList[6].fourth ? 0 : appointStakeList[6].fourth}"></td>
            <td><input type="text" name="appointStakeList[6].fifth"
                       value="${empty appointStakeList[6].fifth ? 0 : appointStakeList[6].fifth}"></td>
            <td><input type="text" name="appointStakeList[6].sixth"
                       value="${empty appointStakeList[6].sixth ? 0 : appointStakeList[6].sixth}"></td>
            <td><input type="text" name="appointStakeList[6].seventh"
                       value="${empty appointStakeList[6].seventh ? 0 : appointStakeList[6].seventh}"></td>
            <td><input type="text" name="appointStakeList[6].eighth"
                       value="${empty appointStakeList[6].eighth ? 0 : appointStakeList[6].eighth}"></td>
            <td><input type="text" name="appointStakeList[6].ninth"
                       value="${empty appointStakeList[6].ninth ? 0 : appointStakeList[6].ninth}"></td>
            <td><input type="text" name="appointStakeList[6].tenth"
                       value="${empty appointStakeList[6].tenth ? 0 : appointStakeList[6].tenth}"></td>
        </tr>
        <tr>
            <td>8号车<input type="hidden" name="appointStakeList[7].carNum"
                          value="8"></td>
            <td><input type="text" name="appointStakeList[7].first"
                       value="${empty appointStakeList[7].first ? 0 : appointStakeList[7].first}"></td>
            <td><input type="text" name="appointStakeList[7].second"
                       value="${empty appointStakeList[7].second ? 0 : appointStakeList[7].second}"></td>
            <td><input type="text" name="appointStakeList[7].third"
                       value="${empty appointStakeList[7].third ? 0 : appointStakeList[7].third}"></td>
            <td><input type="text" name="appointStakeList[7].fourth"
                       value="${empty appointStakeList[7].fourth ? 0 : appointStakeList[7].fourth}"></td>
            <td><input type="text" name="appointStakeList[7].fifth"
                       value="${empty appointStakeList[7].fifth ? 0 : appointStakeList[7].fifth}"></td>
            <td><input type="text" name="appointStakeList[7].sixth"
                       value="${empty appointStakeList[7].sixth ? 0 : appointStakeList[7].sixth}"></td>
            <td><input type="text" name="appointStakeList[7].seventh"
                       value="${empty appointStakeList[7].seventh ? 0 : appointStakeList[7].seventh}"></td>
            <td><input type="text" name="appointStakeList[7].eighth"
                       value="${empty appointStakeList[7].eighth ? 0 : appointStakeList[7].eighth}"></td>
            <td><input type="text" name="appointStakeList[7].ninth"
                       value="${empty appointStakeList[7].ninth ? 0 : appointStakeList[7].ninth}"></td>
            <td><input type="text" name="appointStakeList[7].tenth"
                       value="${empty appointStakeList[7].tenth ? 0 : appointStakeList[7].tenth}"></td>
        </tr>
        <tr>
            <td>9号车<input type="hidden" name="appointStakeList[8].carNum"
                          value="9"></td>
            <td><input type="text" name="appointStakeList[8].first"
                       value="${empty appointStakeList[8].first ? 0 : appointStakeList[8].first}"></td>
            <td><input type="text" name="appointStakeList[8].second"
                       value="${empty appointStakeList[8].second ? 0 : appointStakeList[8].second}"></td>
            <td><input type="text" name="appointStakeList[8].third"
                       value="${empty appointStakeList[8].third ? 0 : appointStakeList[8].third}"></td>
            <td><input type="text" name="appointStakeList[8].fourth"
                       value="${empty appointStakeList[8].fourth ? 0 : appointStakeList[8].fourth}"></td>
            <td><input type="text" name="appointStakeList[8].fifth"
                       value="${empty appointStakeList[8].fifth ? 0 : appointStakeList[8].fifth}"></td>
            <td><input type="text" name="appointStakeList[8].sixth"
                       value="${empty appointStakeList[8].sixth ? 0 : appointStakeList[8].sixth}"></td>
            <td><input type="text" name="appointStakeList[8].seventh"
                       value="${empty appointStakeList[8].seventh ? 0 : appointStakeList[8].seventh}"></td>
            <td><input type="text" name="appointStakeList[8].eighth"
                       value="${empty appointStakeList[8].eighth ? 0 : appointStakeList[8].eighth}"></td>
            <td><input type="text" name="appointStakeList[8].ninth"
                       value="${empty appointStakeList[8].ninth ? 0 : appointStakeList[8].ninth}"></td>
            <td><input type="text" name="appointStakeList[8].tenth"
                       value="${empty appointStakeList[8].tenth ? 0 : appointStakeList[8].tenth}"></td>
        </tr>
        <tr>
            <td>10号车<input type="hidden" name="appointStakeList[9].carNum"
                           value="10"></td>
            <td><input type="text" name="appointStakeList[9].first"
                       value="${empty appointStakeList[9].first ? 0 : appointStakeList[9].first}"></td>
            <td><input type="text" name="appointStakeList[9].second"
                       value="${empty appointStakeList[9].second ? 0 : appointStakeList[9].second}"></td>
            <td><input type="text" name="appointStakeList[9].third"
                       value="${empty appointStakeList[9].third ? 0 : appointStakeList[9].third}"></td>
            <td><input type="text" name="appointStakeList[9].fourth"
                       value="${empty appointStakeList[9].fourth ? 0 : appointStakeList[9].fourth}"></td>
            <td><input type="text" name="appointStakeList[9].fifth"
                       value="${empty appointStakeList[9].fifth ? 0 : appointStakeList[9].fifth}"></td>
            <td><input type="text" name="appointStakeList[9].sixth"
                       value="${empty appointStakeList[9].sixth ? 0 : appointStakeList[9].sixth}"></td>
            <td><input type="text" name="appointStakeList[9].seventh"
                       value="${empty appointStakeList[9].seventh ? 0 : appointStakeList[9].seventh}"></td>
            <td><input type="text" name="appointStakeList[9].eighth"
                       value="${empty appointStakeList[9].eighth ? 0 : appointStakeList[9].eighth}"></td>
            <td><input type="text" name="appointStakeList[9].ninth"
                       value="${empty appointStakeList[9].ninth ? 0 : appointStakeList[9].ninth}"></td>
            <td><input type="text" name="appointStakeList[9].tenth"
                       value="${empty appointStakeList[9].tenth ? 0 : appointStakeList[9].tenth}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="hidden" name="rankingStakeList[0].rankingNum"
                       value="1"/></td>
            <td><input type="hidden" name="rankingStakeList[1].rankingNum"
                       value="2"/></td>
            <td><input type="hidden" name="rankingStakeList[2].rankingNum"
                       value="3"/></td>
            <td><input type="hidden" name="rankingStakeList[3].rankingNum"
                       value="4"/></td>
            <td><input type="hidden" name="rankingStakeList[4].rankingNum"
                       value="5"/></td>
            <td><input type="hidden" name="rankingStakeList[5].rankingNum"
                       value="6"/></td>
            <td><input type="hidden" name="rankingStakeList[6].rankingNum"
                       value="7"/></td>
            <td><input type="hidden" name="rankingStakeList[7].rankingNum"
                       value="8"/></td>
            <td><input type="hidden" name="rankingStakeList[8].rankingNum"
                       value="9"/></td>
            <td><input type="hidden" name="rankingStakeList[9].rankingNum"
                       value="10"/></td>
        </tr>
        <tr>
            <td>大</td>
            <td><input type="text" name="rankingStakeList[0].big"
                       value="${empty rankingStakeList[0].big ? 0 : rankingStakeList[0].big}"></td>
            <td><input type="text" name="rankingStakeList[1].big"
                       value="${empty rankingStakeList[1].big ? 0 : rankingStakeList[1].big}"></td>
            <td><input type="text" name="rankingStakeList[2].big"
                       value="${empty rankingStakeList[2].big ? 0 : rankingStakeList[2].big}"></td>
            <td><input type="text" name="rankingStakeList[3].big"
                       value="${empty rankingStakeList[3].big ? 0 : rankingStakeList[3].big}"></td>
            <td><input type="text" name="rankingStakeList[4].big"
                       value="${empty rankingStakeList[4].big ? 0 : rankingStakeList[4].big}"></td>
            <td><input type="text" name="rankingStakeList[5].big"
                       value="${empty rankingStakeList[5].big ? 0 : rankingStakeList[5].big}"></td>
            <td><input type="text" name="rankingStakeList[6].big"
                       value="${empty rankingStakeList[6].big ? 0 : rankingStakeList[6].big}"></td>
            <td><input type="text" name="rankingStakeList[7].big"
                       value="${empty rankingStakeList[7].big ? 0 : rankingStakeList[7].big}"></td>
            <td><input type="text" name="rankingStakeList[8].big"
                       value="${empty rankingStakeList[8].big ? 0 : rankingStakeList[8].big}"></td>
            <td><input type="text" name="rankingStakeList[9].big"
                       value="${empty rankingStakeList[9].big ? 0 : rankingStakeList[8].big}"></td>
        </tr>
        <tr>
            <td>小</td>
            <td><input type="text" name="rankingStakeList[0].small"
                       value="${empty rankingStakeList[0].small ? 0 : rankingStakeList[0].small}"></td>
            <td><input type="text" name="rankingStakeList[1].small"
                       value="${empty rankingStakeList[1].small ? 0 : rankingStakeList[1].small}"></td>
            <td><input type="text" name="rankingStakeList[2].small"
                       value="${empty rankingStakeList[2].small ? 0 : rankingStakeList[2].small}"></td>
            <td><input type="text" name="rankingStakeList[3].small"
                       value="${empty rankingStakeList[3].small ? 0 : rankingStakeList[3].small}"></td>
            <td><input type="text" name="rankingStakeList[4].small"
                       value="${empty rankingStakeList[4].small ? 0 : rankingStakeList[4].small}"></td>
            <td><input type="text" name="rankingStakeList[5].small"
                       value="${empty rankingStakeList[5].small ? 0 : rankingStakeList[5].small}"></td>
            <td><input type="text" name="rankingStakeList[6].small"
                       value="${empty rankingStakeList[6].small ? 0 : rankingStakeList[6].small}"></td>
            <td><input type="text" name="rankingStakeList[7].small"
                       value="${empty rankingStakeList[7].small ? 0 : rankingStakeList[7].small}"></td>
            <td><input type="text" name="rankingStakeList[8].small"
                       value="${empty rankingStakeList[8].small ? 0 : rankingStakeList[8].small}"></td>
            <td><input type="text" name="rankingStakeList[9].small"
                       value="${empty rankingStakeList[9].small ? 0 : rankingStakeList[8].small}"></td>
        </tr>
        <tr>
            <td>单</td>
            <td><input type="text" name="rankingStakeList[0].odd"
                       value="${empty rankingStakeList[0].odd ? 0 : rankingStakeList[0].odd}"></td>
            <td><input type="text" name="rankingStakeList[1].odd"
                       value="${empty rankingStakeList[1].odd ? 0 : rankingStakeList[1].odd}"></td>
            <td><input type="text" name="rankingStakeList[2].odd"
                       value="${empty rankingStakeList[2].odd ? 0 : rankingStakeList[2].odd}"></td>
            <td><input type="text" name="rankingStakeList[3].odd"
                       value="${empty rankingStakeList[3].odd ? 0 : rankingStakeList[3].odd}"></td>
            <td><input type="text" name="rankingStakeList[4].odd"
                       value="${empty rankingStakeList[4].odd ? 0 : rankingStakeList[4].odd}"></td>
            <td><input type="text" name="rankingStakeList[5].odd"
                       value="${empty rankingStakeList[5].odd ? 0 : rankingStakeList[5].odd}"></td>
            <td><input type="text" name="rankingStakeList[6].odd"
                       value="${empty rankingStakeList[6].odd ? 0 : rankingStakeList[6].odd}"></td>
            <td><input type="text" name="rankingStakeList[7].odd"
                       value="${empty rankingStakeList[7].odd ? 0 : rankingStakeList[7].odd}"></td>
            <td><input type="text" name="rankingStakeList[8].odd"
                       value="${empty rankingStakeList[8].odd ? 0 : rankingStakeList[8].odd}"></td>
            <td><input type="text" name="rankingStakeList[9].odd"
                       value="${empty rankingStakeList[9].odd ? 0 : rankingStakeList[8].odd}"></td>
        </tr>
        <tr>
            <td>双</td>
            <td><input type="text" name="rankingStakeList[0].even"
                       value="${empty rankingStakeList[0].even ? 0 : rankingStakeList[0].even}"></td>
            <td><input type="text" name="rankingStakeList[1].even"
                       value="${empty rankingStakeList[1].even ? 0 : rankingStakeList[1].even}"></td>
            <td><input type="text" name="rankingStakeList[2].even"
                       value="${empty rankingStakeList[2].even ? 0 : rankingStakeList[2].even}"></td>
            <td><input type="text" name="rankingStakeList[3].even"
                       value="${empty rankingStakeList[3].even ? 0 : rankingStakeList[3].even}"></td>
            <td><input type="text" name="rankingStakeList[4].even"
                       value="${empty rankingStakeList[4].even ? 0 : rankingStakeList[4].even}"></td>
            <td><input type="text" name="rankingStakeList[5].even"
                       value="${empty rankingStakeList[5].even ? 0 : rankingStakeList[5].even}"></td>
            <td><input type="text" name="rankingStakeList[6].even"
                       value="${empty rankingStakeList[6].even ? 0 : rankingStakeList[6].even}"></td>
            <td><input type="text" name="rankingStakeList[7].even"
                       value="${empty rankingStakeList[7].even ? 0 : rankingStakeList[7].even}"></td>
            <td><input type="text" name="rankingStakeList[8].even"
                       value="${empty rankingStakeList[8].even ? 0 : rankingStakeList[8].even}"></td>
            <td><input type="text" name="rankingStakeList[9].even"
                       value="${empty rankingStakeList[9].even ? 0 : rankingStakeList[8].even}"></td>
        </tr>
    </table>

    <table align="center" width="960">
        <tr>
            <td valign="top" width="33%">
                <table align="center">
                    <tr>
                        <th colspan="2" align="center"><h3>龙虎指定押注</h3></th>
                    </tr>
                    <tr>
                        <td>冠 军:龙</td>
                        <td><input type="text" name="commonStake.firstUp"
                                   value="${empty commonStake.firstUp ? 0 : commonStake.firstUp}"></td>
                    </tr>
                    <tr>
                        <td>冠 军:虎</td>
                        <td><input type="text" name="commonStake.firstDowm"
                                   value="${empty commonStake.firstDowm ? 0 : commonStake.firstDowm}"></td>
                    </tr>

                    <tr>
                        <td>亚 军:龙</td>
                        <td><input type="text" name="commonStake.secondUp"
                                   value="${empty commonStake.secondUp ? 0 : commonStake.secondUp}"></td>
                    </tr>
                    <tr>
                        <td>亚 军:虎</td>
                        <td><input type="text" name="commonStake.secondDowm"
                                   value="${empty commonStake.secondDowm ? 0 : commonStake.secondDowm}"></td>
                    </tr>

                    <tr>
                        <td>第三名:龙</td>
                        <td><input type="text" name="commonStake.thirdUp"
                                   value="${empty commonStake.thirdUp ? 0 : commonStake.thirdUp}"></td>
                    </tr>
                    <tr>
                        <td>第三名:虎</td>
                        <td><input type="text" name="commonStake.thirdDowm"
                                   value="${empty commonStake.thirdDowm ? 0 : commonStake.thirdDowm}"></td>
                    </tr>
                    <tr>
                        <td>第四名:龙</td>
                        <td><input type="text" name="commonStake.fourthUp"
                                   value="${empty commonStake.fourthUp ? 0 : commonStake.fourthUp}"></td>
                    </tr>
                    <tr>
                        <td>第四名:虎</td>
                        <td><input type="text" name="commonStake.fourthDowm"
                                   value="${empty commonStake.fourthDowm ? 0 : commonStake.fourthDowm}"></td>
                    </tr>
                    <tr>
                        <td>第五名:龙</td>
                        <td><input type="text" name="commonStake.fifthUp"
                                   value="${empty commonStake.fifthUp ? 0 : commonStake.fifthUp}"></td>
                    </tr>
                    <tr>
                        <td>第五名:虎</td>
                        <td><input type="text" name="commonStake.fifthDowm"
                                   value="${empty commonStake.fifthDowm ? 0 : commonStake.fifthDowm}"></td>
                    </tr>
                </table>
            </td>

            <td width="33%">
                <table align="center">
                    <tr>
                        <th colspan="2" align="center"><h3>冠亚和值押注</h3></th>
                    </tr>
                    <tr>
                        <td>冠亚和:单</td>
                        <td><input type="text" name="commonStake.firstSecondOdd"
                                   value="${empty commonStake.firstSecondOdd ? 0 : commonStake.firstSecondOdd}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:双</td>
                        <td><input type="text" name="commonStake.firstSecondEven"
                                   value="${empty commonStake.firstSecondEven ? 0 : commonStake.firstSecondEven}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>冠亚和:大</td>
                        <td><input type="text" name="commonStake.firstSecondBig"
                                   value="${empty commonStake.firstSecondBig ? 0 : commonStake.firstSecondBig}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:小</td>
                        <td><input type="text" name="commonStake.firstSecondSmall"
                                   value="${empty commonStake.firstSecondSmall ? 0 : commonStake.firstSecondSmall}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>冠亚和:3</td>
                        <td><input type="text" name="commonStake.firstSecond3"
                                   value="${empty commonStake.firstSecond3 ? 0 : commonStake.firstSecond3}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:4</td>
                        <td><input type="text" name="commonStake.firstSecond4"
                                   value="${empty commonStake.firstSecond4 ? 0 : commonStake.firstSecond4}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:5</td>
                        <td><input type="text" name="commonStake.firstSecond5"
                                   value="${empty commonStake.firstSecond5 ? 0 : commonStake.firstSecond5}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:6</td>
                        <td><input type="text" name="commonStake.firstSecond6"
                                   value="${empty commonStake.firstSecond6 ? 0 : commonStake.firstSecond6}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:7</td>
                        <td><input type="text" name="commonStake.firstSecond7"
                                   value="${empty commonStake.firstSecond7 ? 0 : commonStake.firstSecond7}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:8</td>
                        <td><input type="text" name="commonStake.firstSecond8"
                                   value="${empty commonStake.firstSecond8 ? 0 : commonStake.firstSecond8}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:9</td>
                        <td><input type="text" name="commonStake.firstSecond9"
                                   value="${empty commonStake.firstSecond9 ? 0 : commonStake.firstSecond9}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:10</td>
                        <td><input type="text" name="commonStake.firstSecond10"
                                   value="${empty commonStake.firstSecond10 ? 0 : commonStake.firstSecond10}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:11</td>
                        <td><input type="text" name="commonStake.firstSecond11"
                                   value="${empty commonStake.firstSecond11 ? 0 : commonStake.firstSecond11}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:12</td>
                        <td><input type="text" name="commonStake.firstSecond12"
                                   value="${empty commonStake.firstSecond12 ? 0 : commonStake.firstSecond12}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:13</td>
                        <td><input type="text" name="commonStake.firstSecond13"
                                   value="${empty commonStake.firstSecond13 ? 0 : commonStake.firstSecond13}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:14</td>
                        <td><input type="text" name="commonStake.firstSecond14"
                                   value="${empty commonStake.firstSecond14 ? 0 : commonStake.firstSecond14}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:15</td>
                        <td><input type="text" name="commonStake.firstSecond15"
                                   value="${empty commonStake.firstSecond15 ? 0 : commonStake.firstSecond15}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:16</td>
                        <td><input type="text" name="commonStake.firstSecond16"
                                   value="${empty commonStake.firstSecond16 ? 0 : commonStake.firstSecond16}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:17</td>
                        <td><input type="text" name="commonStake.firstSecond17"
                                   value="${empty commonStake.firstSecond17 ? 0 : commonStake.firstSecond17}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:18</td>
                        <td><input type="text" name="commonStake.firstSecond18"
                                   value="${empty commonStake.firstSecond18 ? 0 : commonStake.firstSecond18}"></td>
                    </tr>
                    <tr>
                        <td>冠亚和:19</td>
                        <td><input type="text" name="commonStake.firstSecond19"
                                   value="${empty commonStake.firstSecond19 ? 0 : commonStake.firstSecond19}"></td>
                    </tr>
                </table>
            </td>

            <td valign="top" width="33%">
                <table align="right" class="btns">
                    <tr>
                        <td><input type="submit" value="提交"></td>
                        <td><input type="button" value="重置"
                                   onclick="window.location.href='/view/stake'"></td>
                        <td><input type="button" value="统计记录"
                        onclick="window.open('/stake/history', '_blank')"></td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</form>
<script src="${prjroot}stake/jquery-1.9.1.js"></script>
<script src="${prjroot}stake/jquery.gridly.js"></script>
<script>
    var racingNum;
    var isStakeTime = true;
    var isUpdateTime = false;
    $('body').on('click', '.update', function(){
        var sort = [];
        var result = [];
        $('.gridly .brick').each(function(){
            var $this = $(this);
            var left = parseInt($this.css('left'));
            var value = parseInt($this.text());
            sort.push([value, left]);
        });
        sort.sort(function (a, b) {
            return a[1] - b[1];
        });
        $(sort).each(function (i, v) {
            result.push(v[0]);
        });

        var racingResult = result.join(',');
        racingResult = "[" + racingResult + "]";
        $.ajax({
            type: 'POST',
            url: '/stake/racing/'+ racingNum +'/result',
            dataType: 'json',
            data: {
                racingResult: racingResult
            },
            success: function(data){
                alert(data.message);
            }
        });
    });


    setInterval(function(){
        $.ajax({
//            url: 'stake.json',
            url: '/stake/now',
            dataType: 'json',
            success: function(data){
                var racNum = data.data.racingNum;
                var isCanStake = data.data.isCanStake;
                var isCanModifyResult = data.data.isCanModifyResult;
                var result = data.data.result;
                $('.countdown .num span').text(racNum);
                if(!racingNum) {
                    racingNum = racNum;
                }
                if(racNum != racingNum) {
                    $('.mask .info').text('正在计算比赛结果...');
                    $('.mask').hide();
                }
                if(!isCanStake) {
                    $('.mask').show();
                }
                if(isCanModifyResult && !isUpdateTime) {
                    $('.mask .info').text('比赛结果');
                    var tmpl = '';
                    $(result).each(function(i, v){
                        tmpl += '<div class="brick text_bg_'+ v +'">'+ v +'</div>';
                    });
                    $('.gridly').html(tmpl);
                    $('.update').show();
                    isUpdateTime = true;
                    $('.gridly').gridly();
                }
                if (!isCanModifyResult && isUpdateTime){
                    $('.update').hide();
                }
            }
        });
    }, 2000)

    function countdown1(start, end){
        var diff = (end - start)/1000;
        var cd = setInterval(function(){
            diff -= 1;
            $('.countdown .cd1 span').text(diff);
            if(diff <= 0){
                location.href='/view/stake';
            }
        }, 1000)
    }

    function countdown2(start, end){
        var diff = (end - start)/1000;
        var cd = setInterval(function(){
            diff -= 1;
            $('.countdown .cd2 span').text(diff);
            if(diff <= 0){
                $('.countdown .cd2').html('停止下注');
            }
        }, 1000)
    }

    //比赛倒计时
    countdown1(${serverTime}, ${startTime});

    //押注倒计时
    countdown2(${serverTime}, ${endStakeTime});
</script>
</body>
</html>