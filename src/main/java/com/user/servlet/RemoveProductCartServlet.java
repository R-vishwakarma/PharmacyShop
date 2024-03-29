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
@WebServlet("/remove_product")
public class RemoveProductCartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid=Integer.parseInt(req.getParameter("pid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		
		CartDAOImpl dao = new CartDAOImpl(DB_Connect.getConn());
		boolean f=dao.deleteproduct(pid,uid);
	     
		HttpSession session=req.getSession();
		if(f) {
			
			session.setAttribute("succMsg", "Product Removed From Cart...");
			resp.sendRedirect("Cart.jsp");
		}else {
			session.setAttribute("failedMsg", " Something Went Wrong...");
			resp.sendRedirect("Cart.jsp");
		}
	}
	
	
}
