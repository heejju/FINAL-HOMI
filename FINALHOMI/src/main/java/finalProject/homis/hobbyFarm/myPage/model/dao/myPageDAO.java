package finalProject.homis.hobbyFarm.myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import finalProject.homis.hobbyFarm.groupFarm.model.vo.GroupFarmBoard;
import finalProject.homis.hobbyFarm.lecture.model.vo.LectureBoard;
import finalProject.homis.hobbyFarm.member.model.vo.Member;

@Repository
public class myPageDAO {

	public int selectGroupCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.getGroupCount", id);
	}

	public int upgradeVip(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("myPageMapper.upgradeVip", id);
	}

	public Member getMemberSession(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.getMemberSession",id);
	}

	public int getRunningLecture(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.getRunningLecture", id);
	}

	public int getFinishedLecture(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.getfinishedLecture", id);
	}

	public int getFinishedFarm(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.getfinishedFarm", id);
	}

	public ArrayList<LectureBoard> myLectureSt(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myLectureSt", id);
	}

	public ArrayList<LectureBoard> myFinishedLectureList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myFinishedLectureList", id);
	}

	public ArrayList<GroupFarmBoard> myFarm(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("myPageMapper.myFarm", id);
	}

}
