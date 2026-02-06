package com.example.lab1.servlet;

import com.example.lab1.model.Song;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/songs")
public class SongServlet extends HttpServlet {

    private static List<Song> songs = new ArrayList<>();
    private static int nextId = 1;

    static {
        // Инициализация тестовых данных
        songs.add(new Song(nextId++, "Bohemian Rhapsody", "Queen", "A Night at the Opera", 354, "Rock"));
        songs.add(new Song(nextId++, "Imagine", "John Lennon", "Imagine", 183, "Pop"));
        songs.add(new Song(nextId++, "Smells Like Teen Spirit", "Nirvana", "Nevermind", 301, "Grunge"));
        songs.add(new Song(nextId++, "Billie Jean", "Michael Jackson", "Thriller", 294, "Pop"));
        songs.add(new Song(nextId++, "Hotel California", "Eagles", "Hotel California", 391, "Rock"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            songs.removeIf(s -> s.getId() == id);
            resp.sendRedirect("songs");
            return;
        }

        req.setAttribute("songs", songs);
        req.getRequestDispatcher("/songs.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String artist = req.getParameter("artist");
        String album = req.getParameter("album");
        int duration = Integer.parseInt(req.getParameter("duration"));
        String genre = req.getParameter("genre");

        Song song = new Song(nextId++, title, artist, album, duration, genre);
        songs.add(song);

        resp.sendRedirect("songs");
    }

    public static List<Song> getAllSongs() {
        return new ArrayList<>(songs);
    }
}


