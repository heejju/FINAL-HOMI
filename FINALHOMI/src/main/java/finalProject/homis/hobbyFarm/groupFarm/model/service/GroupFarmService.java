package finalProject.homis.hobbyFarm.groupFarm.model.service;

import java.util.ArrayList;
import java.util.List;

import finalProject.homis.hobbyFarm.common.model.vo.Hobby;
import finalProject.homis.hobbyFarm.common.model.vo.Image;
import finalProject.homis.hobbyFarm.common.model.vo.PageInfo;
import finalProject.homis.hobbyFarm.common.model.vo.Reply;
import finalProject.homis.hobbyFarm.common.model.vo.SearchSelect;
import finalProject.homis.hobbyFarm.common.model.vo.Teacher;
import finalProject.homis.hobbyFarm.groupFarm.model.vo.GroupFarmApplication;
import finalProject.homis.hobbyFarm.groupFarm.model.vo.GroupFarmBoard;
import finalProject.homis.hobbyFarm.lecture.model.vo.LectureBoard;

public interface GroupFarmService {

	int getListCount(SearchSelect ss);

	ArrayList<Hobby> selectHList();
	
	ArrayList<GroupFarmBoard> selectList(PageInfo pi, SearchSelect ss);

	ArrayList<Image> selectTList(PageInfo pi, SearchSelect ss);

//	int getSearchListCount(SearchSelect ss);
//
//	ArrayList<GroupFarmBoard> selecSearchList(PageInfo pi, SearchSelect ss);
//	
//	ArrayList<Image> selectSearchTList(PageInfo pi, SearchSelect ss);
//	
//	int getFilterSearchListCount(SearchSelect ss);
//
//	ArrayList<GroupFarmBoard> selectFilterSearchList(PageInfo pi, SearchSelect ss);
//
//	ArrayList<Image> selectFilterSearchTList(PageInfo pi, SearchSelect ss);

	int insertBoard(GroupFarmBoard gf, Image img);

	ArrayList<Teacher> teacherList(GroupFarmBoard gf);

	GroupFarmBoard selectBoard(Integer postNo);

	Image selectImage(Integer postNo);

	ArrayList<GroupFarmApplication> selectGfaList(Integer postNo);

	ArrayList<Reply> selectReplyList(int postNo);

	int insertReply(Reply r);

	int updateReply(Reply r);
	
	int deleteReply(Reply r);

	int enterGroup(GroupFarmApplication gfa);

	int exeuntGroup(GroupFarmApplication gfa);

	int closeGroup(int postNo);

	int deleteBoard(Integer postNo);

	GroupFarmBoard selectLastInsertInfo(String loginId);

	// 모임 마감 취소
	int cancleClose(int postNo);

	LectureBoard recentLec(String userId);




	




}
