package vn.com.dutmobile.model;

public class ContactModel {
    private String name;
    private String email;
    private String topic;
    private String question;

    public ContactModel() {
    }

    public ContactModel(String name, String email, String topic, String question) {
        this.name = name;
        this.email = email;
        this.topic = topic;
        this.question = question;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
