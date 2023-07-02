/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.PaymentDAO;
import dto.PaymentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        String action = request.getParameter("action");
        if (action != null && action.equals("momo")) {
//          MOMO
            String momoNumString = request.getParameter("mnumber");
            if (momoNumString == null || momoNumString.isEmpty()) {
                request.setAttribute("errornum", "Please fill your phone numbers");
                request.getRequestDispatcher("/momop.jsp").forward(request, response);
            } else {
                // check numberic for "mnumber"
                if (!momoNumString.matches("\\d{10}")) {
                    request.setAttribute("errornum", "Please enter a 10-digit numeric value for Phone number");
                    request.getRequestDispatcher("/momop.jsp").forward(request, response);
                } else {
                    try {
                        Integer momo = Integer.parseInt(momoNumString);
                        PaymentDAO paymentDAO = new PaymentDAO();
                        boolean isMomoExists = paymentDAO.isMomoExists(momo);
                        if (isMomoExists) {
                            request.setAttribute("errornum", "Phone number already exists");
                            request.getRequestDispatcher("/momop.jsp").forward(request, response);
                        } else {
                            paymentDAO.insertm(momo);
                            response.sendRedirect(request.getContextPath() + "/movie?id=1");
                        }
                    } catch (NumberFormatException e) {
        }
    }
}
            } else {
//          VISA
            String saNum = request.getParameter("visa");
            String expire_visa_date = request.getParameter("expiredate");
            String cvvString = request.getParameter("cvv");
            String placeholderCard = request.getParameter("placeholderCard");
            if (saNum == null || expire_visa_date == null || cvvString == null || placeholderCard == null ||
                    saNum.isEmpty() || expire_visa_date.isEmpty() || cvvString.isEmpty() || placeholderCard.isEmpty()) {
                    request.setAttribute("errorfill", "Please fill all the fields");
                    request.getRequestDispatcher("/visap.jsp").forward(request, response);
                    return;
//                   Validate Visa
                    } else if (!saNum.matches("^4\\d{12,15}$")) {
                        request.setAttribute("validate", "Please enter a 13 to 16-digit numeric value for Visa starting with 4");
                        request.getRequestDispatcher("/visap.jsp").forward(request, response);
                        return;

//                  Validate CVV
                    } else if (!cvvString.matches("\\d+")) {
                        request.setAttribute("validate", "Please enter only numeric values for CVV");
                        request.getRequestDispatcher("/visap.jsp").forward(request, response);
                        return;
//                  Validate Name
                    } else if (!placeholderCard.matches("[a-zA-Z]{2,}")) {
                        request.setAttribute("validate", "Enter at least 2 alphabetical characters and must not contain numbers and special characters ");
                        request.getRequestDispatcher("/visap.jsp").forward(request, response);
                        return;
                        }try {
                            Integer cvv = Integer.parseInt(cvvString);

                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            java.util.Date utilExpireDate = dateFormat.parse(expire_visa_date);
                            java.sql.Date expireDate = new java.sql.Date(utilExpireDate.getTime());
                            
                            // CHECK EXIST
                            PaymentDAO paymentDAO = new PaymentDAO();
                            PaymentDTO checkv = paymentDAO.checkPaymentExist(saNum, expireDate, cvv, placeholderCard);
                            if (checkv == null) {
                                paymentDAO.insertv(saNum, expireDate, cvv, placeholderCard);
                                response.sendRedirect(request.getContextPath() + "/movie?id=1");
                            } else {
                                request.setAttribute("note", "EXIST");
                                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/visap.jsp");
                                dispatch.forward(request, response);
                            }
                        } catch (NumberFormatException | ParseException e) {
    }
}

            }

        // TODO: Validate form using isValid variable
//                boolean isValid = true;
//                if (isValid) {
//                    response.sendRedirect("/movie?id=1");
//                    return;
//                }
//                  
//                response.sendRedirect("subscription.jsp");
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
