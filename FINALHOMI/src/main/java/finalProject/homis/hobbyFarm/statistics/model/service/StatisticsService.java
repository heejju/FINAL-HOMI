package finalProject.homis.hobbyFarm.statistics.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import finalProject.homis.hobbyFarm.statistics.model.vo.Statistics;

public interface StatisticsService {

	int getMemberCount();

	int getLectureCount();

	int getVisitCount();

	int getTeacherCount();

	int getStudentCount();

	int getArtCount();

	int getCraftsCount();

	int getMusicCount();

	int getDesignCount();

	int getPictureCount();

	int getCookCount();

	int getDanceCount();

	int getSportsCount();

	ArrayList<Statistics> selectList(String yearMonth);

	int getArtCount2();

	int getCraftsCount2();

	int getMusicCount2();

	int getDesignCount2();

	int getCookCount2();

	int getDanceCount2();


}
