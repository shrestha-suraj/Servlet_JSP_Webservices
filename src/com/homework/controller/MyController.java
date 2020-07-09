package com.homework.controller;

import com.homework.domain.Item;
import com.homework.modal.AuthenticateService;
import com.homework.modal.ItemService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class MyController extends HttpServlet {

    AuthenticateService authenticator;
    ItemService itemService;
    HttpSession session;

    @Override
    public void init() throws ServletException {
        authenticator=new AuthenticateService();
        itemService=new ItemService();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String responseUrl="login.jsp";
        boolean help=Boolean.parseBoolean(request.getParameter("help"));
        responseUrl=help?"help.jsp":"login.jsp";
        if(!help){
        }
        RequestDispatcher requestDispatcher=request.getRequestDispatcher(responseUrl);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session=request.getSession();
        String responseUrl="login.jsp";
        String pageName=request.getParameter("page");
        System.out.println(pageName);
        if(pageName.equalsIgnoreCase("login.jsp")){
            String button=request.getParameter("action");
            if(button.equalsIgnoreCase("login")){
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                if(authenticator.authenticateUser(username,password)){
                    responseUrl="items.jsp";
                    request.setAttribute("itemsList",itemService.getItems());
                }else{
                    request.setAttribute("errorMessage","Invalid Username/ Password");
                }
            }
        }else if(pageName.equalsIgnoreCase("items.jsp")){
            responseUrl="items.jsp";
            String button=request.getParameter("action");
            List<String> checkBoxValues=null;
            List<String> quantities=null;
            try{
                checkBoxValues=Arrays.asList(request.getParameterValues("items-checkbox"));
                quantities=Arrays.asList(request.getParameterValues("items-quantities"));
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
            if(button.equalsIgnoreCase("checkout")){
                responseUrl="checkout.jsp";
            }
            request.setAttribute("itemsList",itemService.getItems());
            session.setAttribute("itemsQuantity",quantities);
            session.setAttribute("checkedItems",checkBoxValues);
        }else if(pageName.equalsIgnoreCase("checkout.jsp")){
                String button=request.getParameter("action");
                if(button.equalsIgnoreCase("back to cart")){
                    responseUrl="items.jsp";
                    request.setAttribute("itemsList",itemService.getItems());
                }else if(button.equalsIgnoreCase("checkout")){
                    responseUrl="thankyou.jsp";
                }
        }
        RequestDispatcher requestDispatcher=request.getRequestDispatcher(responseUrl);
        requestDispatcher.forward(request,response);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
