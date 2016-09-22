<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="prjroot"></spring:url>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理控台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${prjroot}css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${prjroot}css/inner.css">
</head>
<body class='historyBody'>
    <h2>账户历史</h2>
    <div id="table-box" class="table-responsive"></div>
</body>
<script src="${prjroot}js/jquery-1.9.1.js"></script>
<script src="${prjroot}js/template.js"></script>
<script type="text/html" id="tableTemp">
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <td>日期</td>
                <td>注数</td>
                <td>下注金额</td>
                <td>佣金</td>
                <td>盈亏</td>
            </tr>
        </thead>
        <tbody>
            {{each data as value index}}
            <tr {{ index==7?'style=background-color:#d9edf7':''}}>
                <td>{{value.day}}</td>
                <td>{{value.totalStakeCount}}</td>
                <td>{{value.totalStakeAmount}}</td>
                <td>{{value.totalCommissionAmount}}</td>
                <td {{value.totalIncomeAmount<0 ? 'style=color:red':''}}>{{value.totalIncomeAmount}}</td>
            </tr>
            {{/each}}
        </tbody>
    </table>
</script>
<script src="${prjroot}js/history.js"></script>
</html>
