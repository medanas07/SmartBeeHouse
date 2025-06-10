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