/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.MovieDAO;
import dao.ReviewDAO;
import dto.AccountDTO;
import dto.ReviewDTO;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class PreviewController extends HttpServlet {

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
        String movieIDParam = request.getParameter("id");
        int movieID = 0;
        try {
            movieID = Integer.parseInt(movieIDParam);
            forwardToPreviewPage(movieID, request, response);
        } catch (NumberFormatException e) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
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
        final String LOGIN_PAGE = "/login";
        ReviewDAO dao = new ReviewDAO();

        String action = request.getParameter("action");
        switch (action) {
            case "comment":
                // Check if user has logined
                HttpSession session = request.getSession();
                AccountDTO account = (AccountDTO) session.getAttribute("account");
                if (account == null) {
                    response.sendRedirect(LOGIN_PAGE);
                    return;
                }

                // Get review info
                int userID = account.getId();
                
                String movieIDParam = request.getParameter("id");
                int movieID = 0;
                try {
                    movieID = Integer.parseInt(movieIDParam);
                } catch (NumberFormatException e) {
                    request.getRequestDispatcher("404.jsp").forward(request, response);
                }
                
                String comment = request.getParameter("comment");
                
                String ratingParam = request.getParameter("rating");
                if (ratingParam == null) {
                    request.setAttribute("ratingError", "Please rate this movie");
                    forwardToPreviewPage(movieID, request, response);
                    return;
                }
                int rating = 0;
                try {
                    rating = Integer.parseInt(ratingParam);
                } catch (NumberFormatException e) {
                    request.getRequestDispatcher("404.jsp").forward(request, response);
                }
                
                ReviewDTO review = new ReviewDTO(movieID, userID, comment, rating);

                // Add commnent
                dao.addComment(review);
                forwardToPreviewPage(movieID, request, response);
                break;

            default:
                request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }

    public void forwardToPreviewPage(int movieID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieDAO movieDAO = new MovieDAO();
        request.setAttribute("movie", movieDAO.getById(movieID));
        request.setAttribute("reviews", new ReviewDAO().getReviewByMovieID(movieID));
        request.setAttribute("related", movieDAO.getRelatedByTag(movieID));
        request.getRequestDispatcher("preview.jsp").forward(request, response);
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
