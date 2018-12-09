package com.venue.model;


public class TestVenue {
	
	public static void main(String[] args) {
		
		VenueDAO_interface vi = new VenueDAO();
		
		vi.insert(new VenueVO("V000003", "籃球場", "VT001", 101, 12.123, 123.123, "Http:hello.com", "台中市西屯區西屯路三段", "0912345678", "開放"));
		
		VenueVO vo = vi.findByPrimaryKey("V000003");
		
		System.out.println(vo.getV_name() + vo.getV_address());
		
	}
	
}
