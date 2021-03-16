package vn.com.dutmobile.utils;

public class UtilsPath {
    static final String URL = "http://localhost:8080/ProjectWeb_1920/";
    static final String URLADMIN ="http://localhost:8080/ProjectWeb_1920/Admin/";

    public static String getPath(String path) {
        return URL + path;
    }
    public static String getPathAdmin(String path) {
        return URLADMIN + path;
    }
}
