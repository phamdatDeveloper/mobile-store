package vn.com.dutmobile.utils;

import java.text.NumberFormat;
import java.util.Locale;

public class PriceProcess {
    public static String price(double number){
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        String str1 = en.format(number);
        return  str1;
    }
}
