package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String reportType = (String) session.getAttribute("reportType");
        String value = (String) session.getAttribute("value");

        List<Employee> reportData = null;

        try {
            if ("nameStart".equals(reportType)) {
                reportData = employeeDAO.getEmployeesByNameStart(value);
            } else if ("yearsOfService".equals(reportType)) {
                int years = Integer.parseInt(value);
                reportData = employeeDAO.getEmployeesByServiceYears(years);
            } else if ("highSalary".equals(reportType)) {
                double salary = Double.parseDouble(value);
                reportData = employeeDAO.getEmployeesBySalary(salary);
            }

            request.setAttribute("reportData", reportData);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("report_form.jsp?error=Invalid input");
        }
    }
}
