<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<#include "path/navbar.ftl">

<div>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="submit" value="Sign Out"/>
    </form>
</div>
<img src="/img/1.jpeg" alt="wd">
<#list users as user>
    <p>${user.username}   ${user.password} ${user.email}</p>
</#list>
</body>
</html>