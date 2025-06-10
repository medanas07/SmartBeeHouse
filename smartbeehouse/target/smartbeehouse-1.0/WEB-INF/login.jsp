<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Connexion - Smart Bee House</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            background-image: url('login.jpg');
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            backdrop-filter: blur(5px);
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
        }

        .error-message {
            color: #e74c3c;
            background-color: rgba(253, 232, 232, 0.9);
            padding: 0.75rem;
            border-radius: 5px;
            margin-bottom: 1rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #4a5568;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 5px;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-sizing: border-box;
            background-color: rgba(255, 255, 255, 0.9);
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.2);
            background-color: white;
        }

        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #4299e1;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #3182ce;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .register-link {
            text-align: center;
            margin-top: 1rem;
            color: #4a5568;
        }

        .register-link a {
            color: #4299e1;
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .home-link-container {
            text-align: center;
            margin-top: 1.5rem;
        }

        .home-link-button {
            background-color: #4299e1;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .home-link-button:hover {
            background-color: #3182ce;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    
    <div class="login-container">
        <h2>Connexion à Smart Bee House</h2>
        

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form method="post" action="login">
            <div class="form-group">
                <label>Email :</label>
                <input type="text" name="email" required />
            </div>
            <div class="form-group">
                <label>Mot de passe :</label>
                <input type="password" name="password" required />
            </div>
            <input type="submit" value="Se connecter" />
        </form>
        <div class="register-link">
            Pas encore de compte ? <a href="register">S'inscrire</a>
        </div><br><br>
        <div class="home-link-container" style="text-align: center; margin-top: 1rem;">
            <a href="${pageContext.request.contextPath}/index.jsp" class="home-link-button">Retour à l'accueil</a>
        </div>
       
    </div>
</body>
</html>
