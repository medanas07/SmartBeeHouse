<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Hive Details - ${beehive.name}</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
        <style>
            :root {
                --primary: hsl(140, 46%, 52%);
                --primary-light: hsl(140, 46%, 52%);
                --secondary: hsl(140, 46%, 52%);
                --accent: #f72585;
                --success: #4cc9f0;
                --warning: #f8961e;
                --danger: #ef233c;
                --light: #f8f9fa;
                --dark: #212529;
                --gray: #6c757d;
                --border-radius: 12px;
                --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
                --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body {
                background-color: #f5f7fa;
                color: var(--dark);
                line-height: 1.6;
                min-height: 100vh;
            }

            .hive-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 2rem;
            }

            .hive-header {
                background: linear-gradient(135deg, var(--primary), var(--primary-light));
                color: white;
                padding: 1.5rem 2rem;
                margin: -2rem -2rem 2rem -2rem;
                border-radius: 0 0 var(--border-radius) var(--border-radius);
                box-shadow: var(--shadow);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .hive-header h1 {
                font-size: 1.8rem;
                font-weight: 600;
                display: flex;
                align-items: center;
                gap: 0.8rem;
            }

            .error-message {
                background-color: rgba(239, 35, 60, 0.1);
                color: var(--danger);
                padding: 1rem;
                border-radius: var(--border-radius);
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                font-weight: 500;
            }

            .action-buttons {
                display: flex;
                gap: 1rem;
                margin: 1.5rem 0;
                flex-wrap: wrap;
            }

            .btn {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.75rem 1.5rem;
                border-radius: 8px;
                font-weight: 500;
                cursor: pointer;
                transition: var(--transition);
                text-decoration: none;
                border: none;
                font-size: 0.95rem;
            }

            .btn-primary {
                background-color: var(--primary);
                color: white;
            }

            .btn-primary:hover {
                background-color: var(--primary-light);
                transform: translateY(-2px);
            }

            .btn-secondary {
                background-color: var(--gray);
                color: white;
            }

            .btn-secondary:hover {
                background-color: var(--dark);
                transform: translateY(-2px);
            }

            .btn-no {
                color: var(--danger);
                border: none;
                background: transparent;
                font-weight: 500;
                padding: 0.5rem;
                border-radius: 4px;
                transition: var(--transition);
            }

            .btn-no:hover {
                background-color: rgba(239, 35, 60, 0.1);
            }

            .hive-structure,
            .hive-inspections {
                background-color: #fff;
                border-radius: var(--border-radius);
                box-shadow: var(--shadow);
                padding: 2rem;
                margin-bottom: 2rem;
                border: 1px solid #e0e0e0;
            }

            .hive-structure h2,
            .hive-inspections h2 {
                font-size: 1.5rem;
                color: var(--primary);
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
                gap: 0.75rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid #e0e0e0;
            }

            .component {
                background-color: #fbfbfb;
                border-radius: 8px;
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                border: 1px solid #e9e9e9;
                transition: var(--transition);
            }

            .component:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            }

            .component-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
                font-weight: 600;
                color: var(--dark);
                font-size: 1.1rem;
            }

            .component-header .btn-no {
                color: var(--danger);
                background: transparent;
                border: none;
                cursor: pointer;
                font-size: 1.2em;
                transition: var(--transition);
            }

            .component-header .btn-no:hover {
                color: #ef233c;
                transform: scale(1.1);
            }

            .frames-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
                gap: 1rem;
                margin-top: 1rem;
            }

            .frame {
                background-color: #fff;
                border-radius: 8px;
                padding: 1rem;
                text-align: center;
                transition: var(--transition);
                border: 1px solid #e0e0e0;
            }

            .frame:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            }

            .frame-weight {
                font-weight: 600;
                color: var(--primary);
                font-size: 1.1rem;
                margin: 0.5rem 0;
            }

            .inspections-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin-top: 1.5rem;
                border-radius: var(--border-radius);
                overflow: hidden;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            }

            .inspections-table th,
            .inspections-table td {
                padding: 1rem 1.5rem;
                text-align: left;
                border-bottom: 1px solid #e0e0e0;
            }

            .inspections-table th {
                background-color: var(--primary);
                color: white;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 0.9em;
                letter-spacing: 0.05em;
            }

            .inspections-table tbody tr:last-child td {
                border-bottom: none;
            }

            .inspections-table tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .inspections-table tbody tr:hover {
                background-color: #f0f0f0;
                transition: background-color 0.2s ease-in-out;
            }

            .rating {
                color: #FFD700;
            }

            .health-1, .health-2, .health-3 { color: var(--danger); }
            .prod-1, .prod-2, .prod-3 { color: var(--success); }

            form {
                display: flex;
                gap: 1rem;
                align-items: center;
                margin-top: 1rem;
            }

            input[type="number"] {
                padding: 0.5rem;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 6px;
                font-size: 0.95rem;
                width: 150px;
            }

            input[type="number"]:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.1);
            }

            @media (max-width: 768px) {
                .hive-container {
                    padding: 1rem;
                }

                .hive-header {
                    padding: 1.5rem;
                    margin: -1rem -1rem 1.5rem -1rem;
                }

                .hive-header h1 {
                    font-size: 1.5rem;
                }

                .action-buttons {
                    flex-direction: column;
                }

                .btn {
                    width: 100%;
                    justify-content: center;
                }

                .frames-grid {
                    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                }

                .inspections-table {
                    display: block;
                    overflow-x: auto;
                }

                form {
                    flex-direction: column;
                    align-items: stretch;
                }

                input[type="number"] {
                    width: 100%;
                }

                .component {
                    padding: 1rem;
                }

                .inspections-table th,
                .inspections-table td {
                    padding: 0.8rem;
                }

                .inspections-table th {
                    font-size: 0.8em;
                }
            }
        </style>
    </head>
    <body>
        <div class="hive-container">
            <header class="hive-header">
                <h1><i class="fas fa-bee"></i> Hive: ${beehive.name}</h1>
                <a href="${pageContext.request.contextPath}/farmer/siteDetails?id=${siteId}" class="btn btn-secondary btn-sm">
                    <i class="fas fa-arrow-left"></i> Back to Site
                </a>
            </header>

            <c:if test="${not empty sessionScope.error}">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i> ${sessionScope.error}
                </div>
                <c:remove var="error" scope="session"/>
            </c:if>

            <div class="action-buttons">
                <form method="post" action="${pageContext.request.contextPath}/farmer/hiveDetails" style="display:inline;">
                    <input type="hidden" name="id" value="${beehive.id}"/>
                    <input type="hidden" name="addComp" value="1"/>
                    <button class="btn btn-primary" type="submit">
                        <i class="fas fa-plus"></i> Add Hive Component
                    </button>
                </form>
            </div>

            <div class="hive-structure">
                <h2><i class="fas fa-layer-group"></i> Hive Structure</h2>

                <c:forEach items="${beehive.components}" var="component">
                    <div class="component">
                        <div class="component-header">
                            <c:choose>
                                <c:when test="${component.type == 'base'}">
                                    <i class="fas fa-box"></i> Base Component
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-layer-group"></i> Extension ${component.position}
                                </c:otherwise>
                            </c:choose>
                            <form method="post" style="display:inline;" action="${pageContext.request.contextPath}/farmer/hiveDetails">
                                <input type="hidden" name="removeComponent" value="${component.id}"/>
                                <input type="hidden" name="id" value="${beehive.id}"/>
                                <button type="submit" class="btn-no" onclick="return confirm('Remove this component?')">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </div>

                        <c:if test="${not empty component.frames}">
                            <div class="frames-grid">
                                <c:forEach items="${component.frames}" var="frame">
                                    <div class="frame">
                                        <div><i class="fas fa-border-all"></i> Slot ${frame.slotNumber}</div>
                                        <div class="frame-weight">
                                            <fmt:formatNumber value="${frame.weight}" maxFractionDigits="2"/> kg
                                        </div>
                                        <form method="post" action="${pageContext.request.contextPath}/farmer/hiveDetails" style="margin-top: 5px;">
                                            <input type="hidden" name="removeFrame" value="${frame.id}"/>
                                            <input type="hidden" name="id" value="${beehive.id}"/>
                                            <button type="submit" class="btn-no" onclick="return confirm('Remove this frame?')">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>

                        <c:if test="${component.frames.size() < 10}">
                            <form method="post" action="${pageContext.request.contextPath}/farmer/hiveDetails" style="margin-top:10px;">
                                <input type="hidden" name="addFrame" value="1"/>
                                <input type="hidden" name="id" value="${beehive.id}"/>
                                <input type="hidden" name="frm" value="${component.id}"/>
                                <input type="number" name="weight" placeholder="Weight (kg)" step="0.1" required class="form-control"/>
                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-plus"></i> Add Frame
                                </button>
                            </form>
                        </c:if>
                    </div>
                </c:forEach>
            </div>

            <div class="hive-inspections">
                <h2><i class="fas fa-clipboard-check"></i> Inspection History</h2>

                <table class="inspections-table">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Agent</th>
                            <th>Reason</th>
                            <th>Health</th>
                            <th>Productivity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${beehive.inspections}" var="inspection">
                            <tr>
                                <td><fmt:formatDate value="${inspection.date}" pattern="MMM d, yyyy"/></td>
                                <td>${inspection.agent.name}</td>
                                <td>${inspection.reason}</td>
                                <td>
                                    <span class="rating health-${inspection.healthRating}">
                                        <c:forEach begin="1" end="${inspection.healthRating}">★</c:forEach>
                                        <c:forEach begin="${inspection.healthRating + 1}" end="3">☆</c:forEach>
                                    </span>
                                </td>
                                <td>
                                    <span class="rating prod-${inspection.productivityRating}">
                                        <c:forEach begin="1" end="${inspection.productivityRating}">★</c:forEach>
                                        <c:forEach begin="${inspection.productivityRating + 1}" end="3">☆</c:forEach>
                                    </span>
                                </td>
                               
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
