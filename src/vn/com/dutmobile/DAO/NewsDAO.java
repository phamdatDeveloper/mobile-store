package vn.com.dutmobile.DAO;

import vn.com.dutmobile.model.NewsModel;

import java.util.ArrayList;

public interface NewsDAO {
    ArrayList<NewsModel> getNews();

    ArrayList<NewsModel> getAllNews(int a, int b);

    int getCountNews();

    ArrayList<NewsModel> getAllPopularNews();

    NewsModel getDetails(int id);

    NewsModel getNewsById(Integer id);

    ArrayList<NewsModel> findNews(String name, int a, int b);

    void updateNews(NewsModel newsModel);

    void deleteNews(Integer id);

    void insertNews(NewsModel newsModel);
}
