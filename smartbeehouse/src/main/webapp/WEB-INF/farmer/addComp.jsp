<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Component</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
    </head>
    <body>
        <header>
            <div class="container">
                <h1><i class="fas fa-box-open"></i> Add Hive Component</h1>
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
            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/farmer/hiveDetails?id=${hiveId}" class="btn btn-outline">
                    <i class="fas fa-arrow-left"></i> Back to Hive
                </a>
            </div>

            <div class="card">
                <div class="card-header">
                    <h2 class="card-title"><i class="fas fa-plus-circle"></i> New Component</h2>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-circle"></i> ${error}
                        </div>
                    </c:if>

                    <form method="post" action="${pageContext.request.contextPath}/farmer/addComp" class="form">
                        <input type="hidden" name="hiveId" value="${hiveId}"/>

                        <div class="form-group">
                            <label for="type">
                                <i class="fas fa-th-large"></i> Component Type
                            </label>
                            <select id="type" name="type" required class="form-control">
                                <option value="">Select Component Type</option>
                                <option value="BASE" ${param.type == 'BASE' ? 'selected' : ''}>Base</option>
                                <option value="BROOD_BOX" ${param.type == 'BROOD_BOX' ? 'selected' : ''}>Brood Box</option>
                                <option value="SUPER" ${param.type == 'SUPER' ? 'selected' : ''}>Super</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="position">
                                <i class="fas fa-sort-numeric-up"></i> Position
                            </label>
                            <input type="number" id="position" name="position" required 
                                   value="${param.position}" class="form-control" placeholder="Enter position (e.g., 1 for lowest)"/>
                        </div>

                        <div class="btn-group">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Add Component
                            </button>
                            <a href="${pageContext.request.contextPath}/farmer/hiveDetails?id=${hiveId}" class="btn btn-outline">
                                <i class="fas fa-times"></i> Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>
