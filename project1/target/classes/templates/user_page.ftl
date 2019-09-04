<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>


    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/userPage.css">

    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
</head>

<body>

<#include "path/navbar.ftl">


<div class="container">
    <div class="row">
        <header>
            <div style="background-color: darkblue">
                <div class="container-fluid section">
                    <img src="/img/${user.filename!"bootstrap-logo.jpg"}">
                </div>

                <div class="container-fluid aside" style="background-color: ghostwhite">
                    <div class="userName">
                        <h3>${user.fistName!""} ${user.lastName!""}</h3>
                    </div>
                    <div>
                        <h4>${user.quote!""}</h4>
                    </div>
                    <br>
                    <div class="userInformation">
                        <div class="userInformationLeft">
                            <p>Birthday:</p>
                            <p>City:</p>
                            <p>Info:</p>
                        </div>
                        <div class="userInformationRight">
                            <p>${user.birtday!"Not specified"}</p>
                            <p>${user.city!"Not specified"}</p>
                            <p>${user.info!"<"}</p>
                        </div>
                    </div>

                </div>

            </div>
        </header>

        <#if user.id != user1.id>
            <div class="friends_message">
                <div class="friends_btn">
                        <a class="btn_friends btn btn-primary" href="/user/friends/${user.id}">Add friends</a>
                </div>
                <div class="message_btn">
                    <a class="btn_message btn btn-primary" href="/user/message/${user.id}">Send Message</a>
                </div>
            </div>
        </#if>

        <#if user.id == user1.id>
            <div class="userSaveFiles" style="margin-top: 120px; width: 26%; margin-left: -40px">
                <div class="photo_text">
                    <h5>Photo</h5>
                </div>
                <div class="photo_group">
                    <img src="/img/1.jpeg">
                    <img src="/img/bootstrap-logo.jpg">
                    <img src="/img/1.jpeg">
                </div>

                <div class="music_group">
                    <div class="photo_text">
                        <h5>Music</h5>
                    </div>
                    <div class="music_group">
                        <p>Music 1</p>
                        <p>Music 2</p>
                        <p>Music 3</p>
                    </div>
                </div>
            </div>
        <#else>
            <div class="userSaveFiles">
                <div class="photo_text">
                    <h5>Photo</h5>
                </div>
                <div class="photo_group">
                    <img src="/img/1.jpeg">
                    <img src="/img/bootstrap-logo.jpg">
                    <img src="/img/1.jpeg">
                </div>

                <div class="music_group">
                    <div class="photo_text">
                        <h5>Music</h5>
                    </div>
                    <div class="music_group">
                        <p>Music 1</p>
                        <p>Music 2</p>
                        <p>Music 3</p>
                    </div>
                </div>
            </div>
        </#if>

        <#if user.id == user1.id>
            <div class="MyForm">
                <h4>Enter your message</h4>
                <form action="formPost" method="post" enctype="multipart/form-data">
                    <div class="form-group formText">
                    <textarea type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                              name="text"></textarea>
                    </div>

                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile">
                            <label class="custom-file-label chooseFile" for="customFile">Choose file</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Save message</button>
                    </div>
                </form>
            </div>
        </#if>
        <#if messages?has_content>
            <#list messages as message>
                <div>
                    <div class="container fasting">
                        <div class="post">
                            <div>
                                <div class="show-hide-column-image image">
                                    <img src="/img/${user.filename!"bootstrap-logo.jpg"}">
                                </div>

                                <div class="fasting_username">
                                    <h5>${user.fistName} ${user.lastName}</h5>
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
        </#if>
        <footer>
            <div class="emp"></div>
        </footer>
    </div>
</div>
</body>
</html>