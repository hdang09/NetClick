/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.PaymentDAO;
import dto.AccountDTO;
import dto.PaymentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Quan
 */
@WebServlet(name = "PaymentControlller", urlPatterns = {"/Payment"})
public class PaymentControlller extends HttpServlet {

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
            out.println("<title>Servlet PaymentControlller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentControlller at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        if (account == null || account.getId() == 0) {
            response.sendRedirect("/login.jsp");
            return;
        }
        int userID = account.getId();
        String action = request.getParameter("action");

        if (action != null && action.equals("momo")) {
            // MOMO payment
            String momoNumString = request.getParameter("mnumber");
            if (momoNumString == null || momoNumString.isEmpty()) {
                request.setAttribute("errornum", "Please fill in your phone number");
                request.getRequestDispatcher("/momop.jsp").forward(request, response);
                return;
            } else {
                // Check numeric for "mnumber"
                if (!momoNumString.matches("\\d{10}")) {
                    request.setAttribute("errornum", "Please enter a 10-digit number for phone number");
                    request.getRequestDispatcher("/momop.jsp").forward(request, response);
                    return;
                } else {
                    try {
                        int momoNum = Integer.parseInt(momoNumString);
                        PaymentDAO paymentDAO = new PaymentDAO();
                        boolean isMomoExists = paymentDAO.isMomoExists(momoNum);
                        if (isMomoExists) {
                            request.setAttribute("errornum", "Phone number already exists");
                            request.getRequestDispatcher("/momop.jsp").forward(request, response);
                            return;
                        } else {
                            paymentDAO.insertm(userID, momoNum, new Date());
                            String movieID = (String) session.getAttribute("movieID");
                            System.out.println(movieID);
                            response.sendRedirect("/movie?id=" + movieID);
                            return;
                        }
                    } catch (NumberFormatException e) {
                    }
                }
            }
        } else {
            // VISA payment
            String saNum = request.getParameter("visa");
            String expireVisaDate = request.getParameter("expiredate");
            String cvvString = request.getParameter("cvv");
            String placeholderCard = request.getParameter("placeholderCard");
            if (saNum == null || expireVisaDate == null || cvvString == null || placeholderCard == null
                    || saNum.isEmpty() || expireVisaDate.isEmpty() || cvvString.isEmpty() || placeholderCard.isEmpty()) {
                request.setAttribute("errorfill", "Please fill all the fields");
                request.getRequestDispatcher("/visap.jsp").forward(request, response);
                return;
            } else if (!saNum.matches("^4\\d{15}$")) {
                request.setAttribute("validate", "Please enter 16-digit numbers and starts with 4");
                request.getRequestDispatcher("/visap.jsp").forward(request, response);
                return;
            } else if (!cvvString.matches("\\d{3}")) {
                request.setAttribute("validate", "Please enter at least a 3-digit number for CVV");
                request.getRequestDispatcher("/visap.jsp").forward(request, response);
                return;
            } else if (!placeholderCard.matches("[a-zA-Z]{2,}")) {
                request.setAttribute("validate", "Enter at least 2 characters and must not contain numbers and special characters");
                request.getRequestDispatcher("/visap.jsp").forward(request, response);
                return;
            }
            try {
                int cvv = Integer.parseInt(cvvString);
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date expireDate = dateFormat.parse(expireVisaDate);

                PaymentDAO paymentDAO = new PaymentDAO();
                PaymentDTO checkv = paymentDAO.checkPaymentExist(userID, saNum, expireDate, cvv, placeholderCard);
                if (checkv == null) {
                    paymentDAO.insertv(userID, saNum, expireDate, cvv, placeholderCard, new Date());
                    System.out.println(session.getAttribute("movieID"));
                    String movieID = (String) session.getAttribute("movieID");
                    response.sendRedirect("/movie?id=" + movieID);
                    return;
                } else {
                    request.setAttribute("note", "EXIST");
                    request.getRequestDispatcher("/visap.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException | ParseException e) {
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
