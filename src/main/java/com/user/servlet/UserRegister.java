package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			//Send Data user to Server
			String fullName=req.getParameter("fullname");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			//Create entity class object
			User u = new User(fullName, email, password);
			//Create dao class Object
			UserDao dao=new UserDao(DBConnect.getConn());
			
			//call dao method for register and pass entity object
			boolean f=dao.register(u);
			//Create Session for sate management
			HttpSession session = req.getSession();
			
			//code run message
			
			if(f) {
				//set here session
				session.setAttribute("sucMsg", "Register Successful");
				//show the values page
				resp.sendRedirect("signup.jsp");
				
			}else{
				//set here session
				session.setAttribute("errorMsg", "Somthin wrong on server");
				//show the values page
				resp.sendRedirect("signup.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
