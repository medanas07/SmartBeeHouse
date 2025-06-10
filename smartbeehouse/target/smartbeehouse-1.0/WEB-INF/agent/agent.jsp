<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Agent Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 1090px; 
            margin: 20px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 3px solid #3498db;
        }

        h1 {
            color: #2c3e50;
            text-align: left; 
            margin: 0; 
            padding: 0;
            border-bottom: none; 
        }

        .logout-button {
            background-color: #e74c3c; /* A distinct color for logout */
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9em;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .logout-button:hover {
            background-color: #c0392b;
        }

        h2 {
            color: #34495e;
            margin: 30px 0 20px; 
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px; 
            background-color: #ffffff; 
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05); 
            border-radius: 8px; 
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #e0e0e0;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            max-width: 500px;
            margin: 30px auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 600;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
            transition: border-color 0.3s ease;
            margin-bottom: 10px;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #3498db;
            outline: none;
        }

        input[type="submit"] {
            background-color: #2ecc71;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: 600;
            transition: background-color 0.3s ease;
            width: 100%;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #27ae60;
        }

        @media screen and (max-width: 768px) {
            body {
                padding: 10px;
            }

            .container {
                margin: 10px auto;
                padding: 15px;
            }

            .header-content {
                flex-direction: column;
                align-items: flex-start;
            }

            h1 {
                font-size: 1.8em;
                margin-bottom: 15px;
            }

            .logout-button {
                width: 100%;
                text-align: center;
            }

            h2 {
                font-size: 1.4em;
                margin: 20px 0 15px;
            }

            th, td {
                padding: 10px;
                font-size: 0.9em;
            }

            table {
                max-width: 100%;
                margin: 20px 0;
            }
            
            form {
                padding: 20px;
                max-width: 100%;
                margin: 20px 0;
            }

            input[type="text"],
            input[type="date"],
            input[type="number"],
            select {
                width: 100%;
                padding: 8px;
                margin-bottom: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-content">
            <h1>Welcome, Agent ${agent.name}</h1>
            <a href="${pageContext.request.contextPath}/logout" class="logout-button">Logout</a>
        </div>

        <h2>All Inspections</h2>
        <div style="overflow-x:auto;">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Reason</th>
                        <th>Findings</th>
                        <th>Actions Taken</th>
                        <th>Recommendations</th>
                        <th>Population Rating</th>
                        <th>Health Rating</th>
                        <th>Productivity Rating</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="inspection" items="${inspections}">
                        <tr>
                            <td>${inspection.id}</td>
                            <td>${inspection.date}</td>
                            <td>${inspection.reason}</td>
                            <td>${inspection.findings}</td>
                            <td>${inspection.actionsTaken}</td>
                            <td>${inspection.recommendations}</td>
                            <td>${inspection.populationRating}</td>
                            <td>${inspection.healthRating}</td>
                            <td>${inspection.productivityRating}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <h2>Add Inspection</h2>
        <form method="post">
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date"/>
            </div>
            <div class="form-group">
                <label for="reason">Reason:</label>
                <input type="text" id="reason" name="reason"/>
            </div>
            <div class="form-group">
                <label for="findings">Findings:</label>
                <input type="text" id="findings" name="findings"/>
            </div>
            <div class="form-group">
                <label for="actionsTaken">Actions Taken:</label>
                <input type="text" id="actionsTaken" name="actionsTaken"/>
            </div>
            <div class="form-group">
                <label for="recommendations">Recommendations:</label>
                <input type="text" id="recommendations" name="recommendations"/>
            </div>
            <div class="form-group">
                <label for="populationRating">Population Rating:</label>
                <input type="number" id="populationRating" name="populationRating" min="1" max="3"/>
            </div>
            <div class="form-group">
                <label for="healthRating">Health Rating:</label>
                <input type="number" id="healthRating" name="healthRating" min="1" max="3"/>
            </div>
            <div class="form-group">
                <label for="productivityRating">Productivity Rating:</label>
                <input type="number" id="productivityRating" name="productivityRating" min="1" max="3"/>
            </div>
            <div class="form-group">
                <label for="beehiveId">Beehive:</label>
                <select id="beehiveId" name="beehiveId">
                    <c:forEach items="${hive}" var="hv">
                        <option value="${hv.id}">${hv.id} - ${hv.name}</option>
                    </c:forEach>
                </select>
            </div>
            <input type="submit" value="Add Inspection"/>
        </form>
    </div>
</body>
</html>
