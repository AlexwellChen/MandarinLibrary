package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import instance.Librarian;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String psd = request.getParameter("psd");
		String role = request.getParameter("role");
		System.out.println(username);
		System.out.println(psd);
		System.out.println(role);
		if (role.equals("librarian")) {
			try {
				if(Librarian.login(username, psd)) {
					System.out.println("OK");
			
					request.getSession().setAttribute("username", username);
					
					response.sendRedirect(request.getContextPath() + "/librarian/librarian.jsp");
				}
				else {
					System.out.println("SELECT count(*) num FROM Librarian where AcntNum='"+username+"'");
				}
			
//				request.getRequestDispatcher("/reader/reader.jsp").forward(request, response);
				
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
