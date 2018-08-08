package com.desk.pkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Add
 */
@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//Integer i= Integer.parseInt(request.getParameter("t1"));
	//int j= Integer.parseInt(request.getParameter("t2"));
	//int k=i+j;
	
		
	//PrintWriter out=response.getWriter();
	 
		// out.print(k);
		 
//	RequestDispatcher rd= request.getRequestDispatcher("sub");
//	rd.forward(request, response);
	
	//HttpSession session=request.getSession();
//	session.setAttribute("t1",i.toString());
	String s= request.getParameter("t1");
		
		
	Cookie cookie =new Cookie("cook", s);
	response.addCookie(cookie);
	
	response.sendRedirect("sub");
	//out.print(k);
	//response.getOutputStream().print(k);
	
	}
	
    public Add() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
