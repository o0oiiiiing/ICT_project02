package com.ict.jeju.wyy.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxController4 {
	
	@RequestMapping(value = "myTripMap", produces="application/json; charset=utf-8")
    @ResponseBody
    public String myTripMap() {
        StringBuffer sb = new StringBuffer();
        BufferedReader br = null;
        try {
        	// 카테코리 c1~c4 지정하는 방법 아직 모르겠음..
            URL url = new URL("https://api.visitjeju.net/vsjApi/contents/searchList?apiKey=2aa87f00298241e49e9873566c735875&locale=kr&category=c1");
            URLConnection conn = url.openConnection();
            br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
            String msg = null;
            while((msg=br.readLine()) != null) {
                sb.append(msg);
            }
            return sb.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
	
	
	
}
