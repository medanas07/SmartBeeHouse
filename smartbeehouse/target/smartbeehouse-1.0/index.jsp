<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Bee House - Gestion Apicole Intelligente</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
            color: #2d3748;
            line-height: 1.6;
        }

        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('accueil.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content {
            max-width: 800px;
            padding: 4rem 2rem;
            min-height: 200px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }

        .subtitle {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            font-weight: 400;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7);
        }

        .features {
            padding: 4rem 2rem;
            background: white;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            text-align: center;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            margin-bottom: 1rem;
        }

        .feature-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #2d3748;
        }

        .feature-description {
            color: #4a5568;
        }

        .cta-button {
            display: inline-block;
            padding: 1rem 2.5rem;
            background: #3182ce;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: background 0.3s ease;
            margin-top: 1rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .cta-button:hover {
            background: #225ea8;
            transform: translateY(-2px);
        }

        .home-buttons {
            margin-top: 30px;
            display: flex;
            gap: 20px;
            justify-content: center;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }
            .subtitle {
                font-size: 1.2rem;
            }
            .features-grid {
                grid-template-columns: 1fr;
            }
            .home-buttons {
                flex-direction: column;
                gap: 15px;
                align-items: center;
            }
            .cta-button {
                width: 80%;
                margin: 0.5rem auto;
            }
        }
    </style>
</head>
<body>
    <section class="hero">
        <div class="home-container">
            <h1>Welcome to Smart Bee House</h1>
            <div class="home-buttons">
                <a href="${pageContext.request.contextPath}/agent" class="cta-button">Agent Portal</a>
                <a href="${pageContext.request.contextPath}/farmer" class="cta-button">Farmer Portal</a>
            </div>
        </div>
    </section>

    <section class="features">
        <div class="features-grid">
            <div class="feature-card">
                <img src="https://cdn-icons-png.flaticon.com/512/1995/1995574.png" alt="Surveillance" class="feature-icon">
                <h3 class="feature-title">Surveillance en temps réel</h3>
                <p class="feature-description">Suivez l'état de vos ruches et la santé de vos abeilles en temps réel grâce à nos capteurs connectés.</p>
            </div>
            <div class="feature-card">
                <img src="https://cdn-icons-png.flaticon.com/512/1995/1995575.png" alt="Analytics" class="feature-icon">
                <h3 class="feature-title">Analyses avancées</h3>
                <p class="feature-description">Bénéficiez d'analyses détaillées et de rapports personnalisés pour optimiser votre production.</p>
            </div>
            <div class="feature-card">
                <img src="https://cdn-icons-png.flaticon.com/512/1995/1995576.png" alt="Gestion" class="feature-icon">
                <h3 class="feature-title">Gestion simplifiée</h3>
                <p class="feature-description">Gérez facilement vos ruches, vos apiculteurs et vos sites d'exploitation depuis une interface intuitive.</p>
            </div>
        </div>
    </section>
</body>
</html>

