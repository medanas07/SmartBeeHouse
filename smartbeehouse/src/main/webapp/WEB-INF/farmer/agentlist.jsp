<%-- 
    Document   : agentList
    Created on : 9 juin 2025, 19:45:01
    Author     : moham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agent Management - Smart Bee House</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        :root {
            --primary-color: #4a6fa5;
            --secondary-color: #6b8cae;
            --accent-color: #ff7e5f;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --border-radius: 8px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        header {
            background-color: #28a745;
            color: white;
            padding: 1.5rem 2rem;
            box-shadow: var(--box-shadow);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        header h1 {
            font-size: 1.8rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        header nav {
            display: flex;
            gap: 1.5rem;
        }

        header nav a {
            color: white;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius);
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        header nav a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }

        main {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .container {
            width: 100%;
        }

        .card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .card-header {
            padding: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
        }

        .card-header h2 {
            font-size: 1.5rem;
            color: var(--dark-color);
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .card-body {
            padding: 1.5rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.6rem 1.2rem;
            border-radius: var(--border-radius);
            font-weight: 500;
            transition: var(--transition);
            cursor: pointer;
            border: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #3a5a8f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        table thead {
            background-color: #f1f5f9;
        }

        table th, table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        table th {
            font-weight: 600;
            color: var(--dark-color);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }

        table tr:hover {
            background-color: #f8fafc;
        }

        /* Empty State Styles */
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: #64748b;
        }

        .empty-state i {
            font-size: 3rem;
            color: #cbd5e1;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-top: 1rem;
            color: var(--dark-color);
        }

        .empty-state p {
            margin-top: 0.5rem;
            font-size: 1rem;
            color: #888;
        }

        .empty-state .btn-primary {
            margin-top: 1.5rem;
            padding: 0.8rem 1.5rem;
            font-size: 1.1rem;
        }

        /* Search Form Styles */
        .search-form-container {
            margin-bottom: 1.5rem;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 1rem;
        }

        .search-form-container input[type="text"] {
            padding: 0.75rem 1rem;
            border: 1px solid #ccc;
            border-radius: var(--border-radius);
            font-size: 1rem;
            width: 100%;
            max-width: 300px;
        }

        .search-form-container .btn {
            padding: 0.75rem 1.2rem;
            font-size: 1rem;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            header nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            main {
                padding: 1rem;
            }

            .card-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .search-form-container {
                flex-direction: column;
                align-items: stretch;
            }

            .search-form-container input[type="text"] {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1><i class="fas fa-user-tie"></i> Agent Management</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/farmer"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/farmer/addAgent"><i class="fas fa-plus"></i> Add Agent</a>
            <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </header>

    <main>
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h2>Agent List</h2>
                    <a href="${pageContext.request.contextPath}/farmer/addAgent" class="btn"><i class="fas fa-plus"></i> Add New Agent</a>
                </div>
                <div class="card-body">
                    <div class="search-form-container">
                       
                    </div>
                    <c:choose>
                        <c:when test="${not empty agents and agents.size() > 0}">
                            <div class="table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Password</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${agents}" var="agent">
                                            <tr>
                                                <td>${agent.name}</td>
                                                <td>${agent.email}</td>
                                                <td>
                                                    <c:if test="${not empty agent.password}">
                                                        ${agent.password}
                                                    </c:if>
                                                </td>
                                                
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="fas fa-user-slash"></i>
                                <h3>No Agents Found</h3>
                                <p>There are currently no agents in the system. You can add a new agent by clicking the button below.</p>
                                <a href="${pageContext.request.contextPath}/farmer/addAgent" class="btn-primary">
                                    <i class="fas fa-plus"></i> Add New Agent
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </main>
</body>
</html>