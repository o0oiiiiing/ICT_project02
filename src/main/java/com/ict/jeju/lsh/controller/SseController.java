package com.ict.jeju.lsh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;


@Controller
public class SseController {
	
	@GetMapping("notification.do")
	public ModelAndView Notification() {
		return new ModelAndView("lsh_view/notification");
	}
	
	private List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	@RequestMapping("see.do")
	public SseEmitter streamEvents() {
		SseEmitter emitter = new SseEmitter();
		emitters.add(emitter);
		emitter.onCompletion(() -> emitters.remove(emitter));
		emitter.onTimeout(() -> emitters.remove(emitter));
		return emitter;
	}
	
	@PostMapping("send_event.do")
	@ResponseBody
	public void sendEvent() {
		String message = "answer has been posted to your QnA. please check your QnA";
		for (SseEmitter k : new ArrayList<>(emitters)) {
			try {
				k.send(SseEmitter.event().data(message));
			} catch (Exception e) {
				k.completeWithError(e);
				emitters.remove(k);
			}
		}
	}
	
}


