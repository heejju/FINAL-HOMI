package finalProject.homis.hobbyFarm.lecture.model.vo;

import java.sql.Date;

public class Conclusion {
	private int postNo;
	private String proposer;
	private String startDate;
	private String finishDate;
	
	public Conclusion() {}

	public Conclusion(int postNo, String proposer, String startDate, String finishDate) {
		super();
		this.postNo = postNo;
		this.proposer = proposer;
		this.startDate = startDate;
		this.finishDate = finishDate;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getProposer() {
		return proposer;
	}

	public void setProposer(String proposer) {
		this.proposer = proposer;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	@Override
	public String toString() {
		return "Conclusion [postNo=" + postNo + ", proposer=" + proposer + ", startDate=" + startDate + ", finishDate="
				+ finishDate + "]";
	}
	
	
	
	
}