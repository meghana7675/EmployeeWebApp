<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Lookup</title>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f8fbff, #ffffff);
            font-family: 'Rubik', sans-serif;
        }
        .card-style {
            max-width: 650px;
            margin: 60px auto 30px;
            padding: 40px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
        }
        h1 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1d3557;
            text-align: center;
            margin-bottom: 30px;
        }
        label {
            font-weight: 500;
            color: #333;
        }
        .form-control:focus {
            border-color: #457b9d;
            box-shadow: none;
        }
        .btn-primary {
            background-color: #1d3557;
            border: none;
            border-radius: 8px;
        }
        .btn-secondary {
            margin-left: 10px;
            border-radius: 8px;
        }
        .details-box {
            background: #f9f9f9;
            border-radius: 16px;
            padding: 30px;
            margin-top: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
        }
        .details-box h2 {
            text-align: center;
            font-size: 1.5rem;
            color: #2d6a4f;
            margin-bottom: 25px;
        }
        .table td, .table th {
            vertical-align: middle;
        }
        .btn-print {
            margin-top: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        @media print {
            .no-print {
                display: none;
            }
            body {
                background: #fff;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card-style">
        <h1>🔎 Find Employee</h1>
        <form action="DisplayEmployeeServlet" method="get" class="mb-3">
            <div class="mb-3">
                <label for="empno">Employee ID</label>
                <input type="number" name="empno" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Search</button>
                <a href="index.jsp" class="btn btn-secondary no-print">Back</a>
            </div>
        </form>

        <%
            String error = request.getParameter("error");
            String message = request.getParameter("message");
            if (error != null) {
        %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <%
            } else if (message != null) {
        %>
            <div class="alert alert-success text-center"><%= message %></div>
        <%
            }

            com.model.Employee emp = (com.model.Employee) request.getAttribute("employee");
            if (emp != null) {
        %>
            <div class="details-box">
                <h2>👤 Employee Profile</h2>
                <table class="table table-bordered">
                    <tr><th>Employee No</th><td><%= emp.getEmpno() %></td></tr>
                    <tr><th>Name</th><td><%= emp.getEmpName() %></td></tr>
                    <tr><th>Date of Joining</th><td><%= emp.getDoj() %></td></tr>
                    <tr><th>Gender</th><td><%= emp.getGender() %></td></tr>
                    <tr><th>Basic Salary</th><td>₹ <%= emp.getBsalary() %></td></tr>
                </table>
                <button class="btn btn-outline-success btn-print no-print" onclick="window.print()">🖨️ Print</button>
            </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
