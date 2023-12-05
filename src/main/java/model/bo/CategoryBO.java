package model.bo;

import model.bean.Category;
import model.dao.ArticleDAO;
import model.dao.CategoryDAO;

import java.util.ArrayList;

public class CategoryBO {
    private CategoryDAO dao;
    public CategoryBO(){
        dao = new CategoryDAO();
    }
    public ArrayList<Category> getList(){
        return dao.getList();
    }

}

