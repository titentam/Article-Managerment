package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.bean.Article;
import model.bo.ArticleBO;
import model.bo.CategoryBO;
import model.bo.CommentBO;

import java.awt.image.CropImageFilter;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet("/admin/article")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
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
                case "update":
                    update(request,response);
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
                case "submitUpdate":
                    submitUpdate(request,response);
                    break;
                case "submitDelete":
                    submitDelete(request,response);
                    break;
                case "submitLock":
                    submitLock(request,response);
                    break;
            }

        }
    }

    private void ShowList(HttpServletRequest request, HttpServletResponse response){
    	String category = request.getParameter("category") != null ? request.getParameter("category") : "all";
    	String sortBy = request.getParameter("sort-by") != null ? request.getParameter("sort-by") : "none";
		String searchText = request.getParameter("search-text");
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    	
		int pageSize = 2;
    	var articleBO = new ArticleBO();
        var categoryBO = new CategoryBO();
        var result = articleBO.getList(category, sortBy, searchText, page, pageSize);
		var list = (ArrayList<Article>) result[0];
        var numOfPage = (int) result[1];
        var categories = categoryBO.getList();
        
        ArrayList<ArrayList<String>> listAuthors = new ArrayList<>();
        for (var item : list) {
            listAuthors.add(articleBO.getAuthors(item.getArticleID()));
        }

        request.setAttribute("categories", categories);
        request.setAttribute("list", list);
        request.setAttribute("listAuthors", listAuthors);
        request.setAttribute("numOfPage", numOfPage);
		request.setAttribute("currentPage", page);
        ForwardUrl("/admin/article-list.jsp",request,response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) {
        var categoryBO = new CategoryBO();
        var categories = categoryBO.getList();
        request.setAttribute("categories", categories);
        request.setAttribute("function", "Thêm");
        request.setAttribute("action", "submitInsert");
        ForwardUrl("/admin/article-form.jsp",request,response);
    }
    private void update(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("articleID");

        var categoryBO = new CategoryBO();
        var articleBO = new ArticleBO();
        var categories = categoryBO.getList();
        var article = articleBO.getArticle(id);

        request.setAttribute("categories", categories);
        request.setAttribute("function", "Cập nhật");
        request.setAttribute("action", "submitUpdate");
        request.setAttribute("article", article);

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
        String[] categories = request.getParameterValues("category[]");
        String fileName = processImageFile(request,response);
        var articleBO = new ArticleBO();
        articleBO.insert(title,content,fileName,categories);

        this.ShowList(request,response);

    }

    private String processImageFile(HttpServletRequest request, HttpServletResponse response){
        /* Receive file uploaded to the Servlet from the HTML5 form */
        try {
            Part filePart = request.getPart("thumbnail");
            String fileName = filePart.getSubmittedFileName();
            if(fileName.isEmpty()) return "default.jpg";

            String tmp = request.getServletContext().getRealPath("/");

            Path path = Paths.get(tmp).getParent().getParent();
            String uploadDirectory = path.toString() +"\\src\\main\\webapp\\img\\" ;

            filePart.write(uploadDirectory + fileName);
            return fileName;
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
    private void submitUpdate(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("articleID");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String[] categories = request.getParameterValues("category[]");
        String fileName = processImageFile(request,response);

        var articleBO = new ArticleBO();
        articleBO.update(new Article(id, title, content,fileName), new ArrayList<>(Arrays.asList(categories)));

        this.ShowList(request, response);
    }
    
    private void submitLock(HttpServletRequest request, HttpServletResponse response) {
        boolean locked = Boolean.parseBoolean(request.getParameter("locked"));
    	String id = request.getParameter("articleID");
    	new ArticleBO().updateLock(id, locked);

        this.detail(request, response);
    }
    private void submitDelete(HttpServletRequest request, HttpServletResponse response) {
        String articleID = request.getParameter("articleID");
        var articleBO = new ArticleBO();
        articleBO.deleteArticle(articleID);

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
