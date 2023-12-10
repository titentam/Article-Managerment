package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.bean.Article;
import model.bean.User;
import model.bo.ArticleBO;
import model.bo.CategoryBO;
import model.bo.CommentBO;
import model.bo.UserBO;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet("/admin/category")
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var user = checkLogin(request,response);
        if(user==null){
            sendDirect(request,response);
        }
        else{
            this.ShowList(request,response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action!=null){
            switch (action) {
                case "submitInsert":
                    submitInsert(request,response);
                    break;
                case "submitUpdate":
                    submitUpdate(request,response);
                    break;
            }
        }
    }

    private void ShowList(HttpServletRequest request, HttpServletResponse response){


        var categoryBO = new CategoryBO();
        var categories = categoryBO.getList();
        request.setAttribute("categories",categories);
        ForwardUrl("/admin/category-list.jsp",request,response);
    }

    private void submitInsert(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        new CategoryBO().insert(name);
        this.ShowList(request,response);
    }

    private void submitUpdate(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("categoryID");
        String name = request.getParameter("name");
        new CategoryBO().update(id,name);
        this.ShowList(request,response);
    }
    private User checkLogin(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();

        var username = session.getAttribute("username");
        if(username!=null){
           var user =  new UserBO().getUserDetail(username.toString());
           if(user.getRoleID().equals("R1")){
               session.setAttribute("user",user);
               return user;
           }

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
    
    private void ForwardUrl(String url,HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher rd = request.getServletContext().getRequestDispatcher(url);
        try {
            rd.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
