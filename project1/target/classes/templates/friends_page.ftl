<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>


    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/userPage.css">
    <link rel="stylesheet" type="text/css" href="/static/settingPage.css">
    <link rel="stylesheet" type="text/css" href="/static/newsPage.css">

    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/jquery-ui.min.js"></script>

    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
</head>
<body>

<#include "path/security.ftl">
<#include "path/navbar.ftl">

<div class="emty"></div>

<#if users?has_content>
    <#list users as user>
        <div class="container friends_container">
            <div class="friends_logo">
                <img src="/img/${user.filename!"bootstrap-logo.jpg"}">
            </div>
            <div class="friends_info">
                <div>
                    <h2><a href="/user/${user.id}">${user.fistName!""} ${user.lastName!""}</a></h2>
                </div>
                <div>
                    <h4>${user.info!""}</h4>
                </div>
            </div>
        </div>
    </#list>
</#if>
</body>
</html>
