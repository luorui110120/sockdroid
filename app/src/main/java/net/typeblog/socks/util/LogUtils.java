package net.typeblog.socks.util;

import android.util.Log;

public class LogUtils
{
    private static boolean bFlags = true;
    private  static String TAG="mlog";
    public static void d(String tag, String content){
        if(bFlags)
        {
            Log.d(tag, content);
        }
    }
    public static void d(String content){
        d(TAG,content);
    }
    public static void e(String tag, String content){
        if(bFlags)
        {
            Log.e(tag, content);
        }
    }
    public static void e(String content){
        e(TAG,content);
    }
}
