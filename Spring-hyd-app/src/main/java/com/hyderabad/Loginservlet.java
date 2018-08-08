package com.hyderabad;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SpringMvc.LoginService;

@WebServlet(urlPatterns="/login.dodo")
public class Loginservlet extends HttpServlet {
	 
   String name;
   String password;
   private LoginService service = new LoginService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/WEB-INF/views/Login.jsp").forward(request, response);
		}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 name =	request.getParameter("name");
		 password = request.getParameter("password");
		 boolean isValidUser = service.validateUser(name, password);

			if (isValidUser) {
				request.setAttribute("name", name);
				request.getRequestDispatcher("/WEB-INF/views/Welcome.jsp").forward(request, response);
			} else {
				request.setAttribute("errorMessage", "Invalid Credentials!!");
				request.getRequestDispatcher("/WEB-INF/views/Login.jsp").forward(request, response);
			}

	}

	
	

}
