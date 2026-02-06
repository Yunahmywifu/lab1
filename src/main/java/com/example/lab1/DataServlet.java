package com.example.lab1;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/data")
public class DataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");

        resp.getWriter().println("<!DOCTYPE html>");
        resp.getWriter().println("<html>");
        resp.getWriter().println("<head>");
        resp.getWriter().println("<meta charset='UTF-8'>");
        resp.getWriter().println("<title>GET Request</title>");
        resp.getWriter().println("</head>");
        resp.getWriter().println("<body style='font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px;'>");
        resp.getWriter().println("<h2 style='color: #28a745;'>GET request received</h2>");
        resp.getWriter().println("<p>Сервлет получил GET-запрос</p>");
        resp.getWriter().println("<br><a href='data-form.jsp' style='text-decoration: none; color: #007bff;'>← Вернуться к форме</a>");
        resp.getWriter().println("</body>");
        resp.getWriter().println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String age = req.getParameter("age");

        resp.getWriter().println("<!DOCTYPE html>");
        resp.getWriter().println("<html>");
        resp.getWriter().println("<head>");
        resp.getWriter().println("<meta charset='UTF-8'>");
        resp.getWriter().println("<title>POST Request Result</title>");
        resp.getWriter().println("</head>");
        resp.getWriter().println("<body style='font-family: Arial, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px;'>");
        resp.getWriter().println("<h2 style='color: #333;'>Данные получены (POST)</h2>");
        resp.getWriter().println("<div style='background-color: #f8f9fa; padding: 15px; border-radius: 5px; margin: 20px 0;'>");
        resp.getWriter().println("<p><strong>Приветствие:</strong> Здравствуйте, " + name + " " + surname + "!</p>");
        resp.getWriter().println("<p><strong>Имя:</strong> " + name + "</p>");
        resp.getWriter().println("<p><strong>Фамилия:</strong> " + surname + "</p>");
        resp.getWriter().println("<p><strong>Возраст:</strong> " + age + " лет</p>");
        resp.getWriter().println("</div>");
        resp.getWriter().println("<br><a href='data-form.jsp' style='text-decoration: none; color: #007bff;'>← Вернуться к форме</a>");
        resp.getWriter().println("</body>");
        resp.getWriter().println("</html>");
    }
}

