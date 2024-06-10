package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DB_Connect;
import com.Dao.CartDAOImpl;
import com.Dao.ProductOrderDAO;
import com.Dao.ProductOrderDAOImpl;
import com.entity.product_cart;
import com.entity.productorder;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

			CartDAOImpl dao = new CartDAOImpl(DB_Connect.getConn());

			List<product_cart> plist = dao.getProductByUser(id);

			if (plist.isEmpty()) {
				session.setAttribute("failedMsg", "Please Add Product ");
				resp.sendRedirect("Cart.jsp");

			} else {

			   ProductOrderDAOImpl dao2 = new ProductOrderDAOImpl(DB_Connect.getConn());
				int i = dao2.getOrderNo();
				productorder o = new productorder();
				ArrayList<productorder> orderList = new ArrayList<productorder>();

				for (product_cart c : plist) {

					o.setOrderId("P-00" + i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setFulladd(fullAdd);
					o.setProductname(c.getProduct_name());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;
				}

				if ("noselect".equals(paymentType)) {

					session.setAttribute("failedMsg", "Please Choose Payment Method ");
					resp.sendRedirect("Cart.jsp");
				}

				else {

					Boolean f = dao2.saveOrder(orderList);
					if (f) {
						if ("CARD PAYMENT".equals(paymentType)) {
							req.getRequestDispatcher("/emailsending").forward(req, resp);
						} else if ("COD".equals(paymentType)) {
							req.getRequestDispatcher("/emailsending").forward(req, resp);
						}
					} else {
						session.setAttribute("failedMsg", "Something went wrong ");
						resp.sendRedirect("Cart.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
