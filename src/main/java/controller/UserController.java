package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.User;
import model.bo.UserBO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin/manage-user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserBO userBO = new UserBO();
    public UserController() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action") != null ? request.getParameter("action") : "";
		switch (action) {
		case "list-user":
			getListUser(request, response);
			break;
		case "user-update":
		case "user-delete":
			getUserDetail(action, request, response);
			break;
		case "submit-update":
			updateUser(request, response);
			break;
		case "submit-delete":
			deleteUser(request, response);
			break;
		default:
			throw new RuntimeException("Page not found");
		}
	}
	
	protected synchronized void getListUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryRole 
			= request.getParameter("role-category") != null ? request.getParameter("role-category") : "all";
		String searchText = request.getParameter("search-text");
		
		int page = 1;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		
		int pageSize = 2;
		Object[] result = userBO.getAllUser(categoryRole, searchText, page, pageSize);
		ArrayList<User> listUser = (ArrayList<User>) result[0];
		int numOfPage = (int) result[1];
		request.setAttribute("listUser", listUser);
		request.setAttribute("numOfPage", numOfPage);
		request.setAttribute("currentPage", page);
		
		String url = "/admin/user-list.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	protected synchronized void getUserDetail(String action, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		User user = userBO.getUserDetail(username);
		if (user != null) {
			request.setAttribute("user", user);
			String url = "/admin/" + action + ".jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} else {
			throw new RuntimeException("Username is not found");
		}
	}
	
	protected synchronized void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String roleID = request.getParameter("roleID");
		userBO.updateRole(username, roleID);
		
		String url = "/admin/manage-user?action=user-update";
		request.setAttribute("username", username);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	protected synchronized void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		userBO.deleteUser(username);
		
		String url = "/admin/manage-user?action=user-delete";
		request.setAttribute("username", username);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
