package blog;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.http.*;

import com.google.appengine.api.users.User;

import com.google.appengine.api.users.UserService;

import com.google.appengine.api.users.UserServiceFactory;

import blog.blogMessage;



public class formServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(formServlet.class.getName());



    public void doGet(HttpServletRequest req, HttpServletResponse resp)

            throws IOException {

        UserService userService = UserServiceFactory.getUserService();

        User user = userService.getCurrentUser();




        resp.sendRedirect("/blogform.jsp");

    }

}