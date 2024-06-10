package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.product_dtls;

public class ProductDAOimpl implements ProductDAO {
	private Connection conn;

	public ProductDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addProducts(product_dtls p) {
		boolean f = false;
		try {
			String sql = "insert into product_dtls(product_name,category,brand_name,price,photo) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProduct_name());
			ps.setString(2, p.getCategory());
			ps.setString(3, p.getBrand_name());
			ps.setString(4, p.getPhoto());
			ps.setString(5, p.getPrice());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public List<product_dtls> getAllProducts() {
		List<product_dtls> list = new ArrayList<product_dtls>();
		product_dtls b = null;

		try {

			String sql = "select * from product_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public product_dtls getProductId(int id) {
		product_dtls b = null;
		try {

			String sql = "select * from product_dtls where product_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean deleteProduct(int id) {
		boolean f = false;

		try {

			String sql = "delete from product_dtls where product_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public boolean EditProducts(product_dtls b) {
		boolean f = false;
		try {
			String sql = "update product_dtls set product_name=?,category=?,brand_name=?,price=? where product_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getProduct_name());
			ps.setString(2, b.getCategory());
			ps.setString(3, b.getBrand_name());
			ps.setString(4, b.getPrice());

			ps.setInt(5, b.getProduct_id());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public List<product_dtls> getNewLaunch() {
		List<product_dtls> list = new ArrayList<>();
		product_dtls b = null;
		try {
			String sql = "SELECT * FROM product_dtls WHERE category = ? ORDER BY product_id DESC ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Launch");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product_dtls> getAllhaircareprodcts() {
		List<product_dtls> list = new ArrayList<>();
		product_dtls b = null;
		try {
			String sql = "SELECT * FROM product_dtls WHERE category = ? ORDER BY product_id DESC ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Hair Care");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product_dtls> getAllbodycareprodcts() {
		List<product_dtls> list = new ArrayList<>();
		product_dtls b = null;
		try {
			String sql = "SELECT * FROM product_dtls WHERE category = ? ORDER BY product_id DESC ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Baby Care");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product_dtls> getAllpersonalcareprodcts() {
		List<product_dtls> list = new ArrayList<>();
		product_dtls b = null;
		try {
			String sql = "SELECT * FROM product_dtls WHERE category = ? ORDER BY product_id DESC ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Personal Care");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product_dtls> getAllskincareprodcts() {
		List<product_dtls> list = new ArrayList<>();
		product_dtls b = null;
		try {
			String sql = "SELECT * FROM product_dtls WHERE category = ? ORDER BY product_id DESC ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Skin Care");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product_dtls> getAllfitnesscareprodcts() {
		List<product_dtls> list = new ArrayList<>();
		product_dtls b = null;
		try {
			String sql = "SELECT * FROM product_dtls WHERE category = ? ORDER BY product_id DESC ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Fitness");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product_dtls> getProductBySearch(String ch) {
		List<product_dtls> list = new ArrayList<product_dtls>();
		product_dtls b = null;

		try {
			String sql = "select * from product_dtls  where product_name like ? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new product_dtls();
				b.setProduct_id(rs.getInt(1));
				b.setProduct_name(rs.getString(2));
				b.setCategory(rs.getString(3));
				b.setBrand_name(rs.getString(4));
				b.setPhoto(rs.getString(5));
				b.setPrice(rs.getString(6));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
