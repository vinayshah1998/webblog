<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Karim Sabar, and Vinay Shah">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Karim and Vinay's Blog</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
</head>

<body>

<%

    String guestbookName = request.getParameter("guestbookName");

    if (guestbookName == null) {

        guestbookName = "default";

    }

    pageContext.setAttribute("guestbookName", guestbookName);

    UserService userService = UserServiceFactory.getUserService();

    User user = userService.getCurrentUser();

    if (user != null) {

        pageContext.setAttribute("user", user);

%>

<div class="container">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="text-muted" href="#">Unsubscribe</a>
            </div>
            <div class="col-4 text-center">
                <a class="blog-header-logo text-dark" href="index.html">Karim and Vinay's Blog</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <a class="btn btn-sm btn-outline-primary mr-2" href="">New Post</a><span></span>
                <a class="btn btn-sm btn-outline-danger" href="index.html">Log Out</a>
            </div>
        </div>
    </header>
    <br><br>
    <form action = "/post" method = "post">
        <div class="form-group">
            <label for="exampleFormControlInput1">Title of Blog Post</label>
            <input class="form-control" id="exampleFormControlInput1" placeholder="Ex: What is a good meme" name = "blogTitle">
        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea1">Blog Post Content</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Ex: Why you like this meme, why is it funny etc." name = "content"></textarea>
        </div>
        <input type="submit" name="Submit" class="btn btn-primary">
        <input type="hidden" name="guestbookName" value="${fn:escapeXml(guestbookName)}"/>

    </form>
    <form action = "/blog" method = "get">
        <input type = "submit" value= "Cancel" class ="btn btn-danger">
    </form>

    <br>


</div>

</main>

<footer class="blog-footer fixed-bottom">
    <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
    <p>Blog created by Karim Sabar and Vinay Shah</p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
<%--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>--%>
<%--<script src="../../assets/js/vendor/popper.min.js"></script>--%>
<%--<script src="../../dist/js/bootstrap.min.js"></script>--%>
<%--<script src="../../assets/js/vendor/holder.min.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
    });
</script>

<%
    }
%>
</body>
</html>
