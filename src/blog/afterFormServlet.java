package blog;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.google.appengine.api.users.User;

import com.google.appengine.api.users.UserService;

import com.google.appengine.api.users.UserServiceFactory;



import java.io.IOException;

import java.util.Date;



import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;





public class afterFormServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp)

            throws IOException {



        UserService userService = UserServiceFactory.getUserService();

        User user = userService.getCurrentUser();



        String guestbookName = req.getParameter("guestbookName");

        String content = req.getParameter("content");

        String title = req.getParameter("blogTitle");

        Date date = new Date();


        blogMessage greeting = new blogMessage(user,content,guestbookName,title);

        ofy().save().entity(greeting).now();


        resp.sendRedirect("/blog.jsp?guestbookName=" + guestbookName);


    }

}