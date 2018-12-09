package com.venue.model;


public class VenueVO {
	private String v_no;
	private String v_name;
	private String vt_no;
	private Integer reg_no;
	private Double v_lat;
	private Double v_long;
	private String v_link;
	private String v_address;
	private String v_phoneno;
	private String v_status;


	public VenueVO() {
		super();
	}


	public VenueVO(String v_no, String v_name, String vt_no, Integer reg_no, Double v_lat, Double v_long, String v_link,
			String v_address, String v_phoneno, String v_status) {
		super();
		this.v_no = v_no;
		this.v_name = v_name;
		this.vt_no = vt_no;
		this.reg_no = reg_no;
		this.v_lat = v_lat;
		this.v_long = v_long;
		this.v_link = v_link;
		this.v_address = v_address;
		this.v_phoneno = v_phoneno;
		this.v_status = v_status;
	}


	public String getV_no() {
		return v_no;
	}


	public void setV_no(String v_no) {
		this.v_no = v_no;
	}


	public String getV_name() {
		return v_name;
	}


	public void setV_name(String v_name) {
		this.v_name = v_name;
	}


	public String getVt_no() {
		return vt_no;
	}


	public void setVt_no(String vt_no) {
		this.vt_no = vt_no;
	}


	public Integer getReg_no() {
		return reg_no;
	}


	public void setReg_no(Integer reg_no) {
		this.reg_no = reg_no;
	}


	public Double getV_lat() {
		return v_lat;
	}


	public void setV_lat(Double v_lat) {
		this.v_lat = v_lat;
	}


	public Double getV_long() {
		return v_long;
	}


	public void setV_long(Double v_long) {
		this.v_long = v_long;
	}


	public String getV_link() {
		return v_link;
	}


	public void setV_link(String v_link) {
		this.v_link = v_link;
	}


	public String getV_address() {
		return v_address;
	}


	public void setV_address(String v_address) {
		this.v_address = v_address;
	}


	public String getV_phoneno() {
		return v_phoneno;
	}


	public void setV_phoneno(String v_phoneno) {
		this.v_phoneno = v_phoneno;
	}


	public String getV_status() {
		return v_status;
	}


	public void setV_status(String v_status) {
		this.v_status = v_status;
	}
	
	
	
}
