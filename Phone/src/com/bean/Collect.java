package com.bean;

public class Collect {
	private int collectId;
	private Goods goods;
	
	public Collect() {
	}
	
	public Collect(int collectId, Goods goods) {
		super();
		this.collectId = collectId;
		this.goods = goods;
	}

	public int getCollectId() {
		return collectId;
	}

	public void setCollectId(int collectId) {
		this.collectId = collectId;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	
}
