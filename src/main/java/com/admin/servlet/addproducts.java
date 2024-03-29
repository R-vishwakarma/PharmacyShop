package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DB_Connect;
import com.Dao.ProductDAOimpl;
import com.entity.product_dtls;


@WebServlet("/addproduct")
@MultipartConfig
public class addproducts extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
            String product_name = req.getParameter("pname");
			String categories = req.getParameter("ptype");
			String brand = req.getParameter("pbrand");
			Part part = req.getPart("pimg");
			String price = req.getParameter("price");
			String fileName = part.getSubmittedFileName();
		      
			product_dtls p= new product_dtls(product_name,categories,brand,price,fileName);
		      
		      ProductDAOimpl dao = new ProductDAOimpl(DB_Connect.getConn());

		      boolean f = dao.addProducts(p);
		      HttpSession session = req.getSession();
		      
		    if (f){
		          
		            String path =getServletContext().getRealPath("")+"product";
		           
		          java.io.File file=new java.io.File(path);
		          
		          part.write(path+java.io.File.separator+fileName);
		      
		        
		        session.setAttribute("succMsg", "Product Added Successfully");
		        resp.sendRedirect("admin/add_product.jsp");
		      } else {
		        session.setAttribute("failedMsg", "Failed To Add Product");
		        resp.sendRedirect("admin/add_product.jsp");
		      }
		      
		    
		      
		      
		      
		    }catch(Exception e) {
		      e.printStackTrace();
		      
		    }
		
		
	}

}
