package com.bean;

public class Introduce {
	private int introduceId;
	private int memory;
	private String brand;
	private String color;
	private String distinguishability;
	private String front_camera;
	private String back_camera;
	private String cpu;
	private String rate;
	private String systems;
	private String heft;
	private String battery;
	private String thickness;
	private String caption;
	private Goods goods;
	public Introduce() {
		
	}
	public Introduce(int introduceId, int memory, String brand, String color,
			String distinguishability, String front_camera, String back_camera,
			String cpu, String rate, String systems, String heft,
			String battery, String thickness, String caption, Goods goods) {
		super();
		this.introduceId = introduceId;
		this.memory = memory;
		this.brand = brand;
		this.color = color;
		this.distinguishability = distinguishability;
		this.front_camera = front_camera;
		this.back_camera = back_camera;
		this.cpu = cpu;
		this.rate = rate;
		this.systems = systems;
		this.heft = heft;
		this.battery = battery;
		this.thickness = thickness;
		this.caption = caption;
		this.goods = goods;
	}
	public int getIntroduceId() {
		return introduceId;
	}
	public void setIntroduceId(int introduceId) {
		this.introduceId = introduceId;
	}
	public int getMemory() {
		return memory;
	}
	public void setMemory(int memory) {
		this.memory = memory;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getDistinguishability() {
		return distinguishability;
	}
	public void setDistinguishability(String distinguishability) {
		this.distinguishability = distinguishability;
	}
	public String getFront_camera() {
		return front_camera;
	}
	public void setFront_camera(String front_camera) {
		this.front_camera = front_camera;
	}
	public String getBack_camera() {
		return back_camera;
	}
	public void setBack_camera(String back_camera) {
		this.back_camera = back_camera;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getSystems() {
		return systems;
	}
	public void setSystems(String systems) {
		this.systems = systems;
	}
	public String getHeft() {
		return heft;
	}
	public void setHeft(String heft) {
		this.heft = heft;
	}
	public String getBattery() {
		return battery;
	}
	public void setBattery(String battery) {
		this.battery = battery;
	}
	public String getThickness() {
		return thickness;
	}
	public void setThickness(String thickness) {
		this.thickness = thickness;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
