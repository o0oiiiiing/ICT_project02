package com.ict.jeju.wyy.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:props/config.properties")
public class OpenAIConfig {
	    
	    @Value("${openai.api.key}")
	    private String openaiApiKey;
	    
	    public String getOpenaiApiKey() {
	        return openaiApiKey;
	    }
}
