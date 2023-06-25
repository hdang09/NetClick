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
        // TODO: Opwimize this code
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("movie", new MovieDAO().getById(id));
        request.setAttribute("reviews", new ReviewDAO().getReviewByMovieID(id));
        request.getRequestDispatcher("preview.jsp").forward(request, response);
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
        final int MAX_RATING = 5;
        ReviewDAO dao = new ReviewDAO();

        String action = request.getParameter("action");
        switch (action) {
            case "comment":
                // Check if user login
                HttpSession session = request.getSession();
                AccountDTO account = (AccountDTO) session.getAttribute("account");
                if (account == null) {
                    request.getRequestDispatcher("404.jsp").forward(request, response);
                    return;
                }

                // Get review info
                int userID = account.getId();
                String movieIDParam = request.getParameter("movieID");
                int movieID = 0;
                try {
                    movieID = Integer.parseInt(movieIDParam);
                } catch (Exception e) {
                    request.getRequestDispatcher("404.jsp").forward(request, response);
                }
                String comment = request.getParameter("comment");
                ReviewDTO review = new ReviewDTO(movieID, userID, comment, MAX_RATING);

                // Add commnent
                // TODO: Opwimize this code
                dao.addComment(review);
                request.setAttribute("movie", new MovieDAO().getById(movieID));
                request.setAttribute("reviews", new ReviewDAO().getReviewByMovieID(movieID));
                request.getRequestDispatcher("preview.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    public void dispatchToPreviewPage(int movieID) {
        request.setAttribute("movie", new MovieDAO().getById(movieID));
        request.setAttribute("reviews", new ReviewDAO().getReviewByMovieID(movieID));
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
