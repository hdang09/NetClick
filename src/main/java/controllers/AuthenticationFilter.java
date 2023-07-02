package controllers;

import dao.AccountDAO;
import dto.AccountDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AuthenticationFilter", urlPatterns = {"/AuthenticationFilter"})
public class AuthenticationFilter extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // LOGIN
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        if (username.isEmpty() || password.isEmpty()) {
            request.setAttribute("fill", "Please fill in all the fields");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        AccountDAO accountDAO = new AccountDAO();
        AccountDTO user = accountDAO.login(username, password);
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("tendangnhap", username);
            session.setAttribute("account", user);

            // Role: admin
            if (user.getRole() == 0) {
                response.sendRedirect("/admin");
                return;
            }

            // Role: user
            response.sendRedirect("/");
        } else {
            request.setAttribute("mess", "Wrong user or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
