package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bo.ArticleBO;
import model.bo.CategoryBO;
import model.bo.CommentBO;

import java.awt.image.CropImageFilter;
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
                case "insert":
                    insert(request,response);
                    break;
            }

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

            }

        }
    }

    private void ShowList(HttpServletRequest request, HttpServletResponse response){
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

    private void insert(HttpServletRequest request, HttpServletResponse response) {
        var categoryBO = new CategoryBO();
        var categories = categoryBO.getList();
        request.setAttribute("categories", categories);
        ForwardUrl("/admin/article-form.jsp",request,response);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("articleID");
        var articleBO = new ArticleBO();
        var commentBO = new CommentBO();
        var record = articleBO.getArticle(id);
        var authors = articleBO.getAuthors(id);
        var comments = commentBO.getCommentsArticle(id);

        request.setAttribute("record",record);
        request.setAttribute("authors",authors);
        request.setAttribute("comments",comments);
        ForwardUrl("/admin/article-detail.jsp",request,response);
    }

    private void submitInsert(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        var articleBO = new ArticleBO();
        articleBO.insert(title,content,category);

        this.ShowList(request,response);

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
