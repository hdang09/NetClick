/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dao.MovieDAO;
import dto.AccountDTO;
import dto.MovieDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AdminController extends HttpServlet {

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
        final String DASHBOARD_PAGE = "/dashboard.jsp";
        final String MOVIE_MANAGEMENT_PAGE = "/movie-mgmt.jsp";
        final String USER_MANAGEMENT_PAGE = "/account-mgmt.jsp";
        final String MOVIE_FORM_PAGE = "/movie-form.jsp";
        final String MOVIE_DETAIL_PAGE = "/movie-detail.jsp";
        
        final int MOVIES_EACH_PAGE = 5;

        String uri = request.getRequestURI();
        String path = uri.substring(uri.indexOf("/", 1) + 1);
        switch (path) {
            case "accounts":
                List<AccountDTO> accounts = new AccountDAO().getAll();
//                request.setAttribute("pagination", Math.ceil(movies.size() / MOVIES_EACH_PAGE));
//                String startPageParam = request.getParameter("page");
//                if (startPageParam != null) {
//                    int startPage = Integer.parseInt(startPageParam);
//                    movies = movies.subList((startPage - 1) * MOVIES_EACH_PAGE, startPage * MOVIES_EACH_PAGE);
//                } else {
//                    movies = movies.subList(0, MOVIES_EACH_PAGE);
//                }
                request.setAttribute("accounts", accounts);
                request.setAttribute("size", accounts.size());
                request.getRequestDispatcher(USER_MANAGEMENT_PAGE).forward(request, response);
                break;
            case "add-movie":
                request.getRequestDispatcher(MOVIE_FORM_PAGE).forward(request, response);
                break;
            case "movies":
                // Delete movie
                String deleteID = request.getParameter("deleteID");
                if (deleteID != null) {
                    int id = Integer.parseInt(deleteID);
                    new MovieDAO().delete(id);
                    response.sendRedirect("/admin/movies");
                    return;
                }

                // Edit movie
                String editID = request.getParameter("editID");
                if (editID != null) {
                    int id = Integer.parseInt(editID);
                    MovieDTO movie = new MovieDAO().getById(id);
                    request.setAttribute("movie", movie);
                    request.getRequestDispatcher(MOVIE_FORM_PAGE).forward(request, response);
                    return;
                }

                // Movie Details
                String idParam = request.getParameter("id");
                if (idParam != null) {
                    int id = Integer.parseInt(idParam);
                    MovieDTO movie = new MovieDAO().getById(id);
                    request.setAttribute("movie", movie);
                    request.getRequestDispatcher(MOVIE_DETAIL_PAGE).forward(request, response);
                    return;
                }

                // Pagination
                List<MovieDTO> movies = new MovieDAO().getAll();
                request.setAttribute("aize", movies.size());
                request.setAttribute("pagination", Math.ceil(movies.size() / MOVIES_EACH_PAGE));
                String startPageParam = request.getParameter("page");
                if (startPageParam != null) {
                    int startPage = Integer.parseInt(startPageParam);
                    movies = movies.subList((startPage - 1) * MOVIES_EACH_PAGE, startPage * MOVIES_EACH_PAGE);
                } else {
                    movies = movies.subList(0, MOVIES_EACH_PAGE);
                }
                request.setAttribute("movies", movies);
                request.getRequestDispatcher(MOVIE_MANAGEMENT_PAGE).forward(request, response);
                break;
            default:
                request.getRequestDispatcher(DASHBOARD_PAGE).forward(request, response);
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
        // Movie form: add/ edit
        final int MAXIMUM_RATING = 5;
        
        String title = request.getParameter("title");
        String movieURL = request.getParameter("movie-url");
        String description = request.getParameter("description");
        String release = request.getParameter("release");
        String director = request.getParameter("director");
        String thumnailURL = request.getParameter("thumnail-url");
        // TODO: Update TAG code
        String tag = request.getParameter("tag");

        boolean isValid = true;
        // Validate title 
        if (title.length() < 2) {
            request.setAttribute("titleMsg", "Minimum 2 characters");
            isValid = false;
        }
        
        // Validate description 
        if (description.length() < 2) {
            request.setAttribute("descriptionMsg", "Minimum 2 characters");
            isValid = false;
        }
        
        // Validate director 
        if (director.length() < 2) {
            request.setAttribute("directorMsg", "Minimum 2 characters");
            isValid = false;
        }

        MovieDTO movie = new MovieDTO(title, description, thumnailURL, movieURL, release, director, MAXIMUM_RATING, tag);
        if (!isValid) {
            request.setAttribute("movie", movie);
            request.getRequestDispatcher("/movie-form.jsp").forward(request, response);
            return;
        }

        String action = request.getParameter("action");
        switch (action) {
            case "add":
                new MovieDAO().add(movie);
                break;
            case "edit":
                new MovieDAO().update(movie);
                break;
        }

        response.sendRedirect("/admin/movies");
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
