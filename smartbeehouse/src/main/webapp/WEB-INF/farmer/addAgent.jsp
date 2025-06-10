<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Agent - Smart Bee House</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/farmer.css">
<style>
    /* Form Specific Styles */
.main-content {
    padding: 2rem;
    max-width: 1200px;
    margin: 0 auto;
}

.form-container {
    background-color: white;
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
    overflow: hidden;
    max-width: 800px;
    margin: 0 auto;
}

.form-header {
    padding: 1.5rem;
    border-bottom: 1px solid #eee;
    background-color: #f8fafc;
}

.form-header h2 {
    font-size: 1.5rem;
    color: var(--dark-color);
    margin-bottom: 0.5rem;
    display: flex;
    align-items: center;
    gap: 0.8rem;
}

.form-header p {
    color: #64748b;
    font-size: 0.95rem;
}

form {
    padding: 1.5rem;
}

.form-row {
    display: flex;
    gap: 1.5rem;
    margin-bottom: 1.5rem;
}

.form-col {
    flex: 1;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: var(--dark-color);
}

.form-group label.required-field::after {
    content: " *";
    color: var(--danger-color);
}

.form-group input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 1px solid #ddd;
    border-radius: var(--border-radius);
    font-family: inherit;
    transition: var(--transition);
}

.form-group input:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.2);
}

.error-message {
    display: block;
    margin-top: 0.5rem;
    color: var(--danger-color);
    font-size: 0.85rem;
}

.btn-group {
    display: flex;
    gap: 1rem;
    justify-content: flex-end;
    margin-top: 2rem;
    padding-top: 1.5rem;
    border-top: 1px solid #eee;
}

.btn-secondary {
    background-color: #e2e8f0;
    color: var(--dark-color);
}

.btn-secondary:hover {
    background-color: #cbd5e1;
    transform: translateY(-2px);
}

/* Password Field Styles */
.password-wrapper {
    position: relative;
}

.password-toggle {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #64748b;
}

/* Responsive Styles for Form */
@media (max-width: 768px) {
    .form-row {
        flex-direction: column;
        gap: 0;
    }
    
    .form-col {
        width: 100%;
    }
    
    .btn-group {
        flex-direction: column;
    }
    
    .btn-group .btn {
        width: 100%;
        justify-content: center;
    }
}

/* Animation for Form Elements */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

.form-group {
    animation: fadeIn 0.5s ease-out forwards;
}

.form-group:nth-child(1) { animation-delay: 0.1s; }
.form-group:nth-child(2) { animation-delay: 0.2s; }
.form-group:nth-child(3) { animation-delay: 0.3s; }
.btn-group { animation: fadeIn 0.5s ease-out 0.4s forwards; }
</style>
</head>
<body>
    <header>
        <h1><i class="fas fa-user-plus"></i> Add New Agent</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/farmer/agentList" class="btn"><i class="fas fa-arrow-alt-circle-left"></i> Back to Agents</a>
        </nav>
    </header>

    <div class="main-content">
        <div class="form-container">
            <div class="form-header">
                <h2>Agent Information</h2>
                <p>Please fill in the details for the new beekeeping agent</p>
            </div>

            <form method="POST" id="agentForm">
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="name" class="required-field">Name</label>
                            <input type="text" id="name" name="name" required
                                   value="<c:out value="${param.name}"/>">
                            
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="email" class="required-field">Email</label>
                            <input type="email" id="email" name="email" required
                                   value="<c:out value="${param.email}"/>">
                                                   </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password">
                    
                </div>

                <div class="btn-group">
                    <button type="reset" class="btn btn-secondary"><i class="fas fa-redo"></i> Reset Form</button>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Agent</button>
                </div>
            </form>
        </div>
    </div>

    
</body>
</html>