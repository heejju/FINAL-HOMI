package finalProject.homis.hobbyFarm.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import finalProject.homis.hobbyFarm.common.model.vo.Hobby;
import finalProject.homis.hobbyFarm.common.model.vo.Image;
import finalProject.homis.hobbyFarm.common.model.vo.PageInfo;
import finalProject.homis.hobbyFarm.common.model.vo.Reply;
import finalProject.homis.hobbyFarm.lecture.model.vo.Search;
import finalProject.homis.hobbyFarm.lecture.model.vo.Timeline;
import finalProject.homis.hobbyFarm.lecture.model.exception.LectureBoardException;
import finalProject.homis.hobbyFarm.lecture.model.service.LectureBoardService;
import finalProject.homis.hobbyFarm.lecture.model.vo.Conclusion;
import finalProject.homis.hobbyFarm.lecture.model.vo.LectureBoard;
import finalProject.homis.hobbyFarm.lecture.model.vo.Pagination;
import finalProject.homis.hobbyFarm.member.model.vo.Member;
import oracle.sql.TIMESTAMPLTZ;

@Controller
public class LectureController implements Comparator<ArrayList<String>>{
	
	
	@Autowired
	private LectureBoardService lbService;
	
	@Override
	public int compare(ArrayList<String> o1, ArrayList<String> o2) {
		if(o1.get(0) == o2.get(0)) {
			return o1.get(1).compareTo(o2.get(1));
		} else {
			return o1.get(0).compareTo(o2.get(0));
		}
	}
	
	
	
