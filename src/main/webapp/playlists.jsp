<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.lab1.model.Playlist" %>
<%@ page import="com.example.lab1.model.Song" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📋 Плейлисты - Music Library</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
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
            color: #4facfe;
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
        .playlists-container {
            display: grid;
            gap: 25px;
        }
        .playlist-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .playlist-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .playlist-header {
            display: flex;
            justify-content: space-between;
            align-items: start;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
        }
        .playlist-title {
            font-size: 28px;
            font-weight: 600;
            color: #4facfe;
            margin-bottom: 8px;
        }
        .playlist-meta {
            color: #666;
            font-size: 14px;
        }
        .playlist-description {
            color: #888;
            font-style: italic;
            margin-bottom: 5px;
        }
        .playlist-stats {
            display: flex;
            gap: 20px;
            margin: 15px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .stat-item {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #555;
            font-size: 14px;
        }
        .stat-item strong {
            color: #4facfe;
        }
        .songs-in-playlist {
            margin-top: 20px;
        }
        .songs-in-playlist h4 {
            color: #333;
            margin-bottom: 15px;
            font-size: 18px;
        }
        .mini-song {
            padding: 12px;
            background: #f8f9fa;
            border-radius: 8px;
            margin-bottom: 10px;
            border-left: 3px solid #4facfe;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .mini-song-content {
            flex: 1;
        }
        .mini-song-title {
            font-weight: 600;
            color: #333;
            margin-bottom: 4px;
        }
        .mini-song-info {
            font-size: 13px;
            color: #666;
        }
        .remove-song-btn {
            padding: 6px 12px;
            background: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 12px;
            transition: background 0.3s;
            white-space: nowrap;
        }
        .remove-song-btn:hover {
            background: #c82333;
        }
        .add-song-section {
            margin-top: 20px;
            padding: 15px;
            background: #e8f5ff;
            border-radius: 8px;
        }
        .add-song-section h5 {
            color: #4facfe;
            margin-bottom: 10px;
            font-size: 16px;
        }
        .add-song-form {
            display: flex;
            gap: 10px;
            align-items: end;
        }
        .add-song-form select {
            flex: 1;
            padding: 10px;
            border: 2px solid #4facfe;
            border-radius: 6px;
            font-size: 14px;
            background: white;
        }
        .add-song-form button {
            padding: 10px 20px;
            background: #4facfe;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }
        .add-song-form button:hover {
            background: #00f2fe;
        }
        .delete-btn {
            padding: 8px 20px;
            background: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background 0.3s;
            white-space: nowrap;
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
            color: #4facfe;
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
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            transition: border-color 0.3s;
        }
        .form-group textarea {
            resize: vertical;
            min-height: 80px;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #4facfe;
        }
        .submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
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
            box-shadow: 0 5px 20px rgba(79, 172, 254, 0.4);
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
            <h1>📋 Плейлисты</h1>
        </div>

        <div class="content-wrapper">
            <div class="playlists-container">
                <%
                    List<Playlist> playlists = (List<Playlist>) request.getAttribute("playlists");
                    if (playlists != null && !playlists.isEmpty()) {
                        for (Playlist playlist : playlists) {
                %>
                <div class="playlist-card">
                    <div class="playlist-header">
                        <div>
                            <div class="playlist-title">📋 <%= playlist.getName() %></div>
                            <div class="playlist-description"><%= playlist.getDescription() %></div>
                            <div class="playlist-meta">Создал: <%= playlist.getCreatedBy() %></div>
                        </div>
                        <a href="playlists?action=delete&id=<%= playlist.getId() %>" class="delete-btn"
                           onclick="return confirm('Удалить этот плейлист?')">🗑️ Удалить</a>
                    </div>

                    <div class="playlist-stats">
                        <div class="stat-item">
                            <span>🎵</span>
                            <span><strong><%= playlist.getSongs().size() %></strong> песен</span>
                        </div>
                        <div class="stat-item">
                            <span>⏱️</span>
                            <span><strong><%= playlist.getFormattedTotalDuration() %></strong></span>
                        </div>
                    </div>

                    <%
                        if (!playlist.getSongs().isEmpty()) {
                    %>
                    <div class="songs-in-playlist">
                        <h4>Песни в плейлисте:</h4>
                        <%
                            for (Song song : playlist.getSongs()) {
                        %>
                        <div class="mini-song">
                            <div class="mini-song-content">
                                <div class="mini-song-title">🎵 <%= song.getTitle() %></div>
                                <div class="mini-song-info">
                                    <%= song.getArtist() %> • <%= song.getFormattedDuration() %>
                                </div>
                            </div>
                            <a href="playlists?action=removeSong&playlistId=<%= playlist.getId() %>&songId=<%= song.getId() %>"
                               class="remove-song-btn"
                               onclick="return confirm('Удалить эту песню из плейлиста?')">✕</a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>

                    <!-- Форма добавления песни в плейлист -->
                    <div class="add-song-section">
                        <h5>➕ Добавить песню</h5>
                        <%
                            List<Song> availableSongs = (List<Song>) request.getAttribute("availableSongs");
                            if (availableSongs != null && !availableSongs.isEmpty()) {
                        %>
                        <form class="add-song-form" method="get" action="playlists">
                            <input type="hidden" name="action" value="addSong">
                            <input type="hidden" name="playlistId" value="<%= playlist.getId() %>">
                            <select name="songId" required>
                                <option value="">Выберите песню...</option>
                                <%
                                    for (Song song : availableSongs) {
                                        // Проверяем, есть ли уже эта песня в плейлисте
                                        boolean alreadyInPlaylist = playlist.getSongs().stream()
                                                .anyMatch(s -> s.getId() == song.getId());
                                        if (!alreadyInPlaylist) {
                                %>
                                <option value="<%= song.getId() %>"><%= song.getTitle() %> - <%= song.getArtist() %></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <button type="submit">Добавить</button>
                        </form>
                        <%
                            } else {
                        %>
                        <p style="color: #999; font-size: 14px;">Нет доступных песен. Создайте песни в разделе "Песни".</p>
                        <%
                            }
                        %>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div class="empty-state">
                    <h3>Плейлистов пока нет</h3>
                    <p>Создайте первый плейлист с помощью формы справа</p>
                </div>
                <%
                    }
                %>
            </div>

            <div class="add-form">
                <h2>➕ Создать плейлист</h2>
                <form method="post" action="playlists">
                    <div class="form-group">
                        <label for="name">Название плейлиста:</label>
                        <input type="text" id="name" name="name" placeholder="Мой плейлист" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Описание:</label>
                        <textarea id="description" name="description" placeholder="Описание плейлиста" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="createdBy">Автор:</label>
                        <input type="text" id="createdBy" name="createdBy" placeholder="Ваше имя" required>
                    </div>
                    <button type="submit" class="submit-btn">Создать плейлист</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

