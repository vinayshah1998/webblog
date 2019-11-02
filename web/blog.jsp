<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="blog.blogMessage" %>

<html>
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
<h1>Meme Blog</h1>
<p>by Karim and Vinay</p>
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
<div class = "heading">
    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Sign out</a>
    <form action="/blogform" method = "get">
        <input type = "submit" value = "submit blog">
    </form>
</div>
<%
} else {
%>

<div class = "heading">
    <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
</div>

<%
    }
%>
<%
    ObjectifyService.register(blogMessage.class);
    List<blogMessage> message = ObjectifyService.ofy().load().type(blogMessage.class).list();
    Collections.sort(message, Collections.reverseOrder());
    if (message.isEmpty()) {
%>

<p>User '${fn:escapeXml(guestbookName)}' has no posts.</p>

<%
} else {
%>

<p>Blog posts by '${fn:escapeXml(guestbookName)}'.</p>

<%
    int i = 0;

    for (blogMessage messages : message) {
        pageContext.setAttribute("messages_content", messages.getContent());
        pageContext.setAttribute("messages_user", messages.getUser());
        pageContext.setAttribute("messages_title", messages.getBlogTitle());
        pageContext.setAttribute("messages_date", messages.getDate());
        if (i < 5){
%>
<div style="border-style: dotted">
    <p><b>${fn:escapeXml(messages_user.nickname)}</b> wrote:</p>
    <p><b>${fn:escapeXml(messages_title)}</b></p>
    <p>${fn:escapeXml(messages_date)}</p>
    <blockquote>${fn:escapeXml(messages_content)}</blockquote>
</div>

<%
            i++;
        }
    }
%>
<form action="/allpost" method = "get">
    <input type = "submit" value = "See All Posts">
</form>
<%
    }
%>
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
</body>
</html>