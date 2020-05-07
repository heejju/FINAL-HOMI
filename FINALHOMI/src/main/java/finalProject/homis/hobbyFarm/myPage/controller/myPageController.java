
package finalProject.homis.hobbyFarm.myPage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import finalProject.homis.hobbyFarm.common.model.vo.PageInfo;
import finalProject.homis.hobbyFarm.friends.model.service.FriendService;
import finalProject.homis.hobbyFarm.groupFarm.model.vo.GroupFarmBoard;
import finalProject.homis.hobbyFarm.lecture.model.exception.LectureBoardException;
import finalProject.homis.hobbyFarm.lecture.model.service.LectureBoardService;
import finalProject.homis.hobbyFarm.lecture.model.vo.LectureBoard;
import finalProject.homis.hobbyFarm.lecture.model.vo.Pagination;
import finalProject.homis.hobbyFarm.lecture.model.vo.Search;
import finalProject.homis.hobbyFarm.member.model.service.MemberService;
import finalProject.homis.hobbyFarm.member.model.vo.Member;
import finalProject.homis.hobbyFarm.message.model.service.MessageService;
import finalProject.homis.hobbyFarm.myPage.model.exception.myPageException;
import finalProject.homis.hobbyFarm.myPage.model.service.myPageService;
import finalProject.homis.hobbyFarm.myPage.model.vo.myPageCount;

@SessionAttributes("loginUser")
@Controller
public class myPageController {
	@Autowired
	private MemberService mService;
	@Autowired
	private LectureBoardService lbService;
	@Autowired
	private myPageService mpService;
	@Autowired
	private MessageService msgService;
	@Autowired
	private FriendService fService;
	
	/* 강사 페이지 */
	@RequestMapping("teacherPage.mp")
	public ModelAndView teacherPage(String msg, ModelAndView mv, HttpSession session, HttpServletRequest request) {
		// 가져와야 할 것
				/*
					1. 운영중인 텃밭 수
					2. 참여중인 모임 수 GFAPP_VIEW 에서 where user_id = #{id}로 찾아와서 count 하기
					3. 기간 끝난 텃밭, 모임 수 GFVIEW 에서 ENDDATE가 있는데 거기서 오늘날짜랑 비교해서 넣기
					
					5. 내 일일 시간표(페이징)
						* 뷰를 어떻게 짜지!
						* 강사 로그인 아이디, 날짜로 우선 뽑고
						* 시간에 따라 칸을 먼저 나누고
						* 각 칸(시간)에 정보 집어넣기?
				*/
		if(msg != null) {
			msg = "VIP 업그레이드 완료!";
		} else {
			msg = null;
		}
		mv.addObject("msg", msg);
		
		myPageCount mpc = new myPageCount();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String nick = loginUser.getNickName(); // 로그인 닉네임(강사 닉네임)
		String id = loginUser.getUserId(); // 로그인 아이디
		
		int runningFarm = mpService.getRunningFarm(nick); // 1. 운영중인 텃밭 수
		mpc.setMyLectureCount(runningFarm);
		int runningGroup = mpService.getRunningGroup(id); // 2. 참여중인 모임 수
		mpc.setMyFarmCount(runningGroup);
//		int finished = mpService.getFinished(id); // 3. 기간 끝난 텃밭 + 모임 수
		mv.addObject("loginUser", loginUser);
		mv.addObject("mpc", mpc);
		mv.setViewName("teacherPage");
		return mv;
	}
	@RequestMapping("lectureList.mp") // 내 강의 리스트 frame
	public ModelAndView lecturePage(ModelAndView mv, HttpSession session, HttpServletRequest request) {
		String id = ((Member)session.getAttribute("loginUser")).getNickName(); // 로그인 닉네임(강사 닉네임)
		
		Search search = new Search("", "writer", id, 0);
		System.out.println(search);
		int listCount = lbService.selectLBCount(search);
		
		int currentPage = 1;
		System.out.println("page = "+request.getParameter("page"));
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		System.out.println("currentPage = "+currentPage);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		mv.addObject("pi",pi);
		
		ArrayList<LectureBoard> lbList = lbService.selectLBPage(pi,search);
		if(lbList != null) {
			mv.addObject("lbList", lbList);
		} else {
			throw new LectureBoardException("lbList 가져오기 실패");
		}
		mv.setViewName("lectureListFrame");
		return mv;
	}
	/* 강사 페이지 끝 */
	
