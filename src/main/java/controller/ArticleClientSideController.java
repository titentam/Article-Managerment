package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.Article;
import model.bean.Category;
import model.bean.Comment;
import model.bo.ArticleBO;
import model.bo.CategoryBO;
import model.bo.CommentBO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
                case "category":
                    category(request,response);
                    break;
                case "list-article":
                	showList(request,response);
                    break;
            }
        }
        else{
           listTop5Articles(request,response);
        }
    }
    private void showList(HttpServletRequest request, HttpServletResponse response){
		String searchText = request.getParameter("search-text");
		String category = request.getParameter("category") != null ? request.getParameter("category") : "all";
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    	
		int pageSize = 2;
    	var articleBO = new ArticleBO();
        var categoryBO = new CategoryBO();
        var result = articleBO.getList(category, "none", searchText, page, pageSize);
        var numOfPage = (int) result[1];
        var categories = categoryBO.getList();
        
        var listArticle = (ArrayList<Article>) result[0];
        ArrayList<ArrayList<String>> listAuthors = new ArrayList<>();
        for (var item : listArticle) {
            listAuthors.add(articleBO.getAuthors(item.getArticleID()));
        }
        ArrayList<Article> top5Articles = articleBO.getTop5ArticlesByTime();

        request.setAttribute("categories", categories);
        request.setAttribute("listArticle", listArticle);
        request.setAttribute("listAuthors", listAuthors);
        request.setAttribute("numOfPage", numOfPage);
		request.setAttribute("currentPage", page);
		request.setAttribute("top5Articles", top5Articles);
        ForwardUrl("/client/blog.jsp",request,response);
    }

    private void category(HttpServletRequest request, HttpServletResponse response) {
        Map<Category,ArrayList<Article>> map = new HashMap<>();
        var categoryBO = new CategoryBO();
        var articleBO = new ArticleBO();
        var categories = categoryBO.getList();
        for (var category:categories) {
            var articles = articleBO.getList(category.getCategoryID(),"none",null);
            map.put(category,articles);
        }
        request.setAttribute("map",map);
        ForwardUrl("/client/category.jsp",request,response);
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

        Map<Category,ArrayList<Article>> map = new HashMap<>();
        var categories = categoryBO.getList();
        for (var category:categories) {
            var articles = articleBO.getList(category.getCategoryID(),"none",null);
            map.put(category,articles);
        }
        request.setAttribute("map",map);
        ForwardUrl("/client/index.jsp", request, response);
    }


    private void detail(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("articleID");
        this.showDetail(id,request,response);
    }

    private void showDetail(String id,HttpServletRequest request, HttpServletResponse response){
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
                case "submitComment":
                    submitComment(request,response);
                    break;
            }

        }
    }

    private void submitComment(HttpServletRequest request, HttpServletResponse response) {
        var articleID = request.getParameter("articleID");
        var username = request.getParameter("username");
        var comment = request.getParameter("comment");

        new CommentBO().insert(new Comment(username,articleID,comment));
        this.showDetail(articleID,request,response);
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
