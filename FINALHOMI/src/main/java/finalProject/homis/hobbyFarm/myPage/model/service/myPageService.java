package finalProject.homis.hobbyFarm.myPage.model.service;

import java.util.ArrayList;

import finalProject.homis.hobbyFarm.groupFarm.model.vo.GroupFarmBoard;
import finalProject.homis.hobbyFarm.lecture.model.vo.LectureBoard;
import finalProject.homis.hobbyFarm.member.model.vo.Member;

public interface myPageService {

	int getRunningFarm(String id);

	int getRunningGroup(String id);

	int upgradeVip(String id);

	Member resetMemberSession(String id);

	int getRunningLecture(String id);

	int getFinished(String id);

	ArrayList<LectureBoard> myLectureSt(String id);
	ArrayList<LectureBoard> myFinishedLectureList(String id);

	ArrayList<GroupFarmBoard> myFarm(String id);

}
