package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.Role;
import model.bean.User;
import model.bo.RoleBO;
import model.bo.UserBO;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/admin/manage-user", "/client/account"})

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserBO userBO = new UserBO();
    public UserController() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var user = checkLogin(request,response);
		if(user==null){
			sendDirect(request,response);
		}else{
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action") != null ? request.getParameter("action") : "";
		
		switch (action) {
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
		case "account-setting":
			getUserDetail(request, response);
			break;
		case "update":
			updateAccount(request, response);
			break;
		case "change-password":
			updatePassword(request, response);
			break;
		default:
			getListUser(request, response);
		}
	}
	
	protected synchronized void getListUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryRole = request.getParameter("role-category") != null ? request.getParameter("role-category") : "all";
		String searchText = request.getParameter("search-text");
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		
		int pageSize = 5;
		Object[] result = userBO.getAllUser(categoryRole, searchText, page, pageSize);
		ArrayList<User> listUser = (ArrayList<User>) result[0];
		int numOfPage = (int) result[1];
		ArrayList<Role> listRole = new RoleBO().getAllRole();
		
		request.setAttribute("listUser", listUser);
		request.setAttribute("listRole", listRole);
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
			ArrayList<Role> listRole = new RoleBO().getAllRole();
			request.setAttribute("listRole", listRole);
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
	
	// Cho phía user
	protected synchronized void getUserDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		if (username != null) {
			User user = userBO.getUserDetail(username);
			request.setAttribute("user", user);
			
			String url = "/client/account-setting.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} else {
			String url = "/login";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}
	
	protected synchronized void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String dobStr = request.getParameter("dob");
		String genderStr = request.getParameter("gender");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int gender = Integer.parseInt(genderStr);
		java.util.Date dob;
		try {
			dob = format.parse(dobStr);
		} catch (ParseException e) {
			dob = new java.util.Date(System.currentTimeMillis());
		}
		
		User user = new User(username, null, name, email, dob, gender, null);
		userBO.updateUser(user);
		request.setAttribute("update-message", "Cập nhật thành công!");
		getUserDetail(request, response);
	}
	
	protected synchronized void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		
		boolean isCorrectPass = userBO.updatePassword(username, oldPassword, newPassword);
		if (!isCorrectPass)
			request.setAttribute("pass-message", "Mật khẩu không đúng!");
		else {
			request.setAttribute("pass-message", "Cập nhật thành công!");
		}
		
		getUserDetail(request, response);
	}
	private User checkLogin(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();

		var username = session.getAttribute("username");
		if(username!=null){
			return new UserBO().getUserDetail(username.toString());

		}
		return null;
	}

	private void sendDirect(HttpServletRequest request, HttpServletResponse response){
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		try {
			response.sendRedirect(path+"/login");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
}
