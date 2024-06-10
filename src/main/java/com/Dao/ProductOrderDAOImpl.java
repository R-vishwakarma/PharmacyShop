package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.productorder;

public class ProductOrderDAOImpl implements ProductOrderDAO  {

	

	private Connection conn;

	public ProductOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	@Override
	public int getOrderNo() {
		int i = 1;
		try {

			String sql = "select * from orders ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	@Override
	public boolean saveOrder(List<productorder> plist) {

		boolean f = false;
		try {
			String sql = "insert into orders(order_id,user_name,email,address,phone,product_name,price,paymentmode) values(?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            
            PreparedStatement ps = conn.prepareStatement(sql);
            for(productorder b:plist) {
            	ps.setString(1, b.getOrderId());
            	ps.setString(2, b.getUserName());
            	ps.setString(3, b.getEmail());
            	ps.setString(4, b.getFulladd());
            	ps.setString(5, b.getPhone());
            	ps.setString(6, b.getProductname());
            	ps.setString(7, b.getPrice());
            	ps.setString(8, b.getPaymentType());
            	ps.addBatch();
            	
            }
		int [] count=	ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<productorder> getProduct(String email) {
		List<productorder> list = new ArrayList<productorder>();
		productorder o=null;
		
		try {
			String sql="select * from orders where email=?";
			   PreparedStatement ps = conn.prepareStatement(sql);
			   ps.setString(1, email);
			   ResultSet rs =ps.executeQuery();
			   while (rs.next()) {
				   o =new productorder();
				   o.setId(rs.getInt(1));
				   o.setOrderId(rs.getString(2));
				   o.setUserName(rs.getString(3));
				   o.setEmail(rs.getString(4));
				   o.setFulladd(rs.getString(5));
				   o.setPhone(rs.getString(6));
				   o.setProductname(rs.getString(7));
				   o.setPrice(rs.getString(8));
				   o.setPaymentType(rs.getString(9));
				   list.add(o);
				   
			   }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<productorder> getAllOrder() {
		List<productorder> list = new ArrayList<productorder>();
		productorder o=null;
		
		try {
			String sql="select * from orders ";
			   PreparedStatement ps = conn.prepareStatement(sql);
			  
			   ResultSet rs =ps.executeQuery();
			   while (rs.next()) {
				   o =new productorder();
				   o.setId(rs.getInt(1));
				   o.setOrderId(rs.getString(2));
				   o.setUserName(rs.getString(3));
				   o.setEmail(rs.getString(4));
				   o.setFulladd(rs.getString(5));
				   o.setPhone(rs.getString(6));
				   o.setProductname(rs.getString(7));
				   o.setPrice(rs.getString(8));
				   o.setPaymentType(rs.getString(9));
				   list.add(o);
				   
			   }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public boolean deleteOrder(String order_id) {
		boolean f=false;
		try {
			String sql="delete from orders where order_id=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, order_id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	
}
