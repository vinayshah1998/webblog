package blog;

import java.util.Date;

import com.google.appengine.api.users.User;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;


@Entity
public class blogMessage implements Comparable<blogMessage> {
    @Parent Key<messageContainer> guestbookName;
    @Id Long id;
    @Index User user;
    @Index String blogTitle;
    @Index String content;
    @Index Date date;
    private blogMessage() {}
    public blogMessage(User user, String content, String guestbookName,String blogTitle) {
        this.user = user;
        this.content = content;
        this.blogTitle = blogTitle;
        this.guestbookName = Key.create(messageContainer.class, guestbookName);
        date = new Date();
    }
    public User getUser() {
        return user;
    }
    public String getContent() {
        return content;
    }
    public String getBlogTitle() {
        return blogTitle;
    }
    public String getDate() {
        return date.toString();
    }

    @Override
    public int compareTo(blogMessage other) {
        if (date.after(other.date)) {
            return 1;
        } else if (date.before(other.date)) {
            return -1;
        }
        return 0;
    }
}