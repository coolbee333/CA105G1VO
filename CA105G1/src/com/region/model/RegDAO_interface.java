package com.region.model;

import java.util.*;

public interface RegDAO_interface {
	
	public void insert(RegVO regVo);
	public void update(RegVO regVo);
	public void delete(RegVO regVo);
    public RegVO findByPrimaryKey(Integer reg_no);
	public List<RegVO> getAll();
//	萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 

}
