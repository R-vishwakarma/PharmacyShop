
package com.Dao;

import java.util.List;

import com.entity.product_cart;

public interface CartDAO {

	public boolean addCart(product_cart c);

	public List<product_cart> getProductByUser(int userId);

	public boolean deleteproduct(int pid, int uid);
}
