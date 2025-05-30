package com.dao;

import com.model.Employee;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/employee_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password"; // Replace with your MySQL password

    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE Employee SET EmpName = ?, DoJ = ?, Gender = ?, Bsalary = ? WHERE Empno = ?";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM Employee WHERE Empno = ?";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM Employee WHERE Empno = ?";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM Employee";

    // Report queries
    private static final String REPORT_NAME_STARTS = "SELECT * FROM Employee WHERE EmpName LIKE ?";
    private static final String REPORT_YEARS_OF_SERVICE = "SELECT * FROM Employee WHERE TIMESTAMPDIFF(YEAR, DoJ, CURDATE()) >= ?";
    private static final String REPORT_SALARY_ABOVE = "SELECT * FROM Employee WHERE Bsalary > ?";

    public EmployeeDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void insertEmployee(Employee emp) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            stmt.setInt(1, emp.getEmpno());
            stmt.setString(2, emp.getEmpName());
            stmt.setDate(3, new java.sql.Date(emp.getDoj().getTime()));
            stmt.setString(4, emp.getGender());
            stmt.setDouble(5, emp.getBsalary());
            stmt.executeUpdate();
        }
    }

    public boolean updateEmployee(Employee emp) throws SQLException {
        boolean rowUpdated;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE_EMPLOYEE_SQL)) {
            stmt.setString(1, emp.getEmpName());
            stmt.setDate(2, new java.sql.Date(emp.getDoj().getTime()));
            stmt.setString(3, emp.getGender());
            stmt.setDouble(4, emp.getBsalary());
            stmt.setInt(5, emp.getEmpno());
            rowUpdated = stmt.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteEmployee(int empno) throws SQLException {
        boolean rowDeleted;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            stmt.setInt(1, empno);
            rowDeleted = stmt.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public Employee selectEmployee(int empno) throws SQLException {
        Employee emp = null;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            stmt.setInt(1, empno);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                emp = new Employee(
                    empno,
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                );
            }
        }
        return emp;
    }

    public List<Employee> selectAllEmployees() throws SQLException {
        List<Employee> employees = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_EMPLOYEES);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                employees.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return employees;
    }

    // ✅ Report 1: Employees whose names start with a specific string
    public List<Employee> getEmployeesByNameStart(String prefix) throws SQLException {
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(REPORT_NAME_STARTS)) {
            stmt.setString(1, prefix + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return list;
    } 

    // ✅ Report 2: Employees with N or more years of service
    public List<Employee> getEmployeesByServiceYears(int years) throws SQLException {
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(REPORT_YEARS_OF_SERVICE)) {
            stmt.setInt(1, years);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return list;
    }

    // ✅ Report 3: Employees earning more than a specified salary
    public List<Employee> getEmployeesBySalary(double salary) throws SQLException {
        List<Employee> list = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(REPORT_SALARY_ABOVE)) {
            stmt.setDouble(1, salary);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getDouble("Bsalary")
                ));
            }
        }
        return list;
    }
}
