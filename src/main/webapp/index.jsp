<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🎵 Music Library - Музыкальная библиотека</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 50px;
            color: white;
        }
        .header h1 {
            font-size: 48px;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        .header p {
            font-size: 20px;
            opacity: 0.9;
        }
        .navigation {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 40px;
        }
        .nav-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            text-align: center;
            text-decoration: none;
            color: #333;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .nav-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 50px rgba(0,0,0,0.3);
        }
        .nav-card .icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        .nav-card h3 {
            color: #667eea;
            margin-bottom: 10px;
            font-size: 24px;
        }
        .nav-card p {
            color: #666;
            font-size: 14px;
        }
        @media (max-width: 768px) {
            .header h1 {
                font-size: 36px;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="header">
            <h1>🎵 Music Library</h1>
            <p>Ваша персональная музыкальная библиотека</p>
        </div>


        <!-- Навигация по разделам библиотеки -->
        <div class="navigation">
            <a href="songs" class="nav-card">
                <div class="icon">🎵</div>
                <h3>Песни</h3>
                <p>Управление вашей коллекцией песен</p>
            </a>

            <a href="artists" class="nav-card">
                <div class="icon">🎤</div>
                <h3>Артисты</h3>
                <p>Ваши любимые исполнители</p>
            </a>

            <a href="playlists" class="nav-card">
                <div class="icon">📋</div>
                <h3>Плейлисты</h3>
                <p>Создавайте свои плейлисты</p>
            </a>
        </div>
    </div>
</body>
</html>