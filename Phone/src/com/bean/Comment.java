package com.bean;

public class Comment {
	private int commentId;
	private Goods goods;
	private Member member;
	private String conTime;
	private String content;
	
	public Comment() {
		
	}
	
	public Comment(int commentId, Goods goods, Member member, String conTime, String content) {
		super();
		this.commentId = commentId;
		this.goods = goods;
		this.member = member;
		this.conTime = conTime;
		this.content = content;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	public String getConTime() {
		return conTime;
	}

	public void setConTime(String conTime) {
		this.conTime = conTime;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
