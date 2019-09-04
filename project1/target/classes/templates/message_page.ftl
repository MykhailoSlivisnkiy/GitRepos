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
    <link rel="stylesheet" type="text/css" href="/static/message.css">

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

<div class="container messages">
    <div class="over">
        <#if receivers?has_content>
            <#list receivers as receiver>
                <div class="message">
                    <#if receiver.author.id != user.id>
                        <p class="left">${receiver.message}</p>
                    <#else> <p class="right">${receiver.message}</p>
                    </#if>
                </div>
            </#list>
        <#else>
            <p>No message</p>
        </#if>
    </div>

    <div class="container">

        <div class="postik">
            <form action="formMessage" method="post">
              <textarea type="text" maxlength="100" class="form-control ${(textError??)?string('is-invalid', '')}"
                        name="text"></textarea>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">Send</button>
            </form>
        </div>
    </div>

</div>
</body>
</html>
