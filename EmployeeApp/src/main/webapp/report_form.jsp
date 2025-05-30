<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Employee Reports</title>

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(135deg, #dff1ff, #ffffff);
            font-family: 'Rubik', sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 60px auto 30px;
            padding: 40px 40px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }
        h2 {
            font-weight: 600;
            margin-bottom: 30px;
            color: #1d3557;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        h2 i {
            font-size: 1.8rem;
        }
        label {
            font-weight: 500;
            color: #333;
        }
        select.form-control, input.form-control {
            border-radius: 8px;
            border: 1.5px solid #ccc;
            padding: 10px 14px;
            transition: border-color 0.3s ease;
        }
        select.form-control:focus, input.form-control:focus {
            border-color: #457b9d;
            box-shadow: none;
        }
        .btn-group {
            text-align: center;
            margin-top: 25px;
        }
        .btn-primary {
            background-color: #1d3557;
            border: none;
            padding: 10px 28px;
            border-radius: 8px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #27496d;
        }
        .btn-secondary {
            background-color: #adb5bd;
            border: none;
            padding: 10px 28px;
            border-radius: 8px;
            margin-left: 15px;
            font-weight: 600;
            color: #fff;
            transition: background-color 0.3s ease;
        }
        .btn-secondary:hover {
            background-color: #868e96;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fa-solid fa-chart-bar"></i> Employee Reports</h2>
    <form action="ReportCriteriaServlet" method="post" class="mt-3">
        <div class="mb-4">
            <label for="reportType">Select Report Type:</label>
            <select name="reportType" id="reportType" class="form-control" required>
                <option value="" disabled selected>-- Select Report Type --</option>
                <option value="nameStart">Employees whose names start with a letter</option>
                <option value="yearsOfService">Employees with N or more years of service</option>
                <option value="highSalary">Employees earning more than a specified salary</option>
            </select>
        </div>
        <div class="mb-4">
            <label for="value">Enter Value (Letter / Years / Salary):</label>
            <input type="text" id="value" name="value" class="form-control" required pattern=".*\S.*" title="Please enter a valid value" />
        </div>
        <div class="btn-group d-flex justify-content-center">
            <button type="submit" class="btn btn-primary">Generate Report</button>
            <a href="index.jsp" class="btn btn-secondary">Back</a>
        </div>
    </form>
</div>
</body>
</html>