	@RequestMapping("insertLecture.lec")
	public String insertLec(@ModelAttribute LectureBoard lb,HttpServletRequest request, @RequestParam("thumbnailImg") MultipartFile thumbnail, @ModelAttribute Member loginUser,
						  @RequestParam("allDate") ArrayList<String> allDate) {
		
		ArrayList<String> sidoArr = new ArrayList<String>();
		for(int i = 0; i < 10 ;i++) {
			if(!request.getParameter("sido"+i).equals("")) {
				sidoArr.add(request.getParameter("sido"+i));
				System.out.println("sidoArr.get("+i+") = "+sidoArr.get(i));
			} else {
				break;
			}
		}
		
		ArrayList<String> gugunArr = new ArrayList<String>();
		for(int i = 0; i < 10 ;i++) {
			if(!request.getParameter("gugun"+i).equals("")) {
				gugunArr.add(request.getParameter("gugun"+i));
				System.out.println("gugunArr.get("+i+") = "+gugunArr.get(i));
			} else {
				break;
			}
		}
		
		ArrayList<String[]> dongArr = new ArrayList<String[]>();
		for(int i = 0; i < 10 ; i++) {
			if(request.getParameterValues("dong"+i) != null) {
				dongArr.add(request.getParameterValues("dong"+i));
				for(int j = 0; j < dongArr.get(i).length; j++) {
					System.out.println("dongArr.get("+i+")["+j+"] = "+dongArr.get(i)[j]);
				}
			} else {
				break;
			}
		}
		
		ArrayList<ArrayList<String>> APList = new ArrayList<>();
		for(int i = 0; i < sidoArr.size(); i++) {
			ArrayList<String> nowArr = new ArrayList<>();
			nowArr.add(sidoArr.get(i));
			nowArr.add(gugunArr.get(i));
			for(int j = 0; j < dongArr.get(i).length; j++) {
				nowArr.add(dongArr.get(i)[j]);
			}
			APList.add(nowArr);
		}
		
		String ablePlace = "";
		System.out.println("dongArr.size() = "+dongArr.size());
		for(int i = 1; i < APList.size(); i++) {
			Collections.sort(APList, new Comparator<ArrayList<String>>() {
				@Override
				public int compare(ArrayList<String> o1, ArrayList<String> o2) {
					if(o1.get(0).equals(o2.get(0))) {
						System.out.println("첫번쨰꺼 같다");
						return o1.get(1).compareTo(o2.get(1));
					} else {
						System.out.println("첫번쨰꺼 다르다");
						return o1.get(0).compareTo(o2.get(0));
					}
				}
			});
		}
		
		
		for(int i = 0; i < APList.size(); i++) {
			for(int j = 0; j < APList.get(i).size(); j++) {
				if(i != 0 && j == 0) {
					ablePlace += "/"+APList.get(i).get(j)+",";
				} else if(j == ( APList.get(i).size()-1 )){
					ablePlace += APList.get(i).get(j);
				} else {
					ablePlace += APList.get(i).get(j)+",";
				}
			}
		}
		System.out.println("ablePlace = "+ablePlace);
		
		String ableTime = "";
		ArrayList<ArrayList<String>> time = new ArrayList<ArrayList<String>>();
		int j = -1;
		int k = 0;
		for(int i = 0; i < allDate.size(); i++) {
			if(allDate.get(i).length() > 2) {
				j++;
				k = 0;
				time.add(new ArrayList<String>());
				time.get(j).add(allDate.get(i));
				k++;
			} else {
				time.get(j).add(allDate.get(i));
				k++;
			}
		}
		
		for(int i = 0; i < time.size(); i++) {
			for(int l = 0; l < time.get(i).size(); l++) {
				if(i==0 && l==0) {
					ableTime += time.get(i).get(l)+",";
				} else if(l==0){
					ableTime += "::"+time.get(i).get(l)+",";
				} else if(time.get(i).size() - 1 == l){
					ableTime += time.get(i).get(l);
				} else {
					ableTime += time.get(i).get(l)+",";
				}
			}
		}
		
		lb.setAblePlace(ablePlace);
		lb.setAbleTime(ableTime);
		
		
		
		//로그인이랑 연결하고 데이터 넣기
		Image img = new Image();
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		if(thumbnail != null && !thumbnail.isEmpty()) {
			String renameFileName = saveFile(thumbnail, request);
			
			if(renameFileName != null) {
				img.setOriginName(thumbnail.getOriginalFilename());
				img.setChangeName(renameFileName);
				img.setImgSrc(savePath);
				img.setFileLevel(0);//0은 썸네일
				img.setWriter(lb.getWriter());
			}
		}
		
		System.out.println(lb);
		int result = lbService.insertBoard(lb);
		System.out.println("result1 = "+result);
		int result2 = lbService.insertLecture(lb);
		System.out.println("result2 = "+result2);
		int result3 = lbService.insertImg(img);
		System.out.println("result3 = "+result3);
		return "redirect:/list.lec";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		//웹 서버 contextPath를 불러와서 폴더의 경로 받아옴 (webapp 하위의 resources에 도달)
		
		String savePath = root +"\\uploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		String  renamePath = folder +"\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			System.out.println("파일 전송 에러 : "+e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : "+e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	@RequestMapping("write.lec")
	public ModelAndView write() {
		ModelAndView mv = new ModelAndView();
		ArrayList<Hobby> hList = lbService.selectHobbyList();
		if(hList != null) {
			mv.addObject("hList", hList);
			mv.setViewName("lectureWriteView");
		} else {
			throw new LectureBoardException("취미 리스트 가져오기 실패");
		}
		return mv;
	}
	
	@RequestMapping("list.lec")
	public ModelAndView list( @RequestParam(value="sido", required=false) String sido, @RequestParam(value="gugun", required=false) String gugun,
							  @RequestParam(value="searchTag", required=false) String searchTag, @RequestParam(value="searchValue", required=false) String searchValue,
							  @RequestParam(value="hobbyNo", required=false) String hobbyNo, HttpServletRequest request) {
		System.out.println("------------------------ list.lec in ------------------------");
		System.out.println("sido = "+sido);
		System.out.println("gugun = "+gugun);
		System.out.println("searchTag = "+searchTag);
		System.out.println("searchValue = "+searchValue);
		System.out.println("hobbyNo = "+hobbyNo);
		int searchCate = 0;
		String searchWhere = "";
		if(sido == null) {
			sido = "";
			System.out.println("시도는 널이다 = "+sido);
		} else {
			searchWhere = sido;
		}
		if(gugun == null) {
			gugun = "";
		} else {
			searchWhere = gugun;
		}
		if(searchTag == null)
			searchTag = "";
		if(searchValue == null)
			searchValue = "";
		if(hobbyNo != null) {
			searchCate = Integer.parseInt(hobbyNo);
			System.out.println("hobbyNo는 널이 아니다 = "+searchCate);
		}
		if(gugun.equals(""))
			searchWhere = sido;
		
		
		System.out.println("sido = "+sido);
		System.out.println("gugun = "+gugun);
		System.out.println("searchTag = "+searchTag);
		System.out.println("searchValue = "+searchValue);
		System.out.println("hobbyNo = "+hobbyNo);
		System.out.println("searchCate = "+searchCate);
		
		// 검색옵션으로 list가져옴 처음페이지 들어갈때는 검색옵션이 ""이다
		Search search = new Search(searchWhere, searchTag, searchValue, searchCate);
		System.out.println("search = "+ search);
		int listCount = lbService.selectLBCount(search);
		System.out.println("listCount = "+listCount);
		
		// count를 가지고 페이지 로 select해오기
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lectureListView");
		int currentPage = 1;
		System.out.println("current???? = "+request.getParameter("currentPage"));
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
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
		
		// 취미 리스트 가져오기
		ArrayList<Hobby> hList = lbService.selectHobbyList();
		if(hList != null) {
			mv.addObject("hList", hList);
		} else {
			throw new LectureBoardException("취미 리스트 가져오기 실패");
		}
		
		//ArrayList<LectureBoard> lbList = lbService.selectLB();
		
		
		mv.addObject("sido",sido);
		mv.addObject("gugun",gugun);
		mv.addObject("searchTag",searchTag);
		mv.addObject("searchValue",searchValue);
		mv.addObject("hobbyNo",hobbyNo);
		mv.addObject("currentPage", currentPage);
		mv.addObject("applySuccess", request.getParameter("applySuccess"));
		System.out.println("------------------------ list.lec out ------------------------");
		return mv;
	}
		
	@RequestMapping("adminCateView.lec")
	public ModelAndView adminCateView() {
		ModelAndView mv = new ModelAndView();
		ArrayList<Hobby> hList = lbService.selectHobbyList();
		if(hList != null) {
			mv.addObject("hList", hList);
			mv.setViewName("adminCategory");
		} else {
			throw new LectureBoardException("취미 리스트 가져오기 실패");
		}
		return mv;
	}
		
	@RequestMapping("adminCate.lec")
	public String cateInsert(@RequestParam(value="hobbyNo", required=false) String hobbyNoS, @RequestParam("hobbyName") String hobbyName, @RequestParam("delYN") String delYN) {
		System.out.println("------------ adminCate.lec in --------------");
		int hobbyNo = 0;
		if(!hobbyNoS.equals("")) {
			hobbyNo = Integer.parseInt(hobbyNoS);
		}
		System.out.println("hobbyNoS = "+hobbyNoS);
		System.out.println("hobbyNo = "+hobbyNo);
		System.out.println("hobbyName = "+hobbyName);
		System.out.println("delYN = "+delYN);
		
		if(delYN.equals("Y")) {
			System.out.println("delYN이 Y일 경우");
			int result = lbService.deleteCategory(hobbyNo);
			if(result < 0) {
				throw new LectureBoardException("취미 삭제에 실패했습니다.");
			}
		} else {
			if(hobbyNo == 0) {
				System.out.println("hobbyNo의 값이 들어오지 않았을때 이다.");
				int result = lbService.insertCategory(hobbyName);
				if(result < 0) {
					throw new LectureBoardException("취미 삭제에 실패했습니다.");
				}
			} else {
				System.out.println("hobbyNo의 값이 있고 이름을 바꾸는 수정일때이다.");
				Hobby hobby = new Hobby(hobbyNo, hobbyName);
				int result = lbService.updateCategory(hobby);
				if(result < 0) {
					throw new LectureBoardException("취미 삭제에 실패했습니다.");
				}
			}
		}
		System.out.println("------------ adminCate.lec out --------------");
		return "redirect:/adminCateView.lec";
	}
	
	@RequestMapping("detail.lec")
	public ModelAndView detailView(@RequestParam("postNo") String postNoS, @RequestParam(value="sido", required=false) String sido, @RequestParam(value="gugun", required=false) String gugun,
			  @RequestParam(value="searchTag", required=false) String searchTag, @RequestParam(value="searchValue", required=false) String searchValue,
			  @RequestParam(value="hobbyNo", required=false) String hobbyNo, @RequestParam(value="currentPage", required=false) String currentPageS, HttpServletRequest request) {
		System.out.println("-------------- detail.lec in --------------");
		
		System.out.println("postNoS = "+postNoS);
		int postNo = Integer.parseInt(postNoS);
		System.out.println("sido = "+sido);
		System.out.println("gugun = "+gugun);
		System.out.println("searchTag = "+searchTag);
		System.out.println("searchValue = "+searchValue);
		System.out.println("hobbyNo = "+hobbyNo);
		
		ModelAndView mv = new ModelAndView();
		
		LectureBoard lb = lbService.selectLB(postNo);
		if(lb != null) {
			mv.addObject("lb", lb);
		}
		System.out.println(lb);
		
		ArrayList<Reply> rList = lbService.selectRList(postNo);
		if(rList != null) {
			mv.addObject("rList", rList);
		}
		System.out.println("rList.size() = "+rList.size());
		// 댓글 리스트까지 불러왔다
		// 여기서 도,구,동 리스트들 (도,구군,동,시간) 을 나눠담을지 선택하기
		
		System.out.println("시간 = "+lb.getAbleTime());
		System.out.println("장소 = "+lb.getAblePlace());
		
		
		// 장소를 ArrayList<String[]>에 담는다
		
		
		
		String ablePlace1[] = lb.getAblePlace().split("/");
		ArrayList<String[]> ablePlace = new ArrayList<>();
		for(int i = 0; i < ablePlace1.length; i++) {
			ablePlace.add(ablePlace1[i].split(","));
		}
		for(int i = 0; i < ablePlace.size(); i++) {
			for(int j = 0; j < ablePlace.get(i).length; j++) {
				System.out.print(ablePlace.get(i)[j]+", ");
			}
			System.out.println();
		}
		mv.addObject("ablePlace", ablePlace);
		
		
		
		// 시간을 03.21(토) 19:00 ~ 21:00 형식으로 만들어 배열에 담는다
		ArrayList<String> ableTime = new ArrayList<>();
		if(lb.getAbleTime().equals("AllDone")) {
			System.out.println("lb의 abletime값이 AllDone이다");
			ableTime.add("AllDone");
		} else {
			System.out.println("lb의 abletime값이 AllDone아니다");
			String ableTime1[] = lb.getAbleTime().split("::");
			ArrayList<String[]> ableTime0 = new ArrayList<>();
			for(int i = 0; i < ableTime1.length; i++) {
				ableTime0.add(ableTime1[i].split(","));
			}
			
			for(int i = 0; i < ableTime0.size(); i++) {
				for(int j = 1; j < ableTime0.get(i).length; j++) {
					String[] able = ableTime0.get(i);
					if(ableTime0.get(i)[0].length() == 7) {
						ableTime.add("0"+able[0]+" "+able[j]+":00 ~ "+(Integer.parseInt(able[j])+lb.getOtTime())+":00");
					} else if(ableTime0.get(i)[0].length() == 6){
						ableTime.add("0"+able[0].split("/")[0]+"/0"+able[0].split("/")[1]+" "+able[j]+":00 ~ "+(Integer.parseInt(able[j])+lb.getOtTime())+":00");
					}
				}
			}
		}
		
		
		
		System.out.println("----- ableTime -----");
		for(int i = 0; i < ableTime.size(); i++) {
			System.out.println(ableTime.get(i));
		}
		mv.addObject("ableTime", ableTime);
		mv.addObject("sido", sido);
		mv.addObject("gugun", gugun);
		mv.addObject("searchTag", searchTag);
		mv.addObject("searchValue", searchValue);
		mv.addObject("hobbyNo", hobbyNo);
		int currentPage = 1;
		if(currentPageS != null) {
			currentPage = Integer.parseInt(currentPageS);
			System.out.println("currentPageS가 null 아님");
		} else {
			System.out.println("currentPageS가 null 이다.");
		}
		mv.addObject("currentPage", currentPage);
		mv.setViewName("lectureDetailView");
		// 전에 이강의를 들었는지 검색해서 들었다 1 이상, 안들었다 0 같은 글에 (같은 postno에만해당)
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("member = "+loginUser);
		
		int checkBeforeApply = 0;
		if(loginUser != null) {
			System.out.println("로그인 아이디로 전에 강의를 들은적이 있는가 확인하는 곳");
			Conclusion c = new Conclusion();
			c.setPostNo(postNo);
			c.setProposer(loginUser.getUserId());
			checkBeforeApply = lbService.checkBeforeConclusion(c);
			System.out.println("checkBeforeApply = "+checkBeforeApply);
		}
		mv.addObject("checkBeforeApply", checkBeforeApply);
		
		
		System.out.println("-------------- detail.lec out --------------");
		return mv;
	}
	
	//댓글 등록
	@RequestMapping("insertReply.lec")
	public void insertReply(@RequestParam("postNo") String postNoS,@RequestParam("rWriter") String rWriter,
						    @RequestParam("replyContent") String replyContent, javax.servlet.http.HttpServletResponse response) throws UnsupportedEncodingException {
		System.out.println("-------------- insertReply.lec in --------------");
		System.out.println("postNo = "+postNoS);
		System.out.println("rWriter = "+rWriter);
		System.out.println("replyContent = "+replyContent);
		
		int postNo = Integer.parseInt(postNoS);
		
		Reply r = new Reply();
		r.setRefPno(postNo);
		r.setrWriter(rWriter);
		r.setrContent(replyContent);
		System.out.println(r);
		int result = lbService.insertReply(r);
		if(result < 1) {
			throw new LectureBoardException("댓글 추가 실패");
		}
		
		ArrayList<Reply> rList = lbService.selectRList(postNo);
		for(Reply r1 : rList) {
			r1.setrNickName(URLEncoder.encode(r1.getrNickName(), "UTF-8")); // 닉네임 인코딩
			r1.setrContent(URLEncoder.encode(r1.getrContent(), "UTF-8"));
		}
		
		System.out.println("-------------- insertReply.lec out --------------");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(rList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("applyLecture.lec")
	public String applyLecture(@RequestParam("postNo") String postNoS,@RequestParam("selectSido") String sido,
							 @RequestParam("selectGugun") String gugun,@RequestParam("selectDong") String dong,
							 @RequestParam("ableTime") String ableTime, @RequestParam("userId") String proposer,
							 
							 @RequestParam(value="searchSido", required=false) String searchSido,
							 @RequestParam(value="searchGugun", required=false) String searchGugun,
							 @RequestParam(value="searchTag", required=false) String searchTag,
							 @RequestParam(value="searchValue", required=false) String searchValue,
							 @RequestParam(value="searchHobbyNo", required=false) String searchHobbyNo,
							 @RequestParam(value="currentPage", required=false) String currentPageS,
							 HttpServletRequest request
			) {
		System.out.println("-------------- applyLecture.lec in --------------");
		System.out.println("postNo = "+postNoS);
		int postNo = Integer.parseInt(postNoS);
		System.out.println("sido = "+sido);
		System.out.println("gugun = "+gugun);
		System.out.println("dong = "+dong);
		System.out.println("ableTime = "+ableTime);
		System.out.println("proposer = "+proposer);
		
		LectureBoard lb = lbService.selectLB(postNo);
		System.out.println(lb);
		//CONCLUSION TABLE INSERT
			//오늘 날짜의 cal생성
			GregorianCalendar cal = new GregorianCalendar();
			System.out.println("skdfajweklcdf= "+cal.get(Calendar.YEAR) );
			// albeTime에서 달가져오기
			int ableMonth = Integer.parseInt(ableTime.substring(0, 2));
			System.out.println("ableMonth = "+ableMonth);
			// ableTime에서 일가져오기
			int ableDay = Integer.parseInt(ableTime.split("/")[1].substring(0, 2));
			System.out.println("ableDay = "+ableDay);
			// ableTime에서 시간 가져오기
			int ableHrs = Integer.parseInt(ableTime.split(":")[0].substring(ableTime.split(":")[0].length() - 2 , ableTime.split(":")[0].length()));
			System.out.println("ableHrs = "+ableHrs);
			String ableHrsS = null;
			if(ableHrs < 10) {
				ableHrsS = "0"+ableHrs;
			} else {
				ableHrsS = String.valueOf(ableHrs);
			}
			//cal에 시작날짜 선택한 시작 날짜를 시간까지 저장
			cal.set(cal.get(Calendar.YEAR), ableMonth-1, ableDay, ableHrs, 00);
			System.out.println("cal = "+cal.get(Calendar.YEAR)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.DATE)+"/"+cal.get(Calendar.HOUR_OF_DAY));//
			
			//시작날짜를 생성
			java.sql.Date startDate = new java.sql.Date(cal.getTimeInMillis());
			
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH");
			System.out.println("startDate = "+startDate);
			System.out.println("startDate.format() = "+fm.format(startDate));
			
			
			System.out.println("lb의 총강의 횟수 * 7 = "+lb.getOtAllTime() * 7);
			//cal에 강의총횟수 * 7일 을해서 날짜저장 finishDate가됌
			cal.add(Calendar.DATE, lb.getOtAllTime() * 7);
			System.out.println("cal = "+cal.get(Calendar.YEAR)+"/"+cal.get(Calendar.MONTH)+"/"+cal.get(Calendar.DATE)+"/"+cal.get(Calendar.HOUR_OF_DAY));
			
			//cal을 이용해서 finishDate생성
			java.sql.Date finishDate = new java.sql.Date(cal.getTimeInMillis());
			System.out.println("finishDate = "+finishDate);
			System.out.println("finishDate.format() = "+fm.format(finishDate));
			String startDateS = fm.format(startDate);
			String finishDateS = fm.format(finishDate);
			Conclusion c = new Conclusion(postNo, proposer, startDateS, finishDateS);
			//c에 startDateS와 finishDateS를 set함
			int conResult = lbService.insertConclusion(c);
			System.out.println("conResult = "+conResult);
			
		//LECTUREBOARD UPDATE 시간 뺴서 저장하기 남은 시간이 없다면 삭제
			System.out.println("lb.getAbleTime() = "+ lb.getAbleTime());
			System.out.println("ableTime = "+ableTime+"/ length = "+ableTime.length());
			
			String compareTime = String.valueOf(ableMonth)+"/"+String.valueOf(ableDay)+ableTime.substring(5, 8);
			ArrayList<ArrayList> time = new ArrayList<>();
			// time에 lb.ableTime의 값들을 넣으면서 출력
			
			
			for(int i = 0; i < lb.getAbleTime().split("::").length; i++) {
				ArrayList<String> exList = new ArrayList<>();
				Collections.addAll(exList, lb.getAbleTime().split("::")[i].split(","));
				time.add(exList);
				System.out.println(time.get(i));
				for(int j = 0; j < time.get(i).size(); j++) {
					System.out.print(time.get(i).get(j)+", ");
				}
				System.out.println();
			}
			System.out.println("remove ableHrsS = "+ableHrsS);
			// time에서 오늘 선택한 걸 지운다
			for(int i = 0; i < time.size(); i++) {
				if(time.get(i).get(0).equals(compareTime)) {
					System.out.println("if(time.get(i)[0].equals(compareTime)) in");
					for(int j = 0; j < time.get(i).size(); j++) {
						if(time.get(i).get(j).equals(ableHrsS)) {
							System.out.println("if(time.get(i)[j].equals(String.valueOf(ableHrs))) in");
							// 날짜의 시간을 삭제
							System.out.println("time.get(i) = "+time.get(i));
							System.out.println("remove ableHrs = "+ableHrsS);
							time.get(i).remove(String.valueOf(ableHrsS));
							System.out.println("time.get(i) = "+time.get(i));
							// 날짜에서 시간을 삭제하고 만약에 날짜에 시간이없을경우 > 날짜만 있고 해당날짜으 ㅣ시간이없다
							// 그러면 날짜도 삭제
							System.out.println("time.size() = "+time.size());
							if(time.get(i).size() <= 1) {
								time.remove(i);
								break;
							}
						}
					}
				}
			}
			
			//다시 확인
			for(int i = 0; i < time.size(); i++) {
				System.out.println(time.get(i));
				for(int j = 0; j < time.get(i).size(); j++) {
					System.out.print(time.get(i).get(j)+", ");
				}
				System.out.println();
			}
			
			
			//ableTime을 초기화하고 새롭게 업데이트된 시간을 담는다
			ableTime = "";
			for(int i = 0; i < time.size(); i++) {
				for(int l = 0; l < time.get(i).size(); l++) {
					if(i==0 && l==0) {
						ableTime += time.get(i).get(l)+",";
					} else if(l==0){
						ableTime += "::"+time.get(i).get(l)+",";
					} else if(time.get(i).size() - 1 == l){
						ableTime += time.get(i).get(l);
					} else {
						ableTime += time.get(i).get(l)+",";
					}
				}
			}
			System.out.println("ableTime = "+ableTime);
			if(ableTime.equals("")) {
				System.out.println("ableTime에 ''값으로 저장해야하는데 null 이라안됌 그러면 ' '로 저장해보자");
				ableTime = "AllDone";
				lbService.deleteBoard(postNo);
			}
			lb.setAbleTime(ableTime);
		//lb의 에다가 시간을 뺴서 저장을 했으므로 다시이걸로 업데이트한다
			int lbupdateResult = lbService.updateLecture(lb);
			
			System.out.println("lbupdateResult = "+lbupdateResult);
		
		// detail로 다시 돌아가게 하기
			ModelAndView mv = detailView(postNoS, searchSido, searchGugun, searchTag, searchValue, searchHobbyNo, currentPageS, request);
			lb = lbService.selectLB(postNo);
			System.out.println("12213"+lb);
		
			
			mv = list(searchSido, searchGugun, searchTag, searchValue, searchHobbyNo, request);
		// timetable에 insert하기....
			//concNo를 넣어야하기 때문에 conclusion을 select해서 가져온다.
			c = lbService.selectConclusion(c);
			System.out.println(c);
			//cal에 다시 startDate 넣기
			cal.set(cal.get(Calendar.YEAR), ableMonth-1, ableDay, ableHrs, 00);
			//fm도 새로운 형식으로바꿈
			fm = new SimpleDateFormat("yyyyMMddHH");
			Timeline timeline = new Timeline();
			java.sql.Date timelineDate = new java.sql.Date(cal.getTimeInMillis());
			//otAllTime만큼 추가한다.
			for(int i = 0; i < lb.getOtAllTime(); i++) {
				timelineDate = new java.sql.Date(cal.getTimeInMillis());
				timeline.setUserId(lb.getWriter());
				timeline.setPostNo(postNo);
				timeline.setConcNo(c.getConcNo());
				timeline.setTimeline(fm.format(timelineDate));
				int result = lbService.insertTimeline(timeline);
				cal.add(Calendar.DATE, 7);
				System.out.println("conc의 result = "+result);
			}
		mv.setViewName("redirect:/list.lec");
		//?sido="+searchSido+"&gugun="+searchGugun+"&searchTag="+searchTag+"&searchValue="+searchValue+"&hobbyNo="+searchHobbyNo+"&request="+request
		mv.addObject("applySuccess","applySuccess");
		System.out.println("-------------- applyLecture.lec out --------------");
		request.getSession().setAttribute("applySuccess", "applySuccess");
		
		return "redirect:/list.lec";
	}
	
	@RequestMapping("rList.lec")
	public void rList(@RequestParam("postNo") String postNoS, HttpServletResponse response) throws UnsupportedEncodingException {
		int postNo = Integer.parseInt(postNoS);
		ArrayList<Reply> rList = lbService.selectRList(postNo);
		if(rList == null) {
			throw new LectureBoardException("rList.lec에서 댓글가져오기 실패");
		}
		
		for(Reply r1 : rList) {
			r1.setrNickName(URLEncoder.encode(r1.getrNickName(), "UTF-8")); // 닉네임 인코딩
			r1.setrContent(URLEncoder.encode(r1.getrContent(), "UTF-8"));
		}
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(rList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateReply.lec")
	@ResponseBody
	public String updateReply(Reply r, @RequestParam("rNo") int rNo, @RequestParam("rContent") String rContent) {
		
		r.setrNo(rNo);
		r.setrContent(rContent);
		System.out.println(r);
		int result = lbService.updateReply(r);
		if(result > 0) {
			return "success";
		} else {
			throw new LectureBoardException("댓글 수정 실패!!");
		}
	}
	
	@RequestMapping("deleteReply.lec")
	@ResponseBody
	public String deleteReply(Reply r, @RequestParam("rNo") int rNo) {
		
		r.setrNo(rNo);
	
		int result = lbService.deleteReply(r);
		if(result > 0) {
			return "success";
		} else {
			throw new LectureBoardException("댓글 삭제 실패!!");
		}
	}
	
	@RequestMapping("updateView.lec")
	public ModelAndView updateView(@RequestParam("postNo") String postNoS) {
		int postNo = Integer.parseInt(postNoS);
		LectureBoard lb = lbService.selectLB(postNo);
		ModelAndView mv = new ModelAndView();
		if(lb != null) {
			mv.addObject("lb", lb);
		} else {
			throw new LectureBoardException("lb 가져오기 실패");
		}
		
		ArrayList<Hobby> hList = lbService.selectHobbyList();
		if(hList != null) {
			mv.addObject("hList", hList);
		} else {
			throw new LectureBoardException("취미 리스트 가져오기 실패");
		}
		
		
		mv.setViewName("lectureUpdateView");
		
		return mv;
	}
	
	@RequestMapping("updateLecture.lec")
	public String updateLecture(@ModelAttribute LectureBoard lb,HttpServletRequest request, @RequestParam("thumbnailImg") MultipartFile thumbnail, @ModelAttribute Member loginUser,
			  @RequestParam("allDate") ArrayList<String> allDate, @RequestParam("postNo") String postNoS) {
		int postNo = Integer.parseInt(postNoS);
		lb.setPostNo(postNo);
		ArrayList<String> sidoArr = new ArrayList<String>();
		for(int i = 0; i < 10 ;i++) {
			if(!request.getParameter("sido"+i).equals("")) {
				sidoArr.add(request.getParameter("sido"+i));
			} else {
				break;
			}
		}
		
		ArrayList<String> gugunArr = new ArrayList<String>();
		for(int i = 0; i < 10 ;i++) {
			if(!request.getParameter("gugun"+i).equals("")) {
				gugunArr.add(request.getParameter("gugun"+i));
			} else {
				break;
			}
		}
		
		ArrayList<String[]> dongArr = new ArrayList<String[]>();
		for(int i = 0; i < 10 ; i++) {
			if(request.getParameterValues("dong"+i) != null) {
				dongArr.add(request.getParameterValues("dong"+i));
			} else {
				break;
			}
		}
		
		ArrayList<ArrayList<String>> APList = new ArrayList<>();
		for(int i = 0; i < sidoArr.size(); i++) {
			ArrayList<String> nowArr = new ArrayList<>();
			nowArr.add(sidoArr.get(i));
			nowArr.add(gugunArr.get(i));
			for(int j = 0; j < dongArr.get(i).length; j++) {
				nowArr.add(dongArr.get(i)[j]);
			}
			APList.add(nowArr);
		}
		
		String ablePlace = "";
		System.out.println("dongArr.size() = "+dongArr.size());
		for(int i = 1; i < APList.size(); i++) {
			Collections.sort(APList, new Comparator<ArrayList<String>>() {
				@Override
				public int compare(ArrayList<String> o1, ArrayList<String> o2) {
					if(o1.get(0).equals(o2.get(0))) {
						System.out.println("첫번쨰꺼 같다");
						return o1.get(1).compareTo(o2.get(1));
					} else {
						System.out.println("첫번쨰꺼 다르다");
						return o1.get(0).compareTo(o2.get(0));
					}
				}
			});
		}
		
		
		for(int i = 0; i < APList.size(); i++) {
			for(int j = 0; j < APList.get(i).size(); j++) {
				if(i != 0 && j == 0) {
					ablePlace += "/"+APList.get(i).get(j)+",";
				} else if(j == ( APList.get(i).size()-1 )){
					ablePlace += APList.get(i).get(j);
				} else {
					ablePlace += APList.get(i).get(j)+",";
				}
			}
		}
		System.out.println("ablePlace = "+ablePlace);
		
		String ableTime = "";
		ArrayList<ArrayList<String>> time = new ArrayList<ArrayList<String>>();
		int j = -1;
		int k = 0;
		for(int i = 0; i < allDate.size(); i++) {
			if(allDate.get(i).length() > 2) {
				j++;
				k = 0;
				time.add(new ArrayList<String>());
				time.get(j).add(allDate.get(i));
				k++;
			} else {
				time.get(j).add(allDate.get(i));
				k++;
			}
		}
		
		for(int i = 0; i < time.size(); i++) {
			for(int l = 0; l < time.get(i).size(); l++) {
				if(i==0 && l==0) {
					ableTime += time.get(i).get(l)+",";
				} else if(l==0){
					ableTime += "::"+time.get(i).get(l)+",";
				} else if(time.get(i).size() - 1 == l){
					ableTime += time.get(i).get(l);
				} else {
					ableTime += time.get(i).get(l)+",";
				}
			}
		}
		
		lb.setAblePlace(ablePlace);
		lb.setAbleTime(ableTime);
		
		
		
		//로그인이랑 연결하고 데이터 넣기
		Image img = new Image();
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		if(thumbnail != null && !thumbnail.isEmpty()) {
			System.out.println("사진안비었댜...");
			String renameFileName = saveFile(thumbnail, request);
			
			if(renameFileName != null) {
				img.setPostNo(postNo);
				img.setOriginName(thumbnail.getOriginalFilename());
				img.setChangeName(renameFileName);
				img.setImgSrc(savePath);
				img.setFileLevel(0);//0은 썸네일
				img.setWriter(lb.getWriter());
			}
			
			int result3 = lbService.updateImg(img);
			System.out.println("result3 = "+result3);
		} else {
			System.out.println("사진비었댜...");
		}
		
		System.out.println(lb);
		int result = lbService.updateBoard(lb);
		System.out.println("result1 = "+result);
		int result2 = lbService.updateLecture(lb);
		System.out.println("result2 = "+result2);
		
		return "redirect:/list.lec";
	}
	
	@RequestMapping("deleteBoard.lec")
	public ModelAndView deleteBoard(@RequestParam("postNo") String postNoS ,HttpServletRequest request) {
		System.out.println("------------------------ deleteBoard.lec in ------------------------");
		int postNo = Integer.parseInt(postNoS);
		ModelAndView mv = new ModelAndView();
		int deleteResult = lbService.deleteBoard(postNo);
		mv = list(null, null, null, null, null, request);
		System.out.println("------------------------ deleteBoard.lec out ------------------------");
		return mv;
		}
}

