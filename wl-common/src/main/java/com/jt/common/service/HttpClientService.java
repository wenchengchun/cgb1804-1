package com.jt.common.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class HttpClientService {

    private static final Logger LOGGER = LoggerFactory.getLogger(HttpClientService.class);

    @Autowired(required=false)
    private CloseableHttpClient httpClient;

    @Autowired(required=false)
    private RequestConfig requestConfig;

    /**
     * 1.编辑get请求
     * 参数定义：参数定义几个
     * get请求数据如何动态拼接
     * localhost:98091？id=1&name=tom
     */
    public String get(String url,Map<String , String > params,String charset){
    	String result=null;
    	if (StringUtils.isEmpty(charset)) {
			charset="utf-8";
		}
    	/*if (params!=null) {
    		String paramUrl=url+"?";
			for (Map.Entry<String, String> entry : params.entrySet()) {
				paramUrl=paramUrl+entry.getKey()+"="+entry.getValue()+"&";
			}
			paramUrl=paramUrl.substring(0,paramUrl.length()-1);
		}*/
    	try {
			if (params!=null) {
				URIBuilder builder = new URIBuilder(url);
				for (Map.Entry<String, String> entry : params.entrySet()) {
					builder.addParameter(entry.getKey(), entry.getValue());
				}
				//生成get请求的具体路径
				url=builder.build().toString();
			}
			//3.定义请求对象
			HttpGet httpGet = new HttpGet(url);
			httpGet.setConfig(requestConfig);
			//发起请求
			CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
			if (httpResponse.getStatusLine().getStatusCode()==200) {
				result=EntityUtils.toString(httpResponse.getEntity(),charset);
			}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return result;
    }
    //为了满足用户需要添加下列方法
    public String get(String url){
    	return get(url, null, null);
    }
    public String get(String url,Map<String, String> params){
    	return get(url, params, null);
    }
    
    public String  post(String url,Map<String, String > params ,String charset){
    	String result=null;
    	if (charset==null) {
			charset="utf-8";
		}
    	HttpPost httpPost = new HttpPost(url);
    	httpPost.setConfig(requestConfig);
    	
    	if (params!=null) {
    		List<NameValuePair> list=new ArrayList<>(); 
    		for (Map.Entry<String, String> entry : params.entrySet()) {
    			NameValuePair valuePair=new BasicNameValuePair(entry.getKey(), entry.getValue());
    			list.add(valuePair);
    		}
    		try {
    			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list, charset);
    			httpPost.setEntity(entity);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
		}
    	try {
			CloseableHttpResponse httpResponse = httpClient.execute(httpPost);
			if (httpResponse.getStatusLine().getStatusCode()==200) {
				result = EntityUtils.toString(httpResponse.getEntity(), charset);
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(); 
		}
    	return result;
    }
    public String  post(String url){
    	return post(url, null, null);
    }
    public String  post(String url,Map<String, String > params ){
    	return post(url, params,null);
    }
}
