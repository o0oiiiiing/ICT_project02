	package com.ict.jeju.wyy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.jeju.common.MyTripPaging;
import com.ict.jeju.common.Paging;
import com.ict.jeju.wyy.dao.CalendarVO4;
import com.ict.jeju.wyy.dao.LikeVO;
import com.ict.jeju.wyy.dao.UserVO4;
import com.ict.jeju.wyy.service.CalendarService4;

@Controller
public class JejuController4 {
	
	@Autowired
	private CalendarService4 calendarService4;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MyTripPaging paging;
	
	@Autowired
    private OpenAIConfig openAIConfig;
	
	@RequestMapping("wyyhome")
	public ModelAndView wyyHome(@RequestParam("u_name") String u_name,@RequestParam("u_idx") String u_idx, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView("wyy-view/index");
	    session.setAttribute("u_idx", u_idx);
	    session.setAttribute("u_name", u_name);
	    return mv;
	}
	
	// 나의여행일정 추가한 리스트 / 좋아요한 리스트
	@RequestMapping("myTripPlan")
	public ModelAndView myTripPlan(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("wyy-view/myTripPlan");
		
		// 페이징기법
				// 전체 게시물의 수를 구한다.
				int count = calendarService4.getTotalCount();
				paging.setTotalRecord(count);
				
				// 전체 페이지의 수를 구하자.
				if(paging.getTotalRecord() <= paging.getNumPerPage()) {
					paging.setTotalPage(1);
				}else {
					paging.setTotalPage(paging.getTotalRecord()/ paging.getNumPerPage());
					if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
						paging.setTotalPage(paging.getTotalPage() + 1 );
					}
				}
					
				// 현재 페이지 구하기 => begin, end 구한다
				String cPage = request.getParameter("cPage");
				
				// 맨 처음에 오면 cPage 없으므로 null 이다. 
				// 맨 처음 오면 무조건 1 페이지 이다.
				if(cPage == null) {
					paging.setNowPage(1);
				}else {
					paging.setNowPage(Integer.parseInt(cPage));
				}
				// 오라클 begin, end 
				// 마리아DB limit, offset
				// offset = limit * (현재페이지 -1)
				// limit = numPerPage 
				paging.setOffset(paging.getNumPerPage() * (paging.getNowPage()-1));
				
			
				// 시작블록과 끝블록 구하기 
				paging.setBeginBlock(
				   (int)(((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock()+1));
				paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
			
				// 주의 사항
				// endBlock 과 totalPage가 endBlock이 크면 endBlock를 totalPage로 지정한다.
				if(paging.getEndBlock() >  paging.getTotalPage()) {
					paging.setEndBlock(paging.getTotalPage());
				}
				  String u_idx = (String) session.getAttribute("u_idx");
				  String u_name = (String) session.getAttribute("u_name");
		List<LikeVO> like_list = calendarService4.myTripLike(paging.getOffset(), paging.getNumPerPage(),u_idx);
		List<UserVO4> u_list = calendarService4.myTripUser(u_idx);
		if (like_list != null && u_list != null) {
			mv.addObject("u_idx", u_idx);
			mv.addObject("u_name", u_name);
			mv.addObject("like_list", like_list);
			mv.addObject("u_list", u_list);
			mv.addObject("paging", paging);
			return mv;
		}
		return null;
	}
	
	// 캘린더 일정 추가하기
	@RequestMapping("calSave")
	public ModelAndView saveCal(CalendarVO4 cvo4, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    String u_idx = (String) session.getAttribute("u_idx");
	    String u_name = (String) session.getAttribute("u_name");
	    System.out.println(u_idx);
	    if (u_idx != null) {
	         int result = calendarService4.saveCal(cvo4,u_idx);
	         System.out.println(result);
	         if (result > 0) {
	        	 return new ModelAndView("redirect:myTripPlan");
	         }
	         return new ModelAndView("wyy-view/error");
	    	}
		return null;
	}
	
	@RequestMapping("calendar")
	public ModelAndView getPlanner() {
		return new ModelAndView("wyy-view/calendar");
	}
	@RequestMapping("chatbot")
    public ModelAndView chatbot() {
        ModelAndView mv = new ModelAndView("wyy-view/chatbot");
        mv.addObject("apiKey", openAIConfig.getOpenaiApiKey());
        System.out.println(mv);
        return mv;
    }
	
	@RequestMapping("calendar_add")
	public ModelAndView calendar_add(@RequestParam("contentsid") String contentsid) {
		return new ModelAndView("wyy-view/calendar_add");
	}
}