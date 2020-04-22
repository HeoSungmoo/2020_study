package com.hsm.daily.model.product.dto;

import java.util.Date;

public class ProductDTO {

	private int no;
	private String thumbnail;
	private String title;
	private int price;
	private String sub_img1;
	private String sub_img2;
	private String sub_img3;
	private String category1;
	private String category2;
	private String category3;
	private String id;
	private Date upload_date;
	private Date delete_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSub_img1() {
		return sub_img1;
	}
	public void setSub_img1(String sub_img1) {
		this.sub_img1 = sub_img1;
	}
	public String getSub_img2() {
		return sub_img2;
	}
	public void setSub_img2(String sub_img2) {
		this.sub_img2 = sub_img2;
	}
	public String getSub_img3() {
		return sub_img3;
	}
	public void setSub_img3(String sub_img3) {
		this.sub_img3 = sub_img3;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public Date getDelete_date() {
		return delete_date;
	}
	public void setDelete_date(Date delete_date) {
		this.delete_date = delete_date;
	}
	
	
}
