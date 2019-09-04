<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="/static/signin.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
            <#if "User exist!" == enter><h2 style="color: crimson">${enter}</h2><#else><h2>${enter}</h2></#if>
        </div>

        <!-- Login Form -->
        <form method="post">
            <input type="text" id="login" class="fadeIn second" name="username" placeholder="user name">
            <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
            <input type="email" id="login" class="fadeIn second" name="email" placeholder="email">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" class="fadeIn fourth" value="Add">
        </form>

    </div>
</body>
</html>