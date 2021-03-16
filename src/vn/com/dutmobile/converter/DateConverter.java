package vn.com.dutmobile.converter;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateConverter {
    //Convert String to Date
    public Date convertStringToDate(String ctsDate) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        java.util.Date d = null;
        try {
            d = dateFormat.parse(ctsDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return new Date(d.getTime());
    }
}
