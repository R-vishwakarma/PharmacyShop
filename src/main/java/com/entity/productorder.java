package com.entity;

public class productorder {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phone;
	private String fulladd;
	private String productname;
	private String price;
	private String paymentType;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFulladd() {
		return fulladd;
	}
	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	@Override
	public String toString() {
		return "productorder [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", phone=" + phone + ", fulladd=" + fulladd + ", productname=" + productname + ", price=" + price
				+ ", paymentType=" + paymentType + "]";
	}
	
	
}
