package finalProject.homis.hobbyFarm.lecture.model.vo;

public class Timeline {
	private int tableNo; // 테이블 고유 시퀀스 넘버링
	private String userId; // 유저 아이디(로그인한 강사의 아이디)
	private int postNo; // 강의, 모임 글 번호(디테일 접근 위함)
	private int concNo;
	private String timeline; // 시간 저장해서 오는 곳(YYYYMMDDHH) 식으로 들어옴
	
	public Timeline() {}
	public Timeline(int tableNo, String userId, int postNo, int concNo, String timeline) {
		super();
		this.tableNo = tableNo;
		this.userId = userId;
		this.postNo = postNo;
		this.concNo = concNo;
		this.timeline = timeline;
	}
	public int getTableNo() {
		return tableNo;
	}
	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
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
	public int getConcNo() {
		return concNo;
	}
	public void setConcNo(int concNo) {
		this.concNo = concNo;
	}
	public String getTimeline() {
		return timeline;
	}
	public void setTimeline(String timeline) {
		this.timeline = timeline;
	}
	@Override
	public String toString() {
		return "Timeline [tableNo=" + tableNo + ", userId=" + userId + ", postNo=" + postNo + ", concNo=" + concNo
				+ ", timeline=" + timeline + "]";
	}
	
	
	
}