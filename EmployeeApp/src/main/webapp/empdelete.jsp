<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Remove Employee</title>

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #dff1ff, #ffffff);
            font-family: 'Rubik', sans-serif;
        }

        .card-style {
            max-width: 550px;
            margin-top: 70px;
            padding: 35px;
            background-color: #fff;
            border-radius: 18px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.07);
        }

        h1 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1d3557; /* Updated to match empadd.jsp */
            margin-bottom: 25px;
            text-align: center;
        }

        label {
            font-weight: 500;
            color: #333;
        }

        .form-control:focus {
            border-color: #457b9d;
            box-shadow: none;
        }

        .btn-delete {
            background-color: #c1121f;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            width: 130px;
            transition: 0.3s;
        }

        .btn-delete:hover {
            background-color: #9e0b14;
        }

        .btn-back {
            background-color: #adb5bd;
            color: white;
            border-radius: 8px;
            padding: 10px 20px;
            margin-left: 10px;
        }

        .alert {
            font-size: 0.95rem;
        }

        .form-header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .form-header i {
            font-size: 1.4rem;
            margin-right: 10px;
            color: #1d3557;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="card-style">
            <div class="form-header">
                <i class="fa-solid fa-user-minus"></i>
                <h1 class="m-0">Remove Employee Record</h1>
            </div>
            <form action="DeleteEmployeeServlet" method="post">
                <div class="mb-3">
                    <label for="empno"><i class="fa-solid fa-id-badge me-2"></i>Employee ID</label>
                    <input type="number" name="empno" id="empno" class="form-control" required>
                </div>
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-delete"><i class="fa-solid fa-trash"></i> Delete</button>
                    <a href="index.jsp" class="btn btn-back"><i class="fa-solid fa-arrow-left"></i> Back</a>
                </div>
            </form>

            <%
                String message = request.getParameter("message");
                String error = request.getParameter("error");
                if (message != null) {
            %>
                <div class="alert alert-success mt-3 text-center"><i class="fa-solid fa-check-circle me-1"></i><%= message %></div>
            <%
                } else if (error != null) {
            %>
                <div class="alert alert-danger mt-3 text-center"><i class="fa-solid fa-circle-exclamation me-1"></i><%= error %></div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
