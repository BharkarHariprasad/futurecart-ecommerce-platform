//package com.futurecart.servlet;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//import com.futurecart.business.CategoryListBusiness;
//import com.futurecart.model.Category;
//
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/categoryList")
//public class CategoryListServlet extends HttpServlet {
//
//    @Override
//    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        CategoryListBusiness ref = new CategoryListBusiness();
//
//        ArrayList<Category> categories = ref.getAllCategories();
//
//        req.setAttribute("categories", categories);
//
////        try {
////            req.getRequestDispatcher("adminDashboard.jsp").forward(req, res);
////        } catch (Exception e) {
////            e.printStackTrace();
////        }
//    }
//}