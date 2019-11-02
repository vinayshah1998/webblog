package blog;

import java.io.IOException;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.google.appengine.api.users.User;

import com.google.appengine.api.users.UserService;

import com.google.appengine.api.users.UserServiceFactory;



import java.io.IOException;

import java.util.Date;



import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


public class allBlogPost extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException {
        UserService userService = UserServiceFactory.getUserService();

        User user = userService.getCurrentUser();



        String guestbookName = req.getParameter("guestbookName");

        String content = req.getParameter("content");

        String title = req.getParameter("blogTitle");

        Date date = new Date();



        resp.sendRedirect("/allblog.jsp?guestbookName=" + guestbookName);

    }

}