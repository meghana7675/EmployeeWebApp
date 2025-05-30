<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>

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
            max-width: 700px;
            margin-top: 70px;
            padding: 40px;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }

        h1 {
            font-size: 1.9rem;
            font-weight: 600;
            color: #1d3557; /* Consistent deep blue */
            margin-bottom: 30px;
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

        .btn-update {
            background-color: #1d3557;
            color: white;
            border-radius: 8px;
            padding: 10px 25px;
            transition: 0.3s;
        }

        .btn-update:hover {
            background-color: #27496d;
        }

        .btn-cancel {
            background-color: #adb5bd;
            color: white;
            border-radius: 8px;
            padding: 10px 25px;
            margin-left: 15px;
            transition: 0.3s;
        }

        .btn-cancel:hover {
            background-color: #868e96;
        }

        .form-header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
        }

        .form-header i {
            font-size: 1.5rem;
            margin-right: 12px;
            color: #1d3557;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="card-style">
            <div class="form-header">
                <i class="fa-solid fa-user-pen"></i>
                <h1 class="m-0">Update Employee Record</h1>
            </div>

            <form action="UpdateEmployeeServlet" method="post">
                <div class="mb-3">
                    <label for="empno"><i class="fa-solid fa-id-badge me-2"></i>Employee ID</label>
                    <input type="number" name="empno" id="empno" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="empName"><i class="fa-solid fa-user me-2"></i>Full Name</label>
                    <input type="text" name="empName" id="empName" class="form-control" pattern="[A-Za-z ]+" required>
                </div>

                <div class="mb-3">
                    <label for="doj"><i class="fa-solid fa-calendar-days me-2"></i>Joining Date</label>
                    <input type="date" name="doj" id="doj" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label><i class="fa-solid fa-venus-mars me-2"></i>Gender</label><br>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="gender" value="Male" id="male" class="form-check-input" required>
                        <label for="male" class="form-check-label">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="gender" value="Female" id="female" class="form-check-input">
                        <label for="female" class="form-check-label">Female</label>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="bsalary"><i class="fa-solid fa-indian-rupee-sign me-2"></i>Salary (₹)</label>
                    <input type="number" name="bsalary" id="bsalary" class="form-control" min="0" step="0.01" required>
                </div>

                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-update"><i class="fa-solid fa-pen-to-square me-1"></i> Update</button>
                    <a href="index.jsp" class="btn btn-cancel"><i class="fa-solid fa-arrow-left me-1"></i> Cancel</a>
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
