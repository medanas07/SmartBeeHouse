<%-- 
    Document   : dashboard
    Created on : 8 juin 2025, 11:18:02
    Author     : moham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Farmer Dashboard</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7f7f7; 
            background-image: 
                linear-gradient(45deg, rgba(230, 126, 34, 0.1) 25%, transparent 25%),
                linear-gradient(-45deg, rgba(230, 126, 34, 0.1) 25%, transparent 25%),
                linear-gradient(45deg, transparent 75%, rgba(230, 126, 34, 0.1) 75%),
                linear-gradient(-45deg, transparent 75%, rgba(230, 126, 34, 0.1) 75%);
            background-size: 60px 104px; 
            background-position: 0 0, 30px 52px, 30px 52px, 0 0;
            color: var(--primary-color);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        header h1 {
            color: #2c3e50;
            font-size: 1.5rem;
        }

        nav {
            display: flex;
            gap: 1.5rem;
        }

        nav a {
            color: #4a5568;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        nav a:hover {
            background-color: #4299e1;
            color: white;
        }

        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        section {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 1.5rem;
            font-size: 1.25rem;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 0.5rem;
        }

        .charts {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .chart-container {
            background-color: white;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .chart-container img {
            max-width: 100%;
            height: auto;
            margin-bottom: 1rem;
        }

        .chart-container h3 {
            color: #2c3e50;
            font-size: 1.1rem;
            margin-top: 0.5rem;
        }

        .alerts ul {
            list-style: none;
        }

        .alerts li {
            padding: 1rem;
            margin-bottom: 0.5rem;
            border-radius: 5px;
            font-weight: 500;
        }

        .alert-info {
            background-color: #ebf8ff;
            color: #2b6cb0;
            border-left: 4px solid #4299e1;
        }

        .alert-warning {
            background-color: #fffaf0;
            color: #c05621;
            border-left: 4px solid #ed8936;
        }

        .alert-error {
            background-color: #fff5f5;
            color: #c53030;
            border-left: 4px solid #f56565;
        }

        .alert-success {
            background-color: #f0fff4;
            color: #2f855a;
            border-left: 4px solid #48bb78;
        }

        footer {
            text-align: center;
            padding: 1.5rem;
            background-color: white;
            color: #4a5568;
            margin-top: 2rem;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            nav {
                flex-direction: column;
                width: 100%;
            }

            nav a {
                text-align: center;
            }
        }

        .map-section {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #map {
            height: 400px;
            width: 100%;
            border-radius: 8px;
            margin-top: 1rem;
        }

        .map-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .map-stats {
            display: flex;
            gap: 1rem;
        }

        .stat-item {
            background-color: #f8fafc;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-size: 0.9rem;
            color: #4a5568;
        }

        .stat-item i {
            margin-right: 0.5rem;
            color: #4299e1;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome, ${farmer.name}</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/farmer/farms">My Farms</a>
            <a  href="${pageContext.request.contextPath}/farmer/agentList">Agent List</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </nav>
    </header>

    <main>
        <section class="production-summary">
            <h2>Production Overview</h2>
            <div class="charts">
                <div class="chart-container">
                    <img src="https://quickchart.io/chart?c={type:'bar',data:{labels:['Jan','Fév','Mar','Avr','Mai','Juin'],datasets:[{label:'Production de Miel (kg)',data:[45,65,85,120,150,180],backgroundColor:'rgba(66,153,225,0.5)'}]}}" alt="Production Mensuelle">
                    <h3>Production Mensuelle</h3>
                </div>
                <div class="chart-container">
                    <img src="https://quickchart.io/chart?c={type:'doughnut',data:{labels:['Miel de Fleurs','Miel de Forêt','Miel de Montagne'],datasets:[{data:[40,35,25],backgroundColor:['rgba(66,153,225,0.5)','rgba(72,187,120,0.5)','rgba(237,137,54,0.5)']}]}}" alt="Types de Miel">
                    <h3>Types de Miel</h3>
                </div>
            </div>
        </section>

        <section class="map-section">
            <div class="map-info">
                <h2>Localisation des Ruches</h2>
                <div class="map-stats">
                    <div class="stat-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>5 Ruches Actives</span>
                    </div>
                    <div class="stat-item">
                        <i class="fas fa-temperature-high"></i>
                        <span>Température Moyenne: 25°C</span>
                    </div>
                </div>
            </div>
            <div id="map"></div>
        </section>
    </main>

    <footer>
        <p>Smart Bee House System © 2025</p>
    </footer>

    <script>
        const map = L.map('map').setView([36.8065, 10.1815], 12);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        const beehiveLocations = [
           
            {
                lat: 36.7800,
                lng: 10.1200,
                name: "Ruche Mornag",
                status: "active",
                temperature: 22
            },
            {
                lat: 36.4029,
                lng: 10.1429,
                name: "Ruche Zaghouan",
                status: "active",
                temperature: 24
            },
            {
                lat: 37.25,
                lng: 9.8333,
                name: "Ruche Bizerte",
                status: "active",
                temperature: 26
            },
            {
                lat: 36.1742,
                lng: 8.7049,
                name: "Ruche El Kef",
                status: "active",
                temperature: 23
            }
        ];

        beehiveLocations.forEach(location => {
            const marker = L.marker([location.lat, location.lng])
                .addTo(map)
                .bindPopup(`
                    <strong>${location.name}</strong><br>
                    Température: ${location.temperature}°C<br>
                    Statut: ${location.status}
                `);
        });
    </script>
         
</body>
</html>