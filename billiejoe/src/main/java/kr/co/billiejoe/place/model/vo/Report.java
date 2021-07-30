package kr.co.billiejoe.place.model.vo;

import java.sql.Timestamp;

public class Report {
	private int reportNo;
	private String reportContent;
	private int memberNo;
	private int reviewNo;
	private Timestamp reportDate;
	
	public Report() {}

	public Report(int reportNo, String reportContent, int memberNo, int reviewNo, Timestamp reportDate) {
		this.reportNo = reportNo;
		this.reportContent = reportContent;
		this.memberNo = memberNo;
		this.reviewNo = reviewNo;
		this.reportDate = reportDate;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public Timestamp getReportDate() {
		return reportDate;
	}

	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportContent=" + reportContent + ", memberNo=" + memberNo
				+ ", reviewNo=" + reviewNo + ", reportDate=" + reportDate + "]";
	}
	
	
}
