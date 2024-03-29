package com.Dao;

import java.util.List;

import com.entity.productorder;

public interface ProductOrderDAO {
	
	public int getOrderNo();
	
public boolean saveOrder(List<productorder> b);
	
	public List<productorder> getProduct(String email);
	
	public List<productorder> getAllOrder();
	
	public boolean deleteOrder(String order_id);
}
