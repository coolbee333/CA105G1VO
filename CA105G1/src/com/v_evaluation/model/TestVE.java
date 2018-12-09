package com.v_evaluation.model;

import java.util.List;

public class TestVE {
		
	public static void main(String[] args) {
		
		VEDAO_interface vei  = new VEDAO();
		
//		vei.insert(new VEVO("M001","V000002", 3));
//		vei.insert(new VEVO("M002","V000003", 2));
//		vei.update(new VEVO("M001","V000002", 4));
//		vei.delete("M001", "V000003");
//		
//		
		VEVO ve = vei.findByPrimaryKey("M001", "V000003");
		System.out.println(ve.getScore());
		
//		System.out.println("========================");
//		
//		List<VEVO> veVO = vei.getAll();
//		
//		for (VEVO x : veVO) {
//			System.out.println(x.getMem_no() + x.getV_no() + x.getScore());
//		}
		
	}
}
