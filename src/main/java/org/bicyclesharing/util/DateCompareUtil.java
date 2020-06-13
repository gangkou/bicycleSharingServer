package org.bicyclesharing.util;

import java.util.Date;

/**
 * @author 小米饭
 * @date 2020/6/13
 **/
public class DateCompareUtil {
    /**
     * 返回两个日期相差的天数
     * @param date1
     * @param date2
     * @return
     */
    public static int differentDaysByMillisecond(Date date1, Date date2) {
        int days = (int) ((date2.getTime() - date1.getTime()) / (1000 * 3600 * 24));
        return days;
    }
}
