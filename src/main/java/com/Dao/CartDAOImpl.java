package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.product_cart;

public class CartDAOImpl implements CartDAO{
	
	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

@Override
	public boolean addCart(product_cart c) {

	boolean f=false;
	
	try {
		String sql = "insert into product_cart(pid,uid,product_name,category,price,total_price) values(?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, c.getPid());
		ps.setInt(2, c.getUid());
		ps.setString(3, c.getProduct_name());
		ps.setString(4, c.getCategory());
		ps.setDouble(5, c.getPrice());
		ps.setDouble(6, c.getTotalPrice());
		int i=ps.executeUpdate();
		if (i==1) {
			f=true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;

	
		
	}
@Override
public List<product_cart> getProductByUser(int userId) {
	
	List<product_cart> list = new ArrayList<product_cart>();
	product_cart c=null;
     double totalPrice =0;
	
	try {
	
		String sql="select * from product_cart where uid=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, userId);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			c=new product_cart();
			c.setCid(rs.getInt(1));
			c.setPid(rs.getInt(2));
			c.setUid(rs.getInt(3));
			c.setProduct_name(rs.getString(4));
			c.setCategory(rs.getString(5));
			c.setPrice(rs.getDouble(6));
			totalPrice = totalPrice +rs.getDouble(7);
			c.setTotalPrice(totalPrice);
			
			list.add(c);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

	@Override
	public boolean deleteproduct(int pid, int uid) {
		
boolean f=false;
		
		try {
			String sql="delete from product_cart where pid=? and uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			
			
		}
		
		
		return f;
	}
}
