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
import java.util.Date;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "PaymentControlller", urlPatterns = {"/PaymentControlller"})
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
                try {
                    Integer momo = Integer.parseInt(momoNumString);
                    PaymentDAO paymentDAO = new PaymentDAO();
                    PaymentDTO checkm = paymentDAO.momoCheckExist(momo);
                    if (checkm == null) {
                        paymentDAO.insertm(momo);
                        response.sendRedirect(request.getContextPath() + "/movie?id=1");
                    } else {
                        request.setAttribute("errornum", "Phone number already exists");
                        response.sendRedirect(request.getContextPath() + "/subscription.jsp");
                    }
                } catch (NumberFormatException e) {
                }
            } 
            } else {
//          VISA
            String saNumString = request.getParameter("visa");
            String expire_visa_date = request.getParameter("expiredate");
            String cvvString = request.getParameter("cvv");
            String placeholderCard = request.getParameter("placeholderCard");
                if (saNumString == null || expire_visa_date == null || cvvString == null || placeholderCard == null ||
                        saNumString.isEmpty() || expire_visa_date.isEmpty() || cvvString.isEmpty() || placeholderCard.isEmpty()) {
                    request.setAttribute("errorfill", "Please fill all the fields");
                    request.getRequestDispatcher("/visap.jsp").forward(request, response);
                    return ;
                } else {
                    try {
                        Integer saNum = Integer.parseInt(saNumString);
                        Integer cvv = Integer.parseInt(cvvString);

                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date expireDate = dateFormat.parse(expire_visa_date);

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
