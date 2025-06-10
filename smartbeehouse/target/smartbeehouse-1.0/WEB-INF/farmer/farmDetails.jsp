<%-- 
    Document   : farmDetail
    Created on : 8 juin 2025, 15:45:44
    Author     : moham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Farm Details - ${farm.name}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
    <style>
        /* General spacing and alignment */
        main.container {
            padding-top: 2rem;
            padding-bottom: 2rem;
        }

        .btn-group {
            margin-bottom: 2rem;
        }

        /* Card enhancements */
        .card {
            margin-bottom: 2.5rem;
            border: 1px solid #e0e0e0;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background-color: #f8f9fa;
            padding: 1.25rem 1.75rem;
            border-bottom: 1px solid #e0e0e0;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .card-title {
            font-size: 1.5rem;
            color: var(--primary);
        }

        .card-body {
            padding: 1.75rem;
        }

        /* Info Grid Styling */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            padding: 1.75rem;
        }

        .info-item {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            background-color: #fbfbfb;
            padding: 1rem;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
        }

        .info-item .info-icon {
            color: var(--primary);
            font-size: 1.5em;
            min-width: 30px;
        }

        .info-item strong {
            color: var(--dark);
        }

        /* Metrics Grid Styling */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2.5rem;
        }

        .metric-card {
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease-in-out;
        }

        .metric-card:hover {
            transform: translateY(-5px);
        }

        .metric-icon {
            font-size: 3em;
            margin-bottom: 0.5rem;
        }

        .metric-title {
            font-size: 1em;
            opacity: 0.8;
            margin-bottom: 0.5rem;
        }

        .metric-value {
            font-size: 2.5em;
            font-weight: 700;
        }

        /* Site Card Styling */
        .site-card {
            background-color: #fff;
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid #e9e9e9;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .site-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .site-title {
            font-size: 1.3em;
            color: var(--dark);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            font-weight: 600;
            padding-bottom: 0.75rem;
            border-bottom: 1px dashed #e0e0e0;
        }

        .site-title .badge {
            margin-left: auto;
            font-size: 0.7em;
            padding: 0.3em 0.8em;
        }

        .site-card .info-grid {
            padding: 0;
            margin-top: 1rem;
        }

        .site-card .info-item {
            background-color: transparent;
            border: none;
            padding: 0.5rem 0;
        }

        .site-card .info-item .info-icon {
            font-size: 1.2em;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .info-grid, .metrics-grid {
                grid-template-columns: 1fr;
            }

            .card-title {
                font-size: 1.3rem;
            }

            .metric-value {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1><i class="fas fa-tractor"></i> ${farm.name}</h1>
            <nav>
                <a href="${pageContext.request.contextPath}/farmer/farms">
                    <i class="fas fa-arrow-left"></i> My Farms
                </a>
                <a href="${pageContext.request.contextPath}/farmer">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </nav>
        </div>
    </header>

    <main class="container">
        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/farmer/addSite?farmId=${farm.id}" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add New Site
            </a>
            
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title"><i class="fas fa-info-circle"></i> Farm Overview</h2>
            </div>
            <div class="info-grid">
                <div class="info-item">
                    <i class="fas fa-signature info-icon"></i>
                    <div>
                        <strong>Name:</strong> ${not empty farm.name ? farm.name : 'Not specified'}
                    </div>
                </div>
            </div>
        </div>

        <div class="metrics-grid">
            <div class="metric-card">
                <div class="metric-icon"><i class="fas fa-map-marked-alt"></i></div>
                <div class="metric-title">Total Sites</div>
                <div class="metric-value">${farm.apiarySites.size()}</div>
            </div>
            <div class="metric-card">
                <div class="metric-icon"><i class="fas fa-bee"></i></div>
                <div class="metric-title">Total Hives</div>
                <div class="metric-value">
                    <c:set var="totalHives" value="0"/>
                    <c:forEach items="${farm.apiarySites}" var="site">
                        <c:set var="totalHives" value="${totalHives + site.beehives.size()}"/>
                    </c:forEach>
                    ${totalHives}
                </div>
            </div>
            <div class="metric-card">
                <div class="metric-icon"><i class="fas fa-calendar-check"></i></div>
                <div class="metric-title">Last Inspection</div>
                <div class="metric-value">
                    <c:choose>
                        <c:when test="${not empty lastInspection}">
                            <fmt:formatDate value="${lastInspection.date}" pattern="MMM d, yyyy"/>
                        </c:when>
                        <c:otherwise>
                            Never
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title"><i class="fas fa-map-marked-alt"></i> Apiary Sites</h2>
            </div>
            
            <c:choose>
                <c:when test="${not empty farm.apiarySites && !farm.apiarySites.isEmpty()}">
                    <c:forEach items="${farm.apiarySites}" var="site">
                        <div class="site-card">
                            <h3 class="site-title">
                                <i class="fas fa-map-pin"></i> 
                                Site #${site.id}
                                <c:if test="${not empty site.closingDate}">
                                    <span class="badge badge-warning">Closed</span>
                                </c:if>
                            </h3>
                            
                            <div class="info-grid">
                                <div class="info-item">
                                    <i class="fas fa-map-marker-alt info-icon"></i>
                                    <div>
                                        <strong>Coordinates:</strong> (${site.latitude}, ${site.longitude})
                                    </div>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-mountain info-icon"></i>
                                    <div>
                                        <strong>Altitude:</strong> ${site.altitude} meters
                                    </div>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-calendar-day info-icon"></i>
                                    <div>
                                        <strong>Established:</strong> <fmt:formatDate value="${site.implementationDate}" pattern="MMM d, yyyy"/>
                                    </div>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-bee info-icon"></i>
                                    <div>
                                        <strong>Hives:</strong> ${site.beehives.size()}
                                    </div>
                                </div>
                            </div>
                            
                            <div class="btn-group" style="margin-top: 1.5rem;">
                                <a href="${pageContext.request.contextPath}/farmer/addHive?siteId=${site.id}" class="btn btn-primary btn-sm">
                                    <i class="fas fa-plus"></i> Add Hive
                                </a>
                                <a href="${pageContext.request.contextPath}/farmer/siteDetails?id=${site.id}" class="btn btn-outline btn-sm">
                                    <i class="fas fa-search"></i> View Details
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon"><i class="fas fa-map-marked-alt"></i></div>
                        <h3>No Apiary Sites Found</h3>
                        <p class="empty-text">This farm doesn't have any apiary sites yet.</p>
                        <a href="${pageContext.request.contextPath}/farmer/addSite?farmId=${farm.id}" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Add First Site
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <footer>
        <p>Smart Bee House System © 2025</p>
    </footer>
</body>
</html>