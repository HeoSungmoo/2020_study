package com.dango.hsm.model.member.dto;

public class MemberDTO {
	String memberId;
	String memberPw;
	String memberName;
	String memberPhone;
	String memberMail;
	String memberAddress;
	int memberBp;
	int memberMp;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberMail() {
		return memberMail;
	}
	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public int getMemberBp() {
		return memberBp;
	}
	public void setMemberBp(int memberBp) {
		this.memberBp = memberBp;
	}
	public int getMemberMp() {
		return memberMp;
	}
	public void setMemberMp(int memberMp) {
		this.memberMp = memberMp;
	}
	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", memberMail=" + memberMail + ", memberAddress=" + memberAddress
				+ ", memberBp=" + memberBp + ", memberMp=" + memberMp + "]";
	}

	
}
