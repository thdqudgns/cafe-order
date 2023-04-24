package com.cafe.order.model;

public class Menu {
	
	private int menuId;
	private int kindId;
	private String menuName;
	private String imgPath;
	private Integer hotPrice;
	private Integer icedPrice;
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getKindId() {
		return kindId;
	}
	public void setKindId(int kindId) {
		this.kindId = kindId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public Integer getHotPrice() {
		return hotPrice;
	}
	public void setHotPrice(Integer hotPrice) {
		this.hotPrice = hotPrice;
	}
	public Integer getIcedPrice() {
		return icedPrice;
	}
	public void setIcedPrice(Integer icedPrice) {
		this.icedPrice = icedPrice;
	}

	
}
