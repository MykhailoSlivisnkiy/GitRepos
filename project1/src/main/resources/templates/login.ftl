<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login </title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="/static/signin.css" rel="stylesheet">

</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
            <h2>${Enter!"Enter"}</h2>
        </div>

        <!-- Login Form -->
        <form action="/login" method="post">
            <input type="text" id="login" class="fadeIn second" name="username" placeholder="user name">
            <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" class="fadeIn fourth" value="Log In">
        </form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
            <a class="underlineHover" href="registration">Registration</a>
        </div>
</div>
</body>
</html>


