package vn.com.dutmobile.model;

import java.sql.Date;

public class NewsModel {
    private Integer id;
    private String title;
    private String type;
    private String description;
    private String content;
    private String img;
    private String author;
    private Date timerelease;
    private int popular;
    private int active;

    public NewsModel() {
    }

    public NewsModel(Integer id, String title, String type, String description, String content, String img, String author, Date timerelease, int popular, int active) {
        this.id = id;
        this.title = title;
        this.type = type;
        this.description = description;
        this.content = content;
        this.img = img;
        this.author = author;
        this.timerelease = timerelease;
        this.popular = popular;
        this.active = active;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getTimerelease() {
        return timerelease;
    }

    public void setTimerelease(Date timerelease) {
        this.timerelease = timerelease;
    }

    public int getPopular() {
        return popular;
    }

    public void setPopular(int popular) {
        this.popular = popular;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }
}
