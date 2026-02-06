package com.example.lab1.servlet;

import com.example.lab1.model.Artist;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/artists")
public class ArtistServlet extends HttpServlet {

    private static List<Artist> artists = new ArrayList<>();
    private static int nextId = 1;

    static {
        // Инициализация тестовых данных
        artists.add(new Artist(nextId++, "Queen", "United Kingdom", "Rock", 1970));
        artists.add(new Artist(nextId++, "The Beatles", "United Kingdom", "Rock/Pop", 1960));
        artists.add(new Artist(nextId++, "Michael Jackson", "USA", "Pop", 1964));
        artists.add(new Artist(nextId++, "Nirvana", "USA", "Grunge", 1987));
        artists.add(new Artist(nextId++, "Pink Floyd", "United Kingdom", "Progressive Rock", 1965));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            artists.removeIf(a -> a.getId() == id);
            resp.sendRedirect("artists");
            return;
        }

        req.setAttribute("artists", artists);
        req.getRequestDispatcher("/artists.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String country = req.getParameter("country");
        String genre = req.getParameter("genre");
        int yearFounded = Integer.parseInt(req.getParameter("yearFounded"));

        Artist artist = new Artist(nextId++, name, country, genre, yearFounded);
        artists.add(artist);

        resp.sendRedirect("artists");
    }
}

