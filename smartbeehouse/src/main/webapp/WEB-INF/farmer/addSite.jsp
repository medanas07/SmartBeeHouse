<%-- 
    Document   : addSite
    Created on : 8 juin 2025, 16:40:07
    Author     : moham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Apiary Site</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
    <style>
        /* General Styles */
:root {
    --primary-color: #4a8f29;
    --secondary-color: #3a7320;
    --accent-color: #6bbd4b;
    --light-color: #f8f9fa;
    --dark-color: #343a40;
    --error-color: #dc3545;
    --warning-color: #ffc107;
    --info-color: #17a2b8;
    --border-radius: 5px;
    --box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #f5f5f5;
    color: #333;
    line-height: 1.6;
}

/* Header Styles */
.header {
    background-color: var(--primary-color);
    color: white;
    padding: 1.5rem 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: var(--box-shadow);
}

.header h1 {
    font-size: 1.8rem;
    display: flex;
    align-items: center;
    gap: 0.8rem;
}

.header nav a {
    color: white;
    text-decoration: none;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    border-radius: var(--border-radius);
    transition: background-color 0.3s;
}

.header nav a:hover {
    background-color: var(--secondary-color);
}

/* Main Content Styles */
.main-content {
    max-width: 1200px;
    margin: 2rem auto;
    padding: 0 1rem;
}

.form-container {
    background-color: white;
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
    overflow: hidden;
}

.form-header {
    padding: 1.5rem 2rem;
    border-bottom: 1px solid #eee;
}

.form-header h2 {
    color: var(--dark-color);
    margin-bottom: 0.5rem;
}

.form-header p {
    color: #666;
}

/* Form Styles */
form {
    padding: 1.5rem 2rem;
}

.form-row {
    display: flex;
    flex-wrap: wrap;
    gap: 1.5rem;
    margin-bottom: 1.5rem;
}

.form-group {
    flex: 1;
    min-width: 250px;
    margin-bottom: 1rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: var(--dark-color);
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.form-group input[type="text"],
.form-group input[type="number"],
.form-group input[type="date"],
.form-group input[type="email"],
.form-group input[type="password"],
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ddd;
    border-radius: var(--border-radius);
    font-size: 1rem;
    transition: border-color 0.3s;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    border-color: var(--primary-color);
    outline: none;
    box-shadow: 0 0 0 3px rgba(74, 143, 41, 0.2);
}

.coordinates-help {
    font-size: 0.8rem;
    color: #666;
    display: block;
    margin-top: 0.3rem;
}

/* Map Preview */
#mapPreview {
    background-color: #f8f9fa;
    border: 1px dashed #ccc;
    border-radius: var(--border-radius);
    padding: 1.5rem;
    text-align: center;
    min-height: 150px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 0.5rem;
}

#mapPreview i {
    font-size: 2rem;
    color: var(--primary-color);
    margin-bottom: 1rem;
}

/* Button Styles */
.btn-group {
    display: flex;
    gap: 1rem;
    margin-top: 2rem;
    flex-wrap: wrap;
}

.btn {
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: var(--border-radius);
    font-size: 1rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    text-decoration: none;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
}

.btn-primary:hover {
    background-color: var(--secondary-color);
}

.btn-secondary {
    background-color: #6c757d;
    color: white;
}

.btn-secondary:hover {
    background-color: #5a6268;
}

/* Error Messages */
.error-message {
    color: var(--error-color);
    font-size: 0.85rem;
    margin-top: 0.3rem;
    display: block;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .header {
        flex-direction: column;
        text-align: center;
        gap: 1rem;
    }
    
    .form-row {
        flex-direction: column;
        gap: 1rem;
    }
    
    .btn-group {
        flex-direction: column;
    }
    
    .btn {
        width: 100%;
    }
}

