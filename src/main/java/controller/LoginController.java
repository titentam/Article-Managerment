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

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LoginBO LoginBO = new LoginBO();
    
    public  void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        var roleID = LoginBO.getRoleID(username,password);
        if (roleID!=null) {
            String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", roleID);
            if(roleID.equals("R1")) // admin
            {
                response.sendRedirect(path+ "/admin/article");
            }
            else{
                response.sendRedirect(path+ "/client/article");
            }

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("errormessage", "Invalid username or password");
            response.sendRedirect("Login/Login.jsp");

        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

        path += "/Login/Login.jsp";
        response.sendRedirect(path);
    }
    private void ForwardUrl(String url,HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher rd = request.getServletContext().getRequestDispatcher(url);
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

}
