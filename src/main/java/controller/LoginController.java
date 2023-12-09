package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bo.ArticleBO;
import model.bo.LoginBO;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LoginBO LoginBO =new LoginBO();
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
        response.sendRedirect("Login/Login.jsp");
    }

}
