<%-- 
    Document   : siteDetails
    Created on : 9 juin 2025, 20:57:47
    Author     : moham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Site Details - ${site.id}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">

</head>
<body>
    <div class="site-container">
        <div class="site-header">
            <div style="text-align: right;">
                <a  href="${pageContext.request.contextPath}/farmer/farmDetails?id=${farmId}" class="btn btn-secondary">Back to Farm</a>
            </div>
        </div>

        <div class="action-buttons">
            <center><a href="${pageContext.request.contextPath}/farmer/addHive?siteId=${site.id}" class="btn btn-primary">Add New Hive</a></center>
        </div>

        <div class="site-info">
            <div class="info-card">
                <h3>Location Details</h3>
                <p><strong>Coordinates:</strong> ${site.latitude}, ${site.longitude}</p>
                <p><strong>Altitude:</strong> ${site.altitude} meters</p>
                <p><strong>Established:</strong> <fmt:formatDate value="${site.implementationDate}" pattern="yyyy-MM-dd"/></p>
                <c:if test="${not empty site.closingDate}">
                    <p><strong>Closed:</strong> <fmt:formatDate value="${site.closingDate}" pattern="yyyy-MM-dd"/></p>
                </c:if>
            </div>

            <div class="info-card">
                <h3>Site Statistics</h3>
                <p><strong>Total Hives:</strong> ${site.beehives.size()}</p>
                </p>
                <p><strong>Last Inspection:</strong> 
                    <c:set var="lastInspectionDate" value=""/>
                    <c:forEach items="${site.beehives}" var="hive">
                        <c:forEach items="${hive.inspections}" var="inspection">
                            <c:if test="${empty lastInspectionDate or inspection.date.time gt lastInspectionDate.time}">
                                <c:set var="lastInspectionDate" value="${inspection.date}"/>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${not empty lastInspectionDate}">
                            <fmt:formatDate value="${lastInspectionDate}" pattern="yyyy-MM-dd"/>
                        </c:when>
                        <c:otherwise>
                            Never inspected
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>


        <h2>Hives at This Site</h2>
        
        <c:choose>
            <c:when test="${not empty site.beehives and site.beehives.size() > 0}">
                <div class="hives-grid">
                    <c:forEach items="${site.beehives}" var="hive">
                        <div class="hive-card">
                            <div class="hive-header">
                                <h3><a href="${pageContext.request.contextPath}/farmer/hiveDetails?id=${hive.id}&siteId=${site.id}">${hive.name}</a></h3>
                            </div>
                            <div class="hive-stats">
                                <div class="stat">
                                    <div class="stat-value">${hive.components.size()}</div>
                                    <div>Components</div>
                                </div>
                                <div class="stat">
                                    <div class="stat-value">
                                        <c:set var="totalFrames" value="0"/>
                                        <c:forEach items="${hive.components}" var="comp">
                                            <c:set var="totalFrames" value="${totalFrames + comp.frames.size()}"/>
                                        </c:forEach>
                                        ${totalFrames}
                                    </div>
                                    <div>Frames</div>
                                </div>
                                <div class="stat">
                                    <div class="stat-value">${hive.inspections.size()}</div>
                                    <div>Inspections</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <h3>No Hives Found at This Site</h3>
                    <p>There are currently no hives registered at this apiary site.</p>
                    <a href="${pageContext.request.contextPath}/farmer/addHive?siteId=${site.id}" class="btn btn-success">Add First Hive</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>