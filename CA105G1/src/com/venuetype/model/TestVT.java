package com.venuetype.model;

import java.util.List;

public class TestVT {
	
	public static void main(String[] args) {
		
		VTDAO_interface vi  = new VTDAO();
		
		vi.insert(new VTVO("VT003","籃球"));
		vi.insert(new VTVO("VT004","網球"));
		vi.update(new VTVO("VT002","棒球"));
		vi.delete("VT003");
		
		
		VTVO vt = vi.findByPrimaryKey("VT001");
		System.out.println(vt.getVt_name());
		
		System.out.println("========================");
		
		List<VTVO> vTVO = vi.getAll();
		
		for (VTVO x : vTVO) {
			System.out.println(x.getVt_no() + " " + x.getVt_name());
		}
		
	}

}
