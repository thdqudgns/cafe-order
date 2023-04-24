package com.cafe.order.model;

import lombok.Getter;
import lombok.Setter;

public class Order {

	private String menuName;
	private int price;
	private String temperatureOption; // yes / no
	private String decaffeinOption; // yes / no
	private String shotOption; // yes / no
	private String hazelnutOption; // yes / no
	private String vainillaOption; // yes / no
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTemperatureOption() {
		return temperatureOption;
	}
	public void setTemperatureOption(String temperatureOption) {
		this.temperatureOption = temperatureOption;
	}
	public String getDecaffeinOption() {
		return decaffeinOption;
	}
	public void setDecaffeinOption(String decaffeinOption) {
		this.decaffeinOption = decaffeinOption;
	}
	public String getShotOption() {
		return shotOption;
	}
	public void setShotOption(String shotOption) {
		this.shotOption = shotOption;
	}
	public String getHazelnutOption() {
		return hazelnutOption;
	}
	public void setHazelnutOption(String hazelnutOption) {
		this.hazelnutOption = hazelnutOption;
	}
	public String getVainillaOption() {
		return vainillaOption;
	}
	public void setVainillaOption(String vainillaOption) {
		this.vainillaOption = vainillaOption;
	}
	
	
	
}
