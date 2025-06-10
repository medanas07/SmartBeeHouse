<%-- 
    Document   : error
    Created on : 8 juin 2025, 16:54:35
    Author     : moham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error - Smart Bee House System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style>
        .error-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        .error-icon {
            font-size: 72px;
            color: #e74c3c;
            margin-bottom: 20px;
        }
        .error-heading {
            color: #e74c3c;
            margin-bottom: 20px;
        }
        .error-message {
            font-size: 18px;
            margin-bottom: 30px;
            color: #333;
        }
        .error-details {
            background-color: #f9f9f9;
            border-radius: 5px;
            padding: 15px;
            margin: 20px 0;
            text-align: left;
            font-family: monospace;
            overflow-x: auto;
        }
        .error-actions {
            margin-top: 30px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-primary {
            background-color: #3498db;
            color: white;
        }
        .btn-primary:hover {
            background-color: #2980b9;
        }
        .btn-secondary {
            background-color: #95a5a6;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
        .technical-details-toggle {
            color: #3498db;
            cursor: pointer;
            font-size: 14px;
            margin-top: 15px;
            display: inline-block;
        }
        .hidden {
            display: none;
        }
        .status-code {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚠️</div>
        
        <c:choose>
            <c:when test="${not empty requestScope['jakarta.servlet.error.status_code']}">
                <div class="status-code">Error ${requestScope['jakarta.servlet.error.status_code']}</div>
            </c:when>
            <c:otherwise>
                <h1 class="error-heading">An Error Occurred</h1>
            </c:otherwise>
        </c:choose>
        
        <div class="error-message">
            <c:choose>
                <c:when test="${not empty error}">
                    ${error}
                </c:when>
                <c:when test="${not empty requestScope['jakarta.servlet.error.message']}">
                    ${requestScope['jakarta.servlet.error.message']}
                </c:when>
                <c:otherwise>
                    We're sorry, but something went wrong while processing your request.
                </c:otherwise>
            </c:choose>
        </div>
        
        <c:if test="${not empty pageContext.exception or not empty requestScope['jakarta.servlet.error.exception']}">
            <div class="technical-details-toggle" onclick="toggleDetails()">
                Show Technical Details
            </div>
            
            <div id="errorDetails" class="error-details hidden">
                <h3>Technical Information:</h3>
                <p><strong>Exception:</strong> 
                    ${not empty pageContext.exception ? pageContext.exception.class.name : 
                      requestScope['jakarta.servlet.error.exception'].class.name}
                </p>
                
                <p><strong>Message:</strong> 
                    ${not empty pageContext.exception ? pageContext.exception.message : 
                      requestScope['jakarta.servlet.error.exception'].message}
                </p>
                
                <c:if test="${not empty pageContext.exception or not empty requestScope['jakarta.servlet.error.exception']}">
                    <h4>Stack Trace:</h4>
                    <pre><code>
                        <c:forEach items="${not empty pageContext.exception ? 
                                          pageContext.exception.stackTrace : 
                                          requestScope['jakarta.servlet.error.exception'].stackTrace}" 
                                   var="trace" end="15">
${trace}
                        </c:forEach>
                    </code></pre>
                </c:if>
                
                <c:if test="${not empty requestScope['jakarta.servlet.error.request_uri']}">
                    <p><strong>Request URI:</strong> ${requestScope['jakarta.servlet.error.request_uri']}</p>
                </c:if>
                
                <c:if test="${not empty requestScope['jakarta.servlet.error.servlet_name']}">
                    <p><strong>Servlet:</strong> ${requestScope['jakarta.servlet.error.servlet_name']}</p>
                </c:if>
            </div>
        </c:if>
        
        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/farmer/dashboard" class="btn btn-primary">
                Return to Dashboard
            </a>
            <a href="javascript:history.back()" class="btn btn-secondary">
                Go Back
            </a>
        </div>
    </div>

    <script>
        function toggleDetails() {
            const details = document.getElementById('errorDetails');
            const toggle = document.querySelector('.technical-details-toggle');
            
            if (details.classList.contains('hidden')) {
                details.classList.remove('hidden');
                toggle.textContent = 'Hide Technical Details';
            } else {
                details.classList.add('hidden');
                toggle.textContent = 'Show Technical Details';
            }
        }
    </script>
</body>
</html>