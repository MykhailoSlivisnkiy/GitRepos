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

<div>
    <#list messages as message>
        <div>
            <div class="container fasting">
                <div class="post">
                    <div>
                        <div class="show-hide-column-image image">

                            <img src="/img/${message.author.filename!"bootstrap-logo.jpg"}">

                        </div>

                        <div class="fasting_username">
                            <h5>${message.author.fistName} ${message.author.lastName}</h5>
                        </div>
                        <div>
                            <h5>${message.text}</h5>
                        </div>
                    </div>
                    <div>
                        <#if message.filename??>
                            <img class="post_image" src="/img/${message.filename}">
                        <#else>
                            <div class="empty"></div>
                        </#if>
                    </div>
                    <div>
                        <div class="share">
                            <p>Поділитися</p>
                        </div>
                        <div class="like">
                            <p>${message.lik} Ліке</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#list>
</div>

</body>
</html>