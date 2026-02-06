<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.lab1.model.Song" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🎵 Песни - Music Library</title>
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
            color: #667eea;
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
        .songs-list {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        .songs-list h2 {
            color: #667eea;
            margin-bottom: 25px;
            font-size: 28px;
        }
        .song-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 15px;
            border-left: 4px solid #667eea;
            transition: transform 0.2s;
        }
        .song-card:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .song-title {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }
        .song-info {
            color: #666;
            font-size: 14px;
            margin: 4px 0;
        }
        .song-info strong {
            color: #667eea;
        }
        .song-actions {
            margin-top: 10px;
        }
        .delete-btn {
            padding: 6px 16px;
            background: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 5px;
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
            color: #667eea;
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
            border-color: #667eea;
        }
        .submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }
        .empty-state {
            text-align: center;
            padding: 40px;
            color: #999;
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
            <h1>🎵 Мои песни</h1>
        </div>

        <div class="content-wrapper">
            <div class="songs-list">
                <h2>Список песен</h2>
                <%
                    List<Song> songs = (List<Song>) request.getAttribute("songs");
                    if (songs != null && !songs.isEmpty()) {
                        for (Song song : songs) {
                %>
                <div class="song-card">
                    <div class="song-title">🎵 <%= song.getTitle() %></div>
                    <div class="song-info"><strong>Артист:</strong> <%= song.getArtist() %></div>
                    <div class="song-info"><strong>Альбом:</strong> <%= song.getAlbum() %></div>
                    <div class="song-info"><strong>Жанр:</strong> <%= song.getGenre() %></div>
                    <div class="song-info"><strong>Длительность:</strong> <%= song.getFormattedDuration() %></div>
                    <div class="song-actions">
                        <a href="songs?action=delete&id=<%= song.getId() %>" class="delete-btn"
                           onclick="return confirm('Удалить эту песню?')">🗑️ Удалить</a>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div class="empty-state">
                    <h3>Песен пока нет</h3>
                    <p>Добавьте первую песню с помощью формы справа</p>
                </div>
                <%
                    }
                %>
            </div>

            <div class="add-form">
                <h2>➕ Добавить песню</h2>
                <form method="post" action="songs">
                    <div class="form-group">
                        <label for="title">Название песни:</label>
                        <input type="text" id="title" name="title" placeholder="Введите название" required>
                    </div>
                    <div class="form-group">
                        <label for="artist">Артист:</label>
                        <input type="text" id="artist" name="artist" placeholder="Имя артиста" required>
                    </div>
                    <div class="form-group">
                        <label for="album">Альбом:</label>
                        <input type="text" id="album" name="album" placeholder="Название альбома" required>
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
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="duration">Длительность (секунды):</label>
                        <input type="number" id="duration" name="duration" placeholder="180" min="1" required>
                    </div>
                    <button type="submit" class="submit-btn">Добавить песню</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

