<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="Objects.Subscriber" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Upcoming Appointments</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
  <style>
     * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #fff;
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

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 100px;
        }
        .navbar ul {
            list-style: none;
            display: flex; /* Enables flexbox layout */
            justify-content: center; /* Centers items horizontally */
            gap: 100px;
            margin-left: 370px;
           
        }

        .navbar ul li {
            display: inline-block;
            
        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
        }


    /* Table container */
    .container {
      margin: 100px auto;
      width: 90%;
      
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
      
    }

    .container h2 {
      text-align: center;
      color: #004085;
      padding: 15px;
      background-color: #f8f9fa;
      margin: 0;
    }
    
    nav a {
            margin-left: 20px;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

    /* Table styling */
    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px 15px;
      text-align: center;
      border: 1px solid #ddd;
    }

    th {
      background-color: #007bff;
      color: white;
    }

    td {
      background-color: #fff;
    }
    .cancel-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .cancel-btn:hover {
            background-color: #c82333;
        }
    /* Cancel button */
    
  </style>
</head>
<body>

<!-- Navigation -->
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
  <h2>Registered Customers</h2>
  <table>
    <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Address</th>
                <th>Plan ID</th>
                <th>Subscription Date</th>
                <th>Status</th>
            </tr>
        </thead>
    <tbody>
            <c:forEach var="subscriber" items="${subscribers}">
                <tr>
                    <td>${subscriber.subscriberId}</td>
                    <td>${subscriber.firstName}</td>
                    <td>${subscriber.lastName}</td>
                    <td>${subscriber.email}</td>
                    <td>${subscriber.phoneNumber}</td>
                    <td>${subscriber.gender}</td>
                    <td>${subscriber.dateOfBirth}</td>
                    <td>${subscriber.address}</td>
                    <td>${subscriber.subscriptionPlanId}</td>
                    <td>${subscriber.subscriptionDate}</td>
                    <td>${subscriber.subscriptionStatus}</td>
                </tr>
            </c:forEach>
        </tbody>
  </table>
</div>

</body>
</html>
