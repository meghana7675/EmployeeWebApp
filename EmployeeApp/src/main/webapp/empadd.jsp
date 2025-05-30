<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Employee</title>
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #dff1ff, #ffffff);
            font-family: 'Rubik', sans-serif;
        }

        .card-style {
            max-width: 720px;
            margin: 70px auto;
            padding: 45px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h1 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 30px;
            color: #1d3557;
            text-align: center;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            box-shadow: none;
        }

        .form-control:focus {
            border-color: #457b9d;
            box-shadow: 0 0 0 0.2rem rgba(69, 123, 157, 0.2);
        }

        .btn-main {
            background-color: #1d3557;
            color: #fff;
            border-radius: 8px;
            padding: 10px 20px;
            transition: all 0.3s;
        }

        .btn-main:hover {
            background-color: #27496d;
        }

        .btn-cancel {
            background-color: #e63946;
            color: white;
            border-radius: 8px;
            padding: 10px 20px;
            margin-left: 10px;
            transition: 0.3s;
        }

        .btn-cancel:hover {
            background-color: #c5303c;
        }

        .form-check-label {
            margin-left: 5px;
        }

        .icon-input {
            position: relative;
        }

        .icon-input i {
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
            color: #457b9d;
        }

        .icon-input input,
        .icon-input select {
            padding-left: 36px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card-style">
            <h1><i class="fa-solid fa-user-plus text-primary"></i> Employee Registration</h1>
            <form action="AddEmployeeServlet" method="post">

                <div class="mb-3 icon-input">
                    <label for="empno">Employee ID</label>
                    <i class="fa-solid fa-id-badge"></i>
                    <input type="number" name="empno" id="empno" class="form-control" required>
                </div>

                <div class="mb-3 icon-input">
                    <label for="empName">Full Name</label>
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="empName" id="empName" class="form-control" pattern="[A-Za-z ]+" required>
                </div>

                <div class="mb-3 icon-input">
                    <label for="doj">Joining Date</label>
                    <i class="fa-solid fa-calendar-day"></i>
                    <input type="date" name="doj" id="doj" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label>Gender</label><br>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="gender" value="Male" class="form-check-input" id="male" required>
                        <label class="form-check-label" for="male"><i class="fa-solid fa-mars text-primary"></i> Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="radio" name="gender" value="Female" class="form-check-input" id="female">
                        <label class="form-check-label" for="female"><i class="fa-solid fa-venus text-danger"></i> Female</label>
                    </div>
                </div>

                <div class="mb-4 icon-input">
                    <label for="bsalary">Salary (₹)</label>
                    <i class="fa-solid fa-money-bill-wave"></i>
                    <input type="number" name="bsalary" id="bsalary" class="form-control" min="0" step="0.01" required>
                </div>

                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn btn-main"><i class="fa-solid fa-paper-plane"></i> Submit</button>
                    <a href="index.jsp" class="btn btn-cancel"><i class="fa-solid fa-arrow-left"></i> Back</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
