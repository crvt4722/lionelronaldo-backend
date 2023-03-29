package util;

public class Validate {
    public static boolean controlUserInput(String content) {
        if (content == null || content.equals("") )
            return false;
        return true;
    }
}
