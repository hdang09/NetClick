/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.MovieDAO;
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
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
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
        final String MOVIE_MANAGEMENT_PAGE = "/admin/movie-mgmt.jsp";
        final String USER_MANAGEMENT_PAGE = "/admin/user-mgmt.jsp";
        final String ADMIN_DASHBOARD = "/admin/dashboard.jsp";
        final int MOVIES_EACH_PAGE = 5;

        String uri = request.getRequestURI();
        String path = uri.substring(uri.indexOf("/", 1) + 1);
        switch (path) {
            case "users":
                request.getRequestDispatcher("/user-mgmt.jsp").forward(request, response);
                break;
            case "add-movie":
                request.getRequestDispatcher("/movie-form.jsp").forward(request, response);
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
                    request.getRequestDispatcher("/movie-form.jsp").forward(request, response);
                    return;
                }

                // Movie Details
                String idParam = request.getParameter("id");
                if (idParam != null) {
                    int id = Integer.parseInt(idParam);
                    MovieDTO movie = new MovieDAO().getById(id);
                    request.setAttribute("movie", movie);
                    request.getRequestDispatcher("/movie-detail.jsp").forward(request, response);
                    return;
                }

                // Pagination
                List<MovieDTO> movies = new MovieDAO().getAll();
                request.setAttribute("pagination", Math.ceil(movies.size() / MOVIES_EACH_PAGE));
                String startPageParam = request.getParameter("page");
                if (startPageParam != null) {
                    int startPage = Integer.parseInt(startPageParam);
                    movies = movies.subList((startPage - 1) * MOVIES_EACH_PAGE, startPage * MOVIES_EACH_PAGE);
                } else {
                    movies = movies.subList(0, MOVIES_EACH_PAGE);
                }
                request.setAttribute("movies", movies);
                request.getRequestDispatcher("/movie-mgmt.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
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
        MovieDTO movie = new MovieDTO(title, description, thumnailURL, movieURL, release, director, MAXIMUM_RATING, tag);

        // TODO: Validate all fields 
//        if (true) {
//            request.setAttribute("titleMsg", "Minimum 5 characters");
//            request.setAttribute("movie", movie);
//            request.getRequestDispatcher("/movie-form.jsp").forward(request, response);
//            return;
//        }

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
