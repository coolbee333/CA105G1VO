package com.venuetype.model;

import java.util.List;

public class TestVT {
	
	public static void main(String[] args) {
		
		VTDAO_interface vi  = new VTDAO();
		
		vi.insert(new VTVO("VT009","籃球"));
		vi.insert(new VTVO("VT010","網球"));
		vi.update(new VTVO("VT011","棒球"));
		vi.delete("VT004");
		
		
		VTVO vt = vi.findByPrimaryKey("VT001");
		System.out.println(vt.getVt_name());
		
		System.out.println("========================");
		
		List<VTVO> vTVO = vi.getAll();
		
		for (VTVO x : vTVO) {
			System.out.println(x.getVt_no() + " " + x.getVt_name());
		}
		
	}

}
