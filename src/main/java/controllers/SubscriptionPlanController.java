/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.PaymentDAO;
import dto.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class SubscriptionPlanController extends HttpServlet {

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
            out.println("<title>Servlet SubscriptionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubscriptionController at " + request.getContextPath() + "</h1>");
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
        
        final String LOGIN_PAGE = "/login";
        final String SUBSCRIPTION_PLAN_PAGE = "subscription-plan.jsp";
        final String ERROR_PAGE = "/404";

        // Check if user has logined or not
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        if (account == null) {
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
            return;
        }
        
        // Handle if param is null
        String plan = request.getParameter("plan");
        String movieIDParam = request.getParameter("id");
        if (plan == null || movieIDParam == null) {
            request.getRequestDispatcher(ERROR_PAGE).forward(request, response);
            return;
        }
        
        // Handle subscription ID:
        int subscriptionID = Integer.parseInt(plan);
        int accountID = account.getId();
        new PaymentDAO().insertSubscriptionID(accountID, subscriptionID);
        
        session.setAttribute("movieID", movieIDParam);
        request.getRequestDispatcher(SUBSCRIPTION_PLAN_PAGE).forward(request, response);
    }

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
        processRequest(request, response);
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
