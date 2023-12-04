package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.ArticleBO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin/article")
public class ArticleController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if(action!=null){
            switch (action) {
                case "detail":
                    detail(request,response);
                    break;

            }

        }
        else{
            var articleBO = new ArticleBO();
            var list = articleBO.getList();
            ArrayList<ArrayList<String>> listAuthors = new ArrayList<>();
            for (var item :
                    list) {
                listAuthors.add(articleBO.getAuthors(item.getArticleID()));
            }
            request.setAttribute("list", list);
            request.setAttribute("listAuthors", listAuthors);
            ForwardUrl("/admin/article-list.jsp",request,response);
        }
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("articleID");
        var articleBO = new ArticleBO();
        var record = articleBO.getArticle(id);

        request.setAttribute("record",record);
        ForwardUrl("/admin/article-detail.jsp",request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
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
