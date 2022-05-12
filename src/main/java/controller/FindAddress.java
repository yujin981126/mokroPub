package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import vo.*;
import java.util.*;

@WebServlet("/FindAddress")
public class FindAddress extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login/register.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String searchAddr = request.getParameter("address");
			
			RegisterDao rd = new RegisterDao();
			List<Map<String, Object>> list = null;
			
			try {
				list = rd.selectAddressListBySearch(searchAddr);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("searchList", list);
			request.getRequestDispatcher("/WEB-INF/view/login/register.jsp").forward(request, response);
		
	}

}
