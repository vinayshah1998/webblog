package blog;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class messageContainer {
    @Id long id;
    String name;

    public messageContainer(String name) {
        this.name = name;
    }
}