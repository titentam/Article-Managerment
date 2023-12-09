package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bo.LoginBO;

import java.io.IOException;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LoginBO LoginBO = new LoginBO();
    
    public  void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isValid = (boolean)LoginBO.isValidUser(username, password)[0];
        if (isValid) {
            int role= (int)LoginBO.isValidUser(username, password)[1];
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } else {
            //response.sendRedirect("Login/Login.jsp");
            request.setAttribute("loginMessage", "Invalid username or password");
            RequestDispatcher rd = request.getRequestDispatcher("Login/Login.jsp");
            rd.forward(request, response);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    	
    	if (requestURI.equals("/WebAM/login")) {
    		path += "/Login/Login.jsp";
    		response.sendRedirect(path);
       } else if (requestURI.equals("/WebAM/logout")) {
           HttpSession session = request.getSession();
           if (session != null) {
               session.invalidate();
           }
           
           path += "/Login/Login.jsp";
   			response.sendRedirect(path);
       }
    }

}
