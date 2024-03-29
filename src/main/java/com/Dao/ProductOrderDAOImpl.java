package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<productorder> getAllOrder() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean deleteOrder(String order_id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	
}
