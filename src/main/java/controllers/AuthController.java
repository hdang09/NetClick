/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
*/
package controllers;

import dao.AccountDAO;
import dto.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
*
* @author Admin
*/
public class AuthController extends HttpServlet {

/**
* Processes requests for both HTTP <code>GET</code> and <code>POST</code>
* methods.
*
* @param request servlet request
* @param response servlet response
* @throws ServletException if a servlet-specific error occurs
* @throws IOException if an I/O error occurs
*/
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AuthController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
    * Handles the HTTP <code>GET</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("user");
            String password = request.getParameter("pass");
            String re_pass = request.getParameter("repass");
            if(!password.equals(re_pass)){
            response.sendRedirect("/login.jsp");
            } else {
            AccountDAO accountdao = new AccountDAO();
            AccountDTO a = accountdao.checkAccountExist(username);
            if (a == null) {
            accountdao.register(username, password);
            response.sendRedirect("/register.jsp");
            } else {
            response.sendRedirect("/login.jsp");
            }
    

    }}

    /**
    * Handles the HTTP <code>POST</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
            String username = request.getParameter("user");
            String password = request.getParameter("pass");
            AccountDAO accountdao = new AccountDAO();
            AccountDTO user = accountdao.login(username, password);
                if (user != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("tendangnhap", username);
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/index.jsp");
                    dispatch.forward(request, response);
            } else {
                    request.setAttribute("mess", "Wrong user or password");
                    RequestDispatcher dispatch= getServletContext().getRequestDispatcher("/login.jsp");
                    dispatch.forward(request, response);
            }
    }


    // REGISTER
    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
            String username = request.getParameter("user");
            String password = request.getParameter("pass");
            String re_pass = request.getParameter("repass");
            if(!password.equals(re_pass)){
            response.sendRedirect("/login.jsp");
            } else {
            AccountDAO accountdao = new AccountDAO();
            AccountDTO a = accountdao.checkAccountExist(username);
            if (a == null) {
            accountdao.register(username, password);
            response.sendRedirect("/register.jsp");
            } else {
            response.sendRedirect("/login.jsp");
            }
    }
    }


    /**
    * Returns a short description of the servlet.
    *
    * @return a String containing servlet description
    */
    @Override
    public String getServletInfo() {
    return "Short description";
    }// </editor-fold>

}