package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
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
                request.getRequestDispatcher("empupdate.jsp").forward(request, response);
            } else {
                response.sendRedirect("empupdate.jsp?error=Employee not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("empupdate.jsp?error=Invalid Employee Number");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));
            Date doj = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("doj"));

            Employee emp = new Employee(empno, empName, doj, gender, bsalary);
            boolean updated = employeeDAO.updateEmployee(emp);

            if (updated) {
                response.sendRedirect("empupdate.jsp?message=Employee updated successfully");
            } else {
                response.sendRedirect("empupdate.jsp?error=Employee not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("empupdate.jsp?error=Update failed due to server error");
        }
    }
}