/* Section Headers */
h3 {
    color: var(--dark-color);
    margin: 1.5rem 0 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid #eee;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}
    </style>
</head>
<body>
    <div class="header">
        <h1><i class="fas fa-map-marker-alt"></i> Add New Apiary Site</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/farmer/farmDetails?id=${farmId}">
                <i class="fas fa-arrow-left"></i> Back to Farm
            </a>
        </nav>
    </div>

    <div class="main-content">
        <div class="form-container">
            <div class="form-header">
                <h2>Site Information</h2>
                <p>Please provide details about the new apiary site location</p>
            </div>

            <form action="${pageContext.request.contextPath}/farmer/addSite" method="POST" id="siteForm">
                <input type="hidden" name="farmId" value="${farmId}">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="implementationDate">
                            <i class="fas fa-calendar-alt"></i> Implementation Date *
                        </label>
                        <input type="date" id="implementationDate" name="implementationDate" required
                               value="${not empty param.implementationDate ? param.implementationDate : ''}">
                        <c:if test="${not empty errors.implementationDate}">
                            <span class="error-message">${errors.implementationDate}</span>
                        </c:if>
                    </div>
                </div>

                <h3><i class="fas fa-location-dot"></i> Location Details</h3>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="latitude">
                            <i class="fas fa-map-location-dot"></i> Latitude *
                        </label>
                        <input type="number" id="latitude" name="latitude" step="0.000001" required
                               value="${not empty param.latitude ? param.latitude : ''}">
                        <span class="coordinates-help">Decimal degrees (e.g. 34.052235)</span>
                        <c:if test="${not empty errors.latitude}">
                            <span class="error-message">${errors.latitude}</span>
                        </c:if>
                    </div>
                    <div class="form-group">
                        <label for="longitude">
                            <i class="fas fa-map-location-dot"></i> Longitude *
                        </label>
                        <input type="number" id="longitude" name="longitude" step="0.000001" required
                               value="${not empty param.longitude ? param.longitude : ''}">
                        <span class="coordinates-help">Decimal degrees (e.g. -118.243683)</span>
                        <c:if test="${not empty errors.longitude}">
                            <span class="error-message">${errors.longitude}</span>
                        </c:if>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="altitude">
                            <i class="fas fa-mountain"></i> Altitude (meters)
                        </label>
                        <input type="number" id="altitude" name="altitude"
                               value="${not empty param.altitude ? param.altitude : ''}">
                    </div>
                </div>

                <div class="form-group">
                    <label><i class="fas fa-map"></i> Location Preview</label>
                    <div id="mapPreview">
                        <p><i class="fas fa-map-marked-alt"></i> Map preview will appear here when coordinates are entered</p>
                    </div>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Save Site
                    </button>
                    <a href="${pageContext.request.contextPath}/farmer/farmDetails?id=${farmId}" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('siteForm').addEventListener('submit', function(e) {
            const latitude = parseFloat(document.getElementById('latitude').value);
            const longitude = parseFloat(document.getElementById('longitude').value);
            
            if (isNaN(latitude) || latitude < -90 || latitude > 90) {
                e.preventDefault();
                alert('Please enter a valid latitude between -90 and 90 degrees');
                return false;
            }
            
            if (isNaN(longitude) || longitude < -180 || longitude > 180) {
                e.preventDefault();
                alert('Please enter a valid longitude between -180 and 180 degrees');
                return false;
            }
            
            return true;
        });

        document.getElementById('latitude').addEventListener('input', updateMapPreview);
        document.getElementById('longitude').addEventListener('input', updateMapPreview);
        
        function updateMapPreview() {
            const lat = document.getElementById('latitude').value;
            const lng = document.getElementById('longitude').value;
            const mapPreview = document.getElementById('mapPreview');
            
            if (lat && lng) {
                mapPreview.innerHTML = `
                    <div style="text-align: center;">
                        <i class="fas fa-map-marked-alt" style="font-size: 2rem; color: var(--primary-color); margin-bottom: 1rem;"></i>
                        <p>Preview for coordinates:</p>
                        <p style="font-weight: bold;">${lat}, ${lng}</p>
                        <p style="font-size: 0.9rem; color: #666;">In a real implementation, this would show a map</p>
                    </div>`;
            } else {
                mapPreview.innerHTML = '<p><i class="fas fa-map-marked-alt"></i> Map preview will appear here when coordinates are entered</p>';
            }
        }
    </script>
</body>
</html>