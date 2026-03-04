//package com.futurecart.servlet;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//import com.futurecart.business.BrandListBusiness;
//import com.futurecart.model.Brand;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/brandList")
//public class BrandListServlet extends HttpServlet {
//	
//	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
//		
//        BrandListBusiness ref = new BrandListBusiness();
//
//        ArrayList<Brand> brand = ref.getAllBrand();
//
//        req.setAttribute("brands", brand);
//        
//        res.sendRedirect("adminDashboard?msg=brand_added");
//
//	}
//
//}
