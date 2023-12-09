package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import model.bo.RegisterBO;

import java.sql.Date;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final RegisterBO RegisterBO =new RegisterBO();
    public  void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, java.io.IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            RegisterBO.register(username, password,name, email, Date.valueOf(dob), gender);
            response.sendRedirect("Login/Login.jsp");
        }
        catch (Exception e){
            HttpSession session = request.getSession();
            session.setAttribute("errormessage", e.getMessage());
            response.sendRedirect("Login/Register.jsp");
        }

    }

}
