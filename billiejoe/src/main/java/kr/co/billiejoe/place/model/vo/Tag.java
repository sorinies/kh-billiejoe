package kr.co.billiejoe.place.model.vo;

public class Tag {
	private int tagNo;
	private String tagName;

	public Tag() {}
	
	public Tag(int tagNo, String tagName) {
		this.tagNo = tagNo;
		this.tagName = tagName;
	}
	
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "Tag [tagNo=" + tagNo + ", tagName=" + tagName + "]";
	}
}
