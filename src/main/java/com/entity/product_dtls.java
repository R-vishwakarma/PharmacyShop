package com.entity;

public class product_dtls {
	private int product_id;
	private String product_name;
	private String category;
	private String brand_name;
	private String photo;
	private String price;
	public product_dtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public product_dtls(String product_name, String category, String brand_name, String photo, String price) {
		super();
		this.product_name = product_name;
		this.category = category;
		this.brand_name = brand_name;
		this.photo = photo;
		this.price = price;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "product_dtls [product_id=" + product_id + ", product_name=" + product_name + ", category=" + category
				+ ", brand_name=" + brand_name + ", photo=" + photo + ", price=" + price + "]";
	}
	
}
