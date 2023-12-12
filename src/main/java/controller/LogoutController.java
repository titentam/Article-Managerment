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

@WebServlet(urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final LoginBO LoginBO = new LoginBO();
    
    public  void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();

        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        path += "/client/article";
        response.sendRedirect(path);

    }

}
