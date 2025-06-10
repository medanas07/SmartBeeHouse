<%-- 
    Document   : editfarm
    Created on : 9 juin 2025, 18:50:53
    Author     : moham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Farm</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
    </head>
    <body>
        <header>
            <div class="container">
                <h1><i class="fas fa-edit"></i> Edit Farm</h1>
                <nav>
                    <a href="${pageContext.request.contextPath}/farmer">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a>
                    <a href="${pageContext.request.contextPath}/logout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </nav>
            </div>
        </header>

        <main class="container">
            <div class="card">
                <div class="card-header">
                    <h2 class="card-title"><i class="fas fa-tractor"></i> Farm Information</h2>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/farmer/editFarm" method="POST" class="form">
                        <input type="hidden" name="id" value="${farm.id}">
                        
                        <c:if test="${not empty sessionScope.error}">
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-circle"></i> ${sessionScope.error}
                            </div>
                            <c:remove var="error" scope="session"/>
                        </c:if>

                        <div class="form-group">
                            <label for="name">
                                <i class="fas fa-signature"></i> Farm Name
                            </label>
                            <input type="text" id="name" name="name" required 
                                   class="form-control" value="${farm.name}"
                                   placeholder="Enter farm name">
                        </div>

                        <div class="form-group">
                            <label for="location">
                                <i class="fas fa-map-marker-alt"></i> Location
                            </label>
                            <input type="text" id="location" name="location" required 
                                   class="form-control" value="${farm.location}"
                                   placeholder="Enter farm location">
                        </div>

                        <div class="form-group">
                            <label for="description">
                                <i class="fas fa-align-left"></i> Description
                            </label>
                            <textarea id="description" name="description" rows="4" 
                                      class="form-control" placeholder="Enter farm description">${farm.description}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="size">
                                <i class="fas fa-ruler-combined"></i> Size (hectares)
                            </label>
                            <input type="number" id="size" name="size" step="0.01" min="0" 
                                   class="form-control" value="${farm.size}"
                                   placeholder="Enter farm size">
                        </div>

                        <div class="btn-group">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Save Changes
                            </button>
                            <a href="${pageContext.request.contextPath}/farmer/farmDetails?id=${farm.id}" class="btn btn-outline">
                                <i class="fas fa-times"></i> Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html> 