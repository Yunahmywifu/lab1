package com.example.lab1.servlet;

import com.example.lab1.model.Playlist;
import com.example.lab1.model.Song;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/playlists")
public class PlaylistServlet extends HttpServlet {

    private static List<Playlist> playlists = new ArrayList<>();
    private static int nextId = 1;

    static {
        Playlist rockPlaylist = new Playlist(nextId++, "Rock Classics", "Best rock songs of all time", "Admin");
        rockPlaylist.addSong(new Song(1, "Bohemian Rhapsody", "Queen", "A Night at the Opera", 354, "Rock"));
        rockPlaylist.addSong(new Song(5, "Hotel California", "Eagles", "Hotel California", 391, "Rock"));
        playlists.add(rockPlaylist);

        Playlist popPlaylist = new Playlist(nextId++, "Pop Hits", "Popular pop songs", "User1");
        popPlaylist.addSong(new Song(2, "Imagine", "John Lennon", "Imagine", 183, "Pop"));
        popPlaylist.addSong(new Song(4, "Billie Jean", "Michael Jackson", "Thriller", 294, "Pop"));
        playlists.add(popPlaylist);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            playlists.removeIf(p -> p.getId() == id);
            resp.sendRedirect("playlists");
            return;
        }

        if ("addSong".equals(action)) {
            int playlistId = Integer.parseInt(req.getParameter("playlistId"));
            int songId = Integer.parseInt(req.getParameter("songId"));

            Playlist playlist = findPlaylistById(playlistId);
            Song song = findSongById(songId);

            if (playlist != null && song != null) {
                playlist.addSong(song);
            }
            resp.sendRedirect("playlists");
            return;
        }

        if ("removeSong".equals(action)) {
            int playlistId = Integer.parseInt(req.getParameter("playlistId"));
            int songId = Integer.parseInt(req.getParameter("songId"));

            Playlist playlist = findPlaylistById(playlistId);
            if (playlist != null) {
                playlist.getSongs().removeIf(s -> s.getId() == songId);
            }
            resp.sendRedirect("playlists");
            return;
        }

        req.setAttribute("playlists", playlists);
        req.setAttribute("availableSongs", SongServlet.getAllSongs());
        req.getRequestDispatcher("/playlists.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String createdBy = req.getParameter("createdBy");

        Playlist playlist = new Playlist(nextId++, name, description, createdBy);
        playlists.add(playlist);

        resp.sendRedirect("playlists");
    }

    private Playlist findPlaylistById(int id) {
        return playlists.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }

    private Song findSongById(int id) {
        List<Song> allSongs = SongServlet.getAllSongs();
        return allSongs.stream()
                .filter(s -> s.getId() == id)
                .findFirst()
                .orElse(null);
    }
}