	/* 학생 페이지 */
	@RequestMapping("studentPage.mp")
	public ModelAndView studentPage(ModelAndView mv, HttpSession session, HttpServletRequest request) {
		myPageCount mpc = new myPageCount();
		String nick = ((Member)session.getAttribute("loginUser")).getNickName(); // 로그인 닉네임(학생 닉네임)
		String id = ((Member)session.getAttribute("loginUser")).getUserId(); // 로그인 아이디
		
		int runningGroup = mpService.getRunningGroup(id); // 1. 참여중인 모임 수
		mpc.setMyFarmCount(runningGroup);
		int runningLecture = mpService.getRunningLecture(id); // 2. 참여중인 강의 수
		mpc.setStLectureCount(runningLecture);
		int finished = mpService.getFinished(id); // 3. 기간 끝난 텃밭 + 모임 수
		mpc.setFinishedLectureCount(finished);
		mv.addObject("mpc", mpc);
		mv.setViewName("studentPage");
		return mv;
	}
	@RequestMapping("myFarm.mp")
	public ModelAndView myFarm(ModelAndView mv, HttpSession session) {
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<GroupFarmBoard> gfList = mpService.myFarm(id);
		if(gfList != null) {
			mv.addObject("gfList", gfList);
			mv.setViewName("myFarmList");
		} else {
			throw new myPageException("gfList 가져오기 실패");
		}
		
		return mv;
	}
	@RequestMapping("myLectureSt.mp")
	public ModelAndView myLectureSt(ModelAndView mv, HttpSession session) {
		// 학생 아이디를 보내서 학생이 속하고있는 강의 리스트 가져오기
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<LectureBoard> lbList = mpService.myLectureSt(id);
		if(lbList != null) {
			mv.addObject("lbList", lbList);
			mv.setViewName("myLectureList");
		} else {
			throw new myPageException("lbList 가져오기 실패");
		}
		return mv;
	}
	@RequestMapping("myFinishedLectureSt.mp")
	public ModelAndView myFinishedLectureList(ModelAndView mv, HttpSession session) {
		// 학생 아이디를 보내서 학생이 끝낸 강의 리스트 가져오기
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		
		ArrayList<LectureBoard> lbList = mpService.myFinishedLectureList(id);
		if(lbList != null) {
			mv.addObject("lbList", lbList);
			mv.setViewName("myFinishedLectureList");
		} else {
			throw new myPageException("lbList 가져오기 실패");
		}
		return mv;
	}
	/* 학생 페이지 끝 */
	
	/* 결제 관련 */
	@RequestMapping("payView.mp")
	public String payView() {
		return "upgradeGradeForm";
	}
	@RequestMapping("upgradeVip.mp")
	public void upgradeVip(HttpSession session, Model model, SessionStatus status) {
		String id = ((Member)session.getAttribute("loginUser")).getUserId(); // 로그인 아이디
		int result = mpService.upgradeVip(id);
		if(result > 0) {
		} else {
			throw new myPageException("회원 업그레이드 실패");
		}
	}
	@RequestMapping("goUp.mp")
	public String goUp(HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getUserId(); // 로그인 아이디
		Member m = new Member() ;
		m.setUserId(id);
		Member loginUser = mService.memberLogin(m);
		System.out.println(loginUser);
		model.addAttribute("loginUser", loginUser);
		
		return "redirect:teacherPage.mp";
	}
	/* 결제 관련 끝 */
}
