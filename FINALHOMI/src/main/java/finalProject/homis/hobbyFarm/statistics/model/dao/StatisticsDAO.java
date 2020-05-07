package finalProject.homis.hobbyFarm.statistics.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import finalProject.homis.hobbyFarm.statistics.model.vo.Statistics;

@Repository("sDAO")
public class StatisticsDAO {

	public int getMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getMemberCount");
	}

	public int getLectureCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getLectureCount");
	}

	public int getVisitCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getVisitCount");
	}

	public int getTeacherCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getTeacherCount");
	}

	public int getStudentCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getStudentCount");
	}

	public int getArtCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getArtCount");
	}

	public int getCraftsCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getCraftsCount");
	}

	public int getMusicCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getMusicCount");
	}

	public int getDesignCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getDesignCount");
	}

	public int getPictureCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getPictureCount");
	}

	public int getCookCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getCookCount");
	}

	public int getDanceCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getDanceCount");
	}

	public int getSportsCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getSportsCount");
	}

	public ArrayList<Statistics> selectList(SqlSessionTemplate sqlSession, String yearMonth) {
		return (ArrayList)sqlSession.selectList("statisticsMapper.selectList", yearMonth);
	}

	public int getArtCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getArtCount2");
	}

	public int getCraftsCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getCraftsCount2");
	}

	public int getMusicCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getMusicCount2");
	}

	public int getCookCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getCookCount2");
	}

	public int getDesignCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getDesignCount2");
	}

	public int getDanceCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticsMapper.getDanceCount2");
	}

}
