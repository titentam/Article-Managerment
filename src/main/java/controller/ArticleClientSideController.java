package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Article;
import model.bean.Category;
import model.bo.ArticleBO;
import model.bo.CategoryBO;
import model.bo.CommentBO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/client/article")
public class ArticleClientSideController extends HttpServlet {
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
           listTop5Articles(request,response);
        }
    }
    private void listTop5Articles(HttpServletRequest request, HttpServletResponse response) {
        var articleBO = new ArticleBO();
        var categoryBO=new CategoryBO();
        String categoryName = request.getParameter("categoryName");
        if (categoryName==null) categoryName="Giải trí";
        ArrayList<Article> top5Articles = articleBO.getTop5ArticlesByTime();
        ArrayList<ArrayList<String>> listAuthorsTop5 = new ArrayList<>();
        for (var item : top5Articles) {
            listAuthorsTop5.add(articleBO.getAuthors(item.getArticleID()));
        }
        request.setAttribute("top5Articles", top5Articles);
        request.setAttribute("listAuthorsTop5", listAuthorsTop5);

        ArrayList<Article> top3MostPopular = articleBO.getTop3MostPopular();
        ArrayList<ArrayList<String>> listAuthorsTop3MostPopular = new ArrayList<>();
        for (var item : top3MostPopular) {
            listAuthorsTop3MostPopular.add(articleBO.getAuthors(item.getArticleID()));
        }
        request.setAttribute("top3MostPopular", top3MostPopular);
        request.setAttribute("listAuthorsTop3MostPopular", listAuthorsTop3MostPopular);

        ArrayList<Category> allCategory=categoryBO.getList();
        ArrayList<Article> getArticleByCategpry = articleBO.getArticlesByCategory(categoryName);
        ArrayList<ArrayList<String>> listAuthorsArticleByCategory = new ArrayList<>();
        for (var item : getArticleByCategpry) {
            listAuthorsArticleByCategory.add(articleBO.getAuthors(item.getArticleID()));
        }
        request.setAttribute("listAuthorsArticleByCategory", listAuthorsArticleByCategory);
        request.setAttribute("listCategory", allCategory);
        request.setAttribute("getArticleByCategpry", getArticleByCategpry);
        ForwardUrl("/client/index.jsp", request, response);
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
        ForwardUrl("/client/article-detail.jsp",request,response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action!=null){
            switch (action) {
                case "submitInsert":
                    //submitInsert(request,response);
                    break;
            }

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
