package com.oracle.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

/**
 * 发送短信基础类
 * 
 * @author administration
 * 
 */
// 为了你的测试方便收到短信！请短信内容编辑为：你的验证码为：123456【中正云通信】
public class SmsBase {
	private String x_id = "llgongda";
	private String x_pwd = "llgongda";

	public String SendSms(String mobile, String content)
			throws UnsupportedEncodingException {
		// Integer x_ac = 10;// 发送信息
		HttpURLConnection httpconn = null;
		String result = "Error";
		StringBuilder sb = new StringBuilder();
		sb.append("http://service.winic.org:8009/sys_port/gateway/index.asp?");

		// 以下是参数
		// 为了你的测试方便收到短信！请短信内容编辑为：你的验证码为：123456【中正云通信】
		sb.append("id=").append(URLEncoder.encode(x_id, "gb2312"));
		sb.append("&pwd=").append(x_pwd);
		sb.append("&to=").append(mobile);
		sb.append("&content=").append(URLEncoder.encode(content, "gb2312"));
		sb.append("&time=").append("");
		try {
			URL url = new URL(sb.toString());
			httpconn = (HttpURLConnection) url.openConnection();
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					httpconn.getInputStream()));
			result = rd.readLine();
			rd.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (httpconn != null) {
				httpconn.disconnect();
				httpconn = null;
			}

		}
		return result;
	}

	public static void main(String[] args) {
		SmsBase s = new SmsBase();
		try {
			System.out.println(s.SendSms("18502999188", "123456【中正云通信】"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
