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
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.DateUtils;
import utils.ValidateUtils;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AdminController extends HttpServlet {

    MovieDAO movieDAO = new MovieDAO();

    final String DASHBOARD_PAGE = "/dashboard.jsp";
    final String MOVIE_MANAGEMENT_PAGE = "/movie-mgmt.jsp";
    final String USER_MANAGEMENT_PAGE = "/account-mgmt.jsp";
    final String MOVIE_FORM_PAGE = "/movie-form.jsp";
    final String MOVIE_DETAIL_PAGE = "/movie-detail.jsp";

    final int MOVIES_EACH_PAGE = 5;

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

        String uri = request.getRequestURI();
        String path = uri.substring(uri.indexOf("/", 1) + 1);
        HttpSession session = request.getSession();
        
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
                session.setAttribute("action", "Add");
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
                    MovieDTO movie = movieDAO.getById(id);
                    request.setAttribute("movie", movie);
                    request.setAttribute("release", new DateUtils().dateToString(movie.getRelease()));
                    session.setAttribute("action", "Edit");
                    session.setAttribute("editID", editID);
                    request.getRequestDispatcher(MOVIE_FORM_PAGE).forward(request, response);
                    return;
                }

                // Movie Details
                String idParam = request.getParameter("id");
                if (idParam != null) {
                    int id = Integer.parseInt(idParam);
                    MovieDTO movie = movieDAO.getById(id);
                    request.setAttribute("movie", movie);
                    request.getRequestDispatcher(MOVIE_DETAIL_PAGE).forward(request, response);
                    return;
                }

                // Pagination
                List<MovieDTO> movies = movieDAO.getAll();
                int size = movies.size();
                request.setAttribute("size", size);
                double pagination = (double) movies.size() / MOVIES_EACH_PAGE;
                request.setAttribute("pagination", Math.ceil(pagination));
                String startPageParam = request.getParameter("page");
                if (startPageParam != null) {
                    int startPage = Integer.parseInt(startPageParam);
                    boolean isEndPagination = startPage == Math.ceil(pagination);
                    movies = movies.subList((startPage - 1) * MOVIES_EACH_PAGE, isEndPagination ? size : startPage * MOVIES_EACH_PAGE);
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

        ValidateUtils validator = new ValidateUtils();
        HttpSession session = request.getSession();

        String title = request.getParameter("title");
        String movieURL = request.getParameter("movie-url");
        String description = request.getParameter("description");
        String releaseStr = request.getParameter("release");
        Date release = new DateUtils().stringToDate(releaseStr);
        String director = request.getParameter("director");
        String thumnailURL = request.getParameter("thumbnail-url");
        String tag = request.getParameter("tag");

        boolean isValid = true;
        // Validate title 
        if (title.trim().isEmpty()) {
            request.setAttribute("titleMsg", "Title is required");
            isValid = false;
        }

        // Validate description 
        if (description.trim().isEmpty()) {
            request.setAttribute("descriptionMsg", "Description is required");
            isValid = false;
        }

        // Validate director 
        if (director.trim().isEmpty()) {
            request.setAttribute("directorMsg", "Director is required");
            isValid = false;
        }

        // Validate thumbnail URL
        if (!validator.isValidURL(thumnailURL)) {
            request.setAttribute("thumbnailURLMsg", "This is not a valid URL");
            isValid = false;
        }

        // Validate movie URL
        if (!validator.isValidURL(movieURL)) {
            request.setAttribute("movieURLMsg", "This is not a valid URL");
            isValid = false;
        }

        // Validate release date
        if (release == null) {
            request.setAttribute("releaseMsg", "Release date is required");
            isValid = false;
        }

        MovieDTO movie = new MovieDTO(title, description, thumnailURL, movieURL, release, director, MAXIMUM_RATING, tag);
        String action = request.getParameter("action");
        if (!isValid) {
            request.setAttribute("release", releaseStr);
            request.setAttribute("movie", movie);
            request.getRequestDispatcher(MOVIE_FORM_PAGE).forward(request, response);
            return;
        }

        switch (action) {
            case "add":
                new MovieDAO().add(movie);
                break;
            case "edit":
                String editID = (String) session.getAttribute("editID");
                int id = Integer.parseInt(editID);
                new MovieDAO().update(movie, id);
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
