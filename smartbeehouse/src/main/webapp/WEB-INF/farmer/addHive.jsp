<%-- 
    Document   : addHive
    Created on : 8 juin 2025, 16:15:33
    Author     : moham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add New Hive</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
    </head>
    <body>
        <div class="header">
            <h1>Add New Hive to Site #${siteId}</h1>
            <nav>
                <a href="${pageContext.request.contextPath}/farmer/siteDetails?id=${siteId}" class="btn">Back to Site</a>
            </nav>
        </div>
    
        <div class="main-content">
            <div class="form-container">
                <form action="${pageContext.request.contextPath}/farmer/addHive" method="POST" id="hiveForm">
                    <input type="hidden" name="siteId" value="${siteId}">
                    
                    <div class="form-group">
                        <label for="hiveName">Hive Name *</label>
                        <input type="text" id="hiveName" name="hiveName" required 
                               value="${not empty param.hiveName ? param.hiveName : ''}">
                        <c:if test="${not empty errors.hiveName}">
                            <span class="error-message">${errors.hiveName}</span>
                        </c:if>
                    </div>
    
                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary">Save Hive</button>
                        <a href="${pageContext.request.contextPath}/farmer/siteDetails?id=${siteId}" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    
        <script>
            document.getElementById('hiveForm').addEventListener('submit', function(e) {
                const hiveName = document.getElementById('hiveName').value.trim();
                const hiveType = document.getElementById('hiveType').value;
                
                if (!hiveName) {
                    e.preventDefault();
                    alert('Hive name is required');
                    return false;
                }
            });
        </script>
    </body>
    </html>
        