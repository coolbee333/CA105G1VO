package com.v_evaluation.model;

import java.util.*;

public interface VEDAO_interface {
	
	public void insert(VEVO veVO);
	public void update(VEVO veVO);
	public void delete(String mem_no, String v_no);
    public VEVO findByPrimaryKey(String mem_no, String v_no);
	public List<VEVO> getAll();
//	萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<VTVO> getAll(Map<String, String[]> map); 

}
