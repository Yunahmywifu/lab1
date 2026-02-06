<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.lab1.model.Artist" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🎤 Артисты - Music Library</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }
        .container {
            max-width: 1400px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }
        .header h1 {
            font-size: 42px;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        .back-btn {
            display: inline-block;
            padding: 12px 24px;
            background: white;
            color: #f5576c;
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 30px;
            font-weight: 600;
            transition: transform 0.2s;
        }
        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        .content-wrapper {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 30px;
        }
        .artists-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        .artist-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .artist-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .artist-icon {
            font-size: 48px;
            text-align: center;
            margin-bottom: 15px;
        }
        .artist-name {
            font-size: 24px;
            font-weight: 600;
            color: #f5576c;
            text-align: center;
            margin-bottom: 15px;
        }
        .artist-info {
            color: #666;
            font-size: 14px;
            margin: 8px 0;
            padding: 8px 12px;
            background: #f8f9fa;
            border-radius: 6px;
        }
        .artist-info strong {
            color: #f5576c;
        }
        .artist-actions {
            margin-top: 15px;
            text-align: center;
        }
        .delete-btn {
            padding: 8px 20px;
            background: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background 0.3s;
        }
        .delete-btn:hover {
            background: #c82333;
        }
        .add-form {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            position: sticky;
            top: 20px;
        }
        .add-form h2 {
            color: #f5576c;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
            font-size: 14px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #f5576c;
        }
        .submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s;
        }
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(245, 87, 108, 0.4);
        }
        .empty-state {
            text-align: center;
            padding: 60px;
            color: #999;
            background: white;
            border-radius: 15px;
        }
        @media (max-width: 1024px) {
            .content-wrapper {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="back-btn">← Вернуться на главную</a>

        <div class="header">
            <h1>🎤 Артисты</h1>
        </div>

        <div class="content-wrapper">
            <div>
                <div class="artists-grid">
                    <%
                        List<Artist> artists = (List<Artist>) request.getAttribute("artists");
                        if (artists != null && !artists.isEmpty()) {
                            for (Artist artist : artists) {
                    %>
                    <div class="artist-card">
                        <div class="artist-icon">🎤</div>
                        <div class="artist-name"><%= artist.getName() %></div>
                        <div class="artist-info"><strong>Страна:</strong> <%= artist.getCountry() %></div>
                        <div class="artist-info"><strong>Жанр:</strong> <%= artist.getGenre() %></div>
                        <div class="artist-info"><strong>Основан:</strong> <%= artist.getYearFounded() %> год</div>
                        <div class="artist-actions">
                            <a href="artists?action=delete&id=<%= artist.getId() %>" class="delete-btn"
                               onclick="return confirm('Удалить этого артиста?')">🗑️ Удалить</a>
                        </div>
                    </div>
                    <%
                            }
                        } else {
                    %>
                    <div class="empty-state">
                        <h3>Артистов пока нет</h3>
                        <p>Добавьте первого артиста с помощью формы справа</p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <div class="add-form">
                <h2>➕ Добавить артиста</h2>
                <form method="post" action="artists">
                    <div class="form-group">
                        <label for="name">Имя артиста:</label>
                        <input type="text" id="name" name="name" placeholder="Введите имя" required>
                    </div>
                    <div class="form-group">
                        <label for="country">Страна:</label>
                        <input type="text" id="country" name="country" placeholder="Страна происхождения" required>
                    </div>
                    <div class="form-group">
                        <label for="genre">Жанр:</label>
                        <select id="genre" name="genre" required>
                            <option value="">Выберите жанр</option>
                            <option value="Rock">Rock</option>
                            <option value="Pop">Pop</option>
                            <option value="Jazz">Jazz</option>
                            <option value="Classical">Classical</option>
                            <option value="Hip-Hop">Hip-Hop</option>
                            <option value="Electronic">Electronic</option>
                            <option value="Country">Country</option>
                            <option value="R&B">R&B</option>
                            <option value="Blues">Blues</option>
                            <option value="Metal">Metal</option>
                            <option value="Indie">Indie</option>
                            <option value="Folk">Folk</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="yearFounded">Год основания:</label>
                        <input type="number" id="yearFounded" name="yearFounded" placeholder="1990" min="1900" max="2026" required>
                    </div>
                    <button type="submit" class="submit-btn">Добавить артиста</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

