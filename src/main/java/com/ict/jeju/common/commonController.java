package com.ict.jeju.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class commonController {
		// 개인정보 취급방침
		@RequestMapping("privacyPolicy")
		public ModelAndView privacyPolicy() {
			return new ModelAndView("common/privacy_policy");
		}
		// 이용약관
		@RequestMapping("stipulation")
		public ModelAndView stipulation() {
			return new ModelAndView("common/stipulation");
		}
}
