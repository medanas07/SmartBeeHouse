<%-- 
    Document   : farmList
    Created on : 8 juin 2025, 11:19:43
    Author     : moham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Farms</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
    <style>
        /* Table styling */
        .table-container {
            margin-top: 2rem;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            min-width: 600px;
        }

        th, td {
            padding: 1rem 1.5rem;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: hsl(140, 46%, 52%); /* Primary color for header */
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9em;
            letter-spacing: 0.05em;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f0f0f0;
            transition: background-color 0.2s ease-in-out;
        }

        /* Action buttons in table */
        .actions {
            display: flex;
            gap: 0.75rem;
            align-items: center;
        }

        .btn-view, .btn-edit {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.6rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s ease-in-out;
            font-size: 0.9em;
        }

        .btn-view {
            background-color: hsl(140, 46%, 52%);
            color: white;
            border: 1px solid hsl(140, 46%, 52%);
        }

        .btn-view:hover {
            background-color: hsl(140, 46%, 40%);
            transform: translateY(-1px);
        }

        .btn-edit {
            background-color: transparent;
            color: hsl(140, 46%, 52%);
            border: 1px solid hsl(140, 46%, 52%);
        }

        .btn-edit:hover {
            background-color: rgba(67, 97, 238, 0.08);
            transform: translateY(-1px);
        }
    </style>

</head>
<body>
    <header>
        <h1><i class="fas fa-tractor"></i> My Farm</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/farmer"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/farmer/addFarm"><i class="fas fa-plus"></i> Add Farm</a>
            <a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </header>

    <main>
        <div class="table-container">
            <c:choose>
                <c:when test="${not empty farms}">
                    <table>
                        <thead>
                            <tr>
                                <th>Nom de la Ferme</th>
                                <th>Nombre de Sites</th>
                                <th>Total Ruches</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${farms}" var="farm">
                                <tr>
                                    <td>${farm.name}</td>
                                    <td>${farm.apiarySites.size()}</td>
                                    <td>
                                        <c:set var="totalHives" value="0"/>
                                        <c:forEach items="${farm.apiarySites}" var="site">
                                            <c:set var="totalHives" value="${totalHives + site.beehives.size()}"/>
                                        </c:forEach>
                                        ${totalHives}
                                    </td>
                                    <td>
                                        <div class="actions">
                                            <a href="${pageContext.request.contextPath}/farmer/farmDetails?id=${farm.id}" class="btn-view">
                                                <i class="fas fa-eye"></i> Détails
                                            </a>
                                            
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fas fa-tractor"></i>
                        <h3>Aucune Ferme Trouvée</h3>
                        <p>Vous n'avez pas encore ajouté de fermes. Commencez par ajouter votre première ferme.</p>
                        <a href="${pageContext.request.contextPath}/farmer/addFarm" class="btn-primary">
                            <i class="fas fa-plus"></i> Ajouter une Ferme
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</body>
</html>