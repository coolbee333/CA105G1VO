package com.venuetype.model;

import java.util.*;

public interface VTDAO_interface {
	
	public void insert(VTVO vtVO);
	public void update(VTVO vtVO);
	public void delete(String vt_no);
    public VTVO findByPrimaryKey(String vt_no);
	public List<VTVO> getAll();
//	萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<VTVO> getAll(Map<String, String[]> map); 

}
