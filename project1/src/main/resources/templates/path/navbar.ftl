<!-- Head navbar-->

<div class="container-fluid nav_head">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Social network</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent"><script type="text/javascript">
                $(function() {


                    $('#acInput').autocomplete({
                        source: "findAutoComplete"
                    })
                });
            </script>
            <form class="form-inline my-2 my-lg-0 headForm" action="/find">
                <input class="form-control mr-sm-2 " type="text" name="finder" id="acInput" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <div class="nav_picture">
            <img src="/img/bootstrap-logo.jpg">
        </div>
    </nav>
</div>


<!-- Left navbar-->
<div class="navbar navbar-inverse navbar-fixed-left">
    <a class="navbar-brand" href="/user">${user1.username!""}</a>
    <ul class="nav navbar-nav">
        <li><a class="nav-link" href="/messages">Messages</a></li>
        <li><a class="nav-link" href="/friends">Friends</a></li>
        <li><a class="nav-link" href="/news">News</a></li>
        <li><a class="nav-link" href="/setting">Setting</a></li>
    </ul>
</div>