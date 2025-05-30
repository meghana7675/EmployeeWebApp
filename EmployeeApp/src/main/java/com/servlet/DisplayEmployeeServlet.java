package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet
("/DisplayEmployeeServlet")
public class DisplayEmployeeServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            Employee emp = employeeDAO.selectEmployee(empno);

            if (emp != null) {
                request.setAttribute("employee", emp);
                request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
            } else {
                response.sendRedirect("empdisplay.jsp?error=Employee not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("empdisplay.jsp?error=Invalid input or server error");
        }
    }
}
