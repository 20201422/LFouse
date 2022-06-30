package com.alipay.config;

public class AlipayConfig {
    // 商户appid
    public static String APPID = "2021000121610771";
    // 私钥 pkcs8格式的
    public static String RSA_PRIVATE_KEY = "MIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQCk7KQ2LhIxX/kpqZQV7RfjDA/qSMRKOnSJbrKXpiWPWMa9bfuIauQvQR83Msv8Sfnf+8CVEY1STQi2a2UTlHN3HaYWj6xFYJUfQgz0zUqZ8cnBIbIDriBEPDQgW4opwvYYiGNP+JP0YtlHdsRRb+kXCRmf+ak1yPTJO7xy1ncfunWQpI9b4Q4LezfJWepmXW+mVuoWJ8/QsfNksy2gkKnvwG2Ja5lo9Tyq7nS8vm2Gq/r8c3Yre3ZBNePqvr/iZyKnD8xOu76FEROASRPgd5Krm++YQWPlAlbYxmsC2A2mJuRys0jyHsu7RBJ5upFZtmjJ9OAuiph3HOAi8N7h7pxBAgMBAAECggEAfzZFJ8F7qPglYbx7DDqYXTp1oDpGphbWwxdOzGiMujg4++60wTHqFoT9xf75lv2crucqUhF614ux97t4+JReR/fnn6lssQrhm33ALqeXLo1xGPabr/kEzH0/m+Hf/XxzhNLW/912imAgxt3WahaPTYRobpwNp/38yqe4IUBKHH7bW7pxGmBJjehPAdn25dNrYmNMlgbO2x9InK8A2C/5PqxYqHuYAb9gCvcRiXRLfajEMWqPxnBV3aio7JRsktP18JX3rBpvabBI5EsKeKTBhndBTlkl9jgSykRXefpG0gVIDeOiSeb3n0Smq40+mXg+VE7Px9SHCVEiXO5aliJaQQKBgQD+khLIvc1dKnqLYbV7q7EV4m6H9iEaRdvbyBIxyWzEKSbIHtOuIStMoEBSIutEe8jvk6VxEuqKPsdzuBD4gbhTgVzCuwegmlTtGeq5HYMzmcC6wUqm+NZummMh1YejgpdRKQ0pluoGM/D1ngJHhdbS+AR8lT/686RrdCFh0VumyQKBgQCl2bVMBPWGHarTYMkZO0L5Tv4JtSzAgGiOGp4mcxU0Qy5vfmSljg10XL6xSXOvdOEPZihNqSiK0+I8+4nC8foVogvH8IoxX3igTVyndyR4X9iQZbIfJVDQo0Vc4p5X6pvBHNpHF5+JjVwbZ2FvzOaZpAgJ0+HzAMNKfiPVyXPtuQKBgQDryCeVvhYjoGB4EDujG9acymhNjW4Dg4iq+5e+fS08UlEVMVgmA5qzEgoBCU6W03+8RigJnteUy6i4SVeOk7dBwKNFySy7V7YpFMQOSINom5OiZbzbAca6EkyW3csParjz9u22A40lyZ34IC1ESXY7WHPvX90uddNnotv4WYxl4QJ/D4xZcscEPY6KdUadk7/6h2TgbAiQKXvgUXItYW1oj3283Lb8uIiYuk/3kKdSMSDD+K2bGazCIEG88/qg76W/zEdk01m5mudYZ67ZANoqkR5rLx5ZlJHrAaRM3Ghib9uOvov16rRMQJkACZGnkNOkysKV/lXe2Ok5ZcJtmZ1JQQKBgDn/Fl5H91Q6W0qq25oPkxP+3nL0ajFFwUpa0U/uLI+StkYWd7AijRAfnrdOkCnG3FbZO7/2ABAFuNQtBQIR+tnahFpIwZ7+AGCpusSnnrym4MyWqIpW32+2+nWAZllHXCYKc6j/vCRLjP7S0YtH6FoQD9TC+FY2wSLUsrdGetMu";
    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://商户网关地址/alipay.trade.wap.pay-JAVA-UTF-8/notify_url.jsp";
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://localhost:8080/LFouse/Kp_PlaceOrderServlet";
    // 请求网关地址
    public static String URL = "https://openapi.alipaydev.com/gateway.do";
    // 编码
    public static String CHARSET = "UTF-8";
    // 返回格式
    public static String FORMAT = "json";
    // 支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5fypmEPyNaFkJF/H71m5nfMRK753JrC7mUV7y6I2rBjy5qtxfSCXsTZG7TmY0fU/2webAo0nWh1zpYT2ZmCajkH3TjQGpT10xqR1r+hTgCOfkSGb5PBm5S+cHAZ6QY9Eo5GymCG5LnVz8Vwat4CEi6LMFP+KBADHAUFmS71GJ/UsrkmB9UkzwZ9iMnJu0VXKQBDR0e2e6fVqhUM26eSvzhtJ21FFvGa4UMZ1rDCw9XBxIK7Tyh0cdO1HzqmHyo8jhxpybsV6OnXe4M61VvQOT8HUDjkx/ngi79wLBMi9Dxl/bgBe93s+4TwVNmcHj0mbqYZsKt0VQEsfzCKyUlQT8QIDAQAB";
    // 日志记录目录
    public static String log_path = "/log";
    // RSA2
    public static String SIGNTYPE = "RSA2";
}
