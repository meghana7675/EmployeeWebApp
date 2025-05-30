<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Employee Salary Management</title>

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(135deg, #dff1ff, #ffffff);
            font-family: 'Rubik', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .main-card {
            background: #fff;
            border-radius: 25px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
            max-width: 600px;
            width: 100%;
            padding: 50px 40px;
            text-align: center;
        }

        .main-card h1 {
            color: #1d3557;
            font-weight: 700;
            font-size: 2.8rem;
            margin-bottom: 35px;
            letter-spacing: 1.2px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }
        .main-card h1 i {
            color: #457b9d;
            font-size: 2.8rem;
        }

        .btn-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 25px;
        }

        .action-btn {
            background: linear-gradient(45deg, #1d3557, #457b9d);
            border: none;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
            padding: 18px 0;
            border-radius: 15px;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(69, 123, 157, 0.4);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            text-decoration: none;
        }
        .action-btn:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 30px rgba(29, 53, 87, 0.5);
            background: linear-gradient(45deg, #27496d, #1d3557);
        }

        .action-btn i {
            font-size: 1.5rem;
        }
        
        @media (max-width: 480px) {
            .main-card h1 {
                font-size: 2rem;
            }
            .action-btn {
                font-size: 1rem;
                padding: 14px 0;
            }
        }
    </style>
</head>
<body>

    <div class="main-card">
        <h1><i class="fa-solid fa-briefcase"></i> Employee Salary Management</h1>

        <div class="btn-grid">
            <a href="empadd.jsp" class="action-btn"><i class="fa-solid fa-user-plus"></i> Add New Employee</a>
            <a href="empupdate.jsp" class="action-btn"><i class="fa-solid fa-user-pen"></i> Update Employee</a>
            <a href="empdelete.jsp" class="action-btn"><i class="fa-solid fa-user-minus"></i> Remove Employee</a>
            <a href="empdisplay.jsp" class="action-btn"><i class="fa-solid fa-users"></i> Display Employees</a>
            <a href="report_form.jsp" class="action-btn"><i class="fa-solid fa-chart-line"></i> Reports</a>
        </div>
    </div>

</body>
</html>
