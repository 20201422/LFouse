package com.alipay.config;

public class AlipayConfig {
    // 商户appid
    public static String APPID = "2021000121609904";
    // 私钥 pkcs8格式的
    public static String RSA_PRIVATE_KEY = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCpynuTBklPvEjnIeo3DCNKsi" +
            "u1e5PYB1EBhTz/5QyXY7827f2JmvHhWliMLOz3w1AEYDJS0NE6p/7yCwTi+Jvfq1uStbzZCF94G9w5amr6cW9GJT5mTpjWWTGDfEZDL1B" +
            "elpK8Bw8H4X0fQvJVTdDif7wKtpbC9Lpy9mWnFl7JVIiKayFCxSwFLUHAL3qbNZSEaoa86YuWynvbyjRNVW0+qxmFVErIJrsCzoXlqJu5u" +
            "JosaWnQb1ZTECAirYRTadQVQrhfkdyG/Sc7cpMixiwWgP9euR8NqNreaJkEZksRmSPaVaRL3ad3IbysdX8yfbV1Tip6sWoh5zdoS/hGsd0" +
            "LAgMBAAECggEAYdPIX22/z7EsT/+6cv0LWH5PsMEC7fVJNxcNjmLqXk+aXIvDCQW9V5o2ao13+0kNUXgbhpvJ8YHZ4pt2tU+If9a7bExKA" +
            "sJQP2PN/0bRXHr/IetTiJ7AcL/zR07TLOKV6+nVoYBvqJrC/MAV4BB1ygrOzV1mf+2Bf7t31k2NT3HzkT+/JLl8RewRS4IiWnzfbc9Ae4w" +
            "DCy2WLUKuEl2QkMlukZ87LJCF7VRil5ITK4rJsP7JjsvQrzlHi/yr7gd7PhhtyZACnGqedNDO3bw+DuwjjqwfgA+8KlYH55Ft1uYhMRZQ5G" +
            "2qCK4h9KynvLM3R99fNN8z89UDsvvLIRNIAQKBgQDoVirker1XjlepH7lLWcfHmBjMoYhhwFgO+l1/sZ83W7mFx4pTsMoSaYlIJfXQ4RoKx" +
            "ZOTTDBhVezmPy/K3OZvg1okzsocMk7zyjiUHEdrOvqc1Zfa71/UQBXEqGrX1WUFY7Tq+WjXakQkrVUfqDqYW6uiwxYUUVTgjGVV6FBK+QKB" +
            "gQC7FYe4MfOlm3E1Ujpt+g7RaBkBoIBp5bzUZnZ/9sBjIa7C2lUo6NsDu167txjnENKzcaASTW4J2X2KH8Y9gy6AvEwTVcj4b7Wcqp1VfU" +
            "7WCve5WbqNlNpoSSf3hXb3TP2AXfQE2yTgmpYlNiHqioNpf+GdRl6/H3r3WN34FbbFIwKBgFttvUdYPbZ832ZAg6xxUjrrUacFUiQVixG" +
            "p2K1tephQUjuhAIBaq8p/GXT46zkdvB/NDHwEmW1UYPtili4gq9XqPMkLT2G1MnihdY5jan96IDEjpLSVSoK+DVLsa88vvKdYS1PEfkt3G" +
            "AXO6BajHxvhxzMvzjqEnwAWf7JEz4QRAoGBAKaM/E5W6fm88IPvuGTAAQEcE2cHZEriY8ETlttE6PFXwyVlCftpkdE4tZWX42uR5oIp3b9" +
            "tf1D1dnXI48tPRc8F0xRDgq7phFz85yR8cfrLuM4hu5rfsbC1sAcDom129ReajOrlzWbHOHPYRUlwFp2NY2WIiEDN3cLmMnXxnszRAoGBA" +
            "ILNZsTlCIjWqREN85t8PkU2mvQh89polYCz/8AavZjqwC0J6tSo1YVj4jAMrrRZCIdxrmlQYCu2pyMD7tpzkAieJgXMHVcs67gm4tLCm5WP" +
            "WQeCMJc+uqKJUjpf1rmHpkh1TIpzl/RxprY0fzJwGdL3RP2khVx9OQZEN9dGDHpo";
    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://商户网关地址/alipay.trade.wap.pay-JAVA-UTF-8/LT_notify_url.jsp";
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://localhost:8090/LFouse/Kp_PlaceOrderServlet";
    // 请求网关地址
    public static String URL = "https://openapi.alipaydev.com/gateway.do";
    // 编码
    public static String CHARSET = "UTF-8";
    // 返回格式
    public static String FORMAT = "json";
    // 支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArXkjIbbL0n4M3YNOzCuEv0vpvS+" +
            "imy2MwZCDFJAC4+wztw1tHwinoKG1Gihdjuc1dYNk9ZMXS2Ebx79FjFKLbkd4I+LvIRPG7u+fxbA5/dBZtyzLCPKhMw1lr1VYWb0dMmq7" +
            "pb53Q9rb9nACmaDiyA1qPU7ooJ/2rn4nuttwFH1xwenSJh4A1ak8fyl5gyx9SV+lzO3whPd/JZ20JekCZSBJZwcaQbLjaMAD+ubvT5Nv5" +
            "rUxFeqbIWCaPQ5m1Tanvalj+W7ZUTvph2RyvSwOj9fVt0T/NgKvlLaLRapZj0OJVhSN42gGCHyvgO4nSsdM9jronk0Q5lCLm7SGJI5Kp" +
            "QIDAQAB";
    // 日志记录目录
    public static String log_path = "/log";
    // RSA2
    public static String SIGNTYPE = "RSA2";
}
