
package com.Dao;

import java.util.List;

import com.entity.product_dtls;

public interface ProductDAO {
	
public boolean addProducts(product_dtls p);

public List<product_dtls> getAllProducts();

public product_dtls getProductId(int id);

public boolean EditProducts(product_dtls b);

public boolean deleteProduct(int id);

public List<product_dtls> getNewLaunch();

public List<product_dtls> getAllhaircareprodcts();

public List<product_dtls> getAllbodycareprodcts();

public List<product_dtls> getAllpersonalcareprodcts();

public List<product_dtls> getAllskincareprodcts();

public List<product_dtls> getAllfitnesscareprodcts();

public List<product_dtls> getProductBySearch(String ch);
}
