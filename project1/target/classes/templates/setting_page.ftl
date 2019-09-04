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



<div class="container">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <div class="custom-file">
                <input type="file" name="file" id="customFile">
                <label class="custom-file-label" for="customFile"><img src="/img/${user.filename!"bootstrap-logo.jpg"}"></label>
            </div>

    </div>
    <div class="firstName">

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="text" name="first_name" placeholder="First name">
        <input type="text" name="last_name" placeholder="Last name">
        <input type="text" name="quote" placeholder="Quote">
        <input type="text" name="city" placeholder="City">
        <input type="date" name="data">
        <input type="text" name="info" placeholder="Information">
        <input type="submit" class="btn fadeIn fourth" value="Save">
        </form>
    </div>
</div>

</body>
</html>
