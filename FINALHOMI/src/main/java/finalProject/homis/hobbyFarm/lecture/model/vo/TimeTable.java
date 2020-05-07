package finalProject.homis.hobbyFarm.lecture.model.vo;

public class TimeTable {
	private String userId;
	private int postNo;
	private int timeLine;
	
	public TimeTable() {
		// TODO Auto-generated constructor stub
	}

	public TimeTable(String userId, int postNo, int timeLine) {
		super();
		this.userId = userId;
		this.postNo = postNo;
		this.timeLine = timeLine;
	}

	@Override
	public String toString() {
		return "TimeTable [userId=" + userId + ", postNo=" + postNo + ", timeLine=" + timeLine + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getTimeLine() {
		return timeLine;
	}

	public void setTimeLine(int timeLine) {
		this.timeLine = timeLine;
	}
	
	
}
