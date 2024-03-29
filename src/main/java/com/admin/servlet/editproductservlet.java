package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DB_Connect;
import com.Dao.ProductDAOimpl;
import com.entity.product_dtls;
@WebServlet("/editproduct")

public class editproductservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
		      
		      int id=Integer.parseInt(req.getParameter("id"));
		      String productName = req.getParameter("pname");
		      String brand = req.getParameter("pbrand");
		      String price = req.getParameter("price");
		      String category = req.getParameter("ptype");
		     
		      
		     product_dtls b=new product_dtls();
		      b.setProduct_id(id);
		      b.setProduct_name(productName);
		      b.setBrand_name(brand);
		      b.setPrice(price);
		      b.setCategory(category);
		
		      
		      
		      ProductDAOimpl dao=new ProductDAOimpl(DB_Connect.getConn());
		      boolean f=dao.EditProducts(b);
		      HttpSession session=req.getSession();
		      
		      
		      if(f){
		        
		        session.setAttribute("succMsg", "Product Updated...");
		        resp.sendRedirect("admin//manage_product.jsp");
		      }else {
		        
		        session.setAttribute("failedMsg", "Something went wrong!!!");
		        resp.sendRedirect("admin//manage_product.jsp");
		        
		      }
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    }

		
	}

}
