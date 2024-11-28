<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insurance Plans</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f3f4f6;
        color: #333;
        line-height: 1.6;
    }
    
     header {
            background-color: #1870f5;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
         .logo {
            font-size: 24px;
            margin-left: 80px;
        }

        .logo i {
            color: white;
        }
        
        nav a {
            margin-left: 20px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        

    .container {
        max-width: 1200px;
        margin: 40px auto;
        padding: 20px;
    }

    h2 {
        font-size: 2em;
        font-weight: 600;
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
    }

    .card {
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        margin: 20px 0;
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
    }

    .card-header {
        background-color: #007bff;
        color: #fff;
        padding: 20px;
        font-size: 1.8em;
        font-weight: bold;
        text-align: center;
    }

    .card-body {
        padding: 20px;
    }

    .card-body p {
        margin: 10px 0;
    }

    .highlight {
        color: #007bff;
        font-weight: bold;
    }

    .card-footer {
        text-align: center;
        padding: 15px 20px;
        background-color: #f9f9f9;
    }

    .btn {
        background: red;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 25px;
        font-size: 16px;
        font-weight: 500;
        text-decoration: none;
        display: inline-block;
        transition: background 0.3s ease, transform 0.3s ease;
        cursor: pointer;
    }

    .btn:hover {
        background: red;
        transform: scale(1.05);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .card {
            margin: 15px 10px;
        }

        h2 {
            font-size: 1.5em;
        }

        .btn {
            padding: 10px 16px;
            font-size: 14px;
        }
    }
</style>
</head>
<body>
<header>
        <div class="logo"><i class="fa-solid fa-heart-pulse"></i> My Policy Hub</div>
        <nav>
        	<a href="adminhome.jsp">Home</a>
            <a href="adminservices.jsp">View Plans</a>
            <a href="addplan.jsp">Add Plan</a>
            <a href="addagent.jsp">Add Agent</a>
            <a href="subscribers.jsp">Subscribers</a>
            <a href="admin_side_login.jsp">Logout</a>
        </nav>
    </header>

<div class="container">
    <h2>Insurance Plans for <c:out value="${param.plan_category}" /> Category</h2>

    <c:forEach var="plan" items="${insurancePlans}">
        <div class="card">
            <div class="card-header">
                <c:out value="${plan.planName}" />
                
            </div>
            <div class="card-body">
            	<p><strong>Plan ID:</strong> <c:out value="${plan.planId}" /></p>
                <p><strong>Description:</strong> <c:out value="${plan.planDesc}" /></p>
                <p><strong>Tier:</strong> <span class="highlight"><c:out value="${plan.planTier}" /></span></p>
                <p><strong>Age Group:</strong> <c:out value="${plan.ageGroup}" /></p>
                <p><strong>Gender:</strong> <c:out value="${plan.planForGender}" /></p>
                <p><strong>Premium:</strong> ₹<c:out value="${plan.premium}" /></p>
                <p><strong>Coverage:</strong> ₹<c:out value="${plan.coverageAmount}" /></p>
            </div>
            <div class="card-footer">
               <a href="DeletePlanServlet?planId=${plan.planId}" class="btn" style="background-color: red; color: white;">Delete</a>

            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
