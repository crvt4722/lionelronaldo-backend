/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author User
 */
public class MoneyUtil {
    public static String reverse(String s){
        String res = "";
        for (int i = s.length() - 1; i >= 0; i--) {
            res += s.charAt(i);
        }
        return res;
    }
    public static String toString(int n) {
        String s = "" + n;
        String res = "";
        int cnt = 0;
        for (int i = s.length() - 1; i >= 0; i--) {
            cnt++;
            res += s.charAt(i);
            if (cnt % 3 == 0 && i != 0) {
                res += '.';
            }
        }
        
        return reverse(res);

    }
    public static String toString(String s){
        String[] arr = s.split(".");
        String res = "";
        for(String x : arr){
            res += x;
        }
        if(res.length() > 0)
            return toString(Integer.parseInt(res));
        return toString(Integer.parseInt(s));
    }
//    public static String toString(Object o){
//        String[] arr = o.toString().split(".");
//        String res = "";
//        for(String x : arr){
//            res += x;
//        }
//        return toString(Integer.parseInt(res));
//    }
}
