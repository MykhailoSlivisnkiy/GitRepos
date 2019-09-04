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

    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/jquery-ui.min.js"></script>


    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
</head>
<body>


<#include "path/security.ftl">
<#include "path/navbar.ftl">

<#if messages?has_content>
    <#list messages as message>
    <div class="friends_message">
        <div class="friends_message_img">
            <img src="/img/${message.filename!"bootstrap-logo.jpg"}">
         </div>
        <div class="friends_message_name">
            <p><a class="nav-link linke" href="/user/message/${message.id}">${message.fistName} ${message.lastName}</a></p>
        </div>
    </div>
</#list>
</#if>

</body>
</html>
