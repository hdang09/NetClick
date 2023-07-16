/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.MovieDAO;
import dao.PaymentDAO;
import dto.AccountDTO;
import dto.MovieDTO;
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
public class SubscriptionController extends HttpServlet {

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
        final String SUBSCRIPTION_PAGE = "subscription.jsp";
        final String SUBSCRIPTION_PLAN_PAGE = "/subscription-plan";
        final String ERROR_PAGE = "404";
        final String MOVIE_PAGE = "/movie";
        
        PaymentDAO paymentDAO = new PaymentDAO();
        MovieDAO movieDAO = new MovieDAO();
        
        HttpSession session = request.getSession();
        
        // Handle id param not exists
        String movieIDParam = request.getParameter("movieID");
        if (movieIDParam == null) {
            request.getRequestDispatcher(ERROR_PAGE).forward(request, response);
            return;
        }
        int id = Integer.parseInt(movieIDParam);
        session.setAttribute("movieID", id);
        
        // Check if user has logined or not
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        if (account == null || account.isBan()) {
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
            return;
        }
        
        // Check if user has choose subscription plan
        int accountID = account.getId();
        boolean isChooseSubscriptionPlan = paymentDAO.isChooseSubscriptionPlan(accountID);
        if (!isChooseSubscriptionPlan) {
            request.getRequestDispatcher(SUBSCRIPTION_PAGE).forward(request, response);
            return;
        }
        
        // Check if user has purchased subscription
        boolean isPurchased = paymentDAO.isPurchased(accountID);
        if (!isPurchased) {
            response.sendRedirect(SUBSCRIPTION_PLAN_PAGE + movieIDParam);
            return;
        }
        
        
        
        // Move to movie page
        MovieDTO movie = movieDAO.getById(id);
        request.setAttribute("movie", movie);
        response.sendRedirect(MOVIE_PAGE + "?id=" + id);
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
