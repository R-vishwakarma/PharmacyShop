package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DB_Connect;
import com.Dao.CartDAOImpl;
import com.Dao.ProductDAOimpl;
import com.entity.product_cart;
import com.entity.product_dtls;


@WebServlet("/cart")

public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int pid=Integer.parseInt(req.getParameter("pid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());
			product_dtls b=dao.getProductId(pid);
			
			product_cart c= new product_cart();
			c.setPid(pid);
			c.setUid(uid);
			c.setProduct_name(b.getProduct_name());
			c.setCategory(b.getCategory());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2 =new CartDAOImpl(DB_Connect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				
				
				session.setAttribute("addCart", "Product added to cart..");
				resp.sendRedirect("Cart.jsp");
				
			}else {
				
				session.setAttribute("addCart", "Something went wrong!!");
				resp.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
             e.printStackTrace();
		}
		
	}
	
}
