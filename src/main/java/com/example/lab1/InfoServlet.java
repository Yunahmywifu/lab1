package com.example.lab1;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/info")
public class InfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String group = req.getParameter("group");

        if (name == null || name.isEmpty() || group == null || group.isEmpty()) {
            resp.sendRedirect("index.jsp");
            return;
        }

        printInfo(resp, name, group);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String group = req.getParameter("group");

        printInfo(resp, name, group);
    }

    private void printInfo(HttpServletResponse resp, String name, String group) throws IOException {
        resp.getWriter().println("<!DOCTYPE html>");
        resp.getWriter().println("<html>");
        resp.getWriter().println("<head>");
        resp.getWriter().println("<meta charset='UTF-8'>");
        resp.getWriter().println("<title>Студент туралы ақпарат</title>");
        resp.getWriter().println("<style>");
        resp.getWriter().println("body { font-family: 'Segoe UI', Tahoma, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; justify-content: center; align-items: center; margin: 0; padding: 20px; }");
        resp.getWriter().println(".container { background-color: white; max-width: 600px; width: 100%; padding: 40px; border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.3); }");
        resp.getWriter().println("h1 { color: #333; text-align: center; margin-bottom: 30px; font-size: 28px; }");
        resp.getWriter().println(".info-box { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 15px; margin: 20px 0; color: white; }");
        resp.getWriter().println(".info-item { margin: 15px 0; padding: 10px; background: rgba(255,255,255,0.1); border-radius: 8px; }");
        resp.getWriter().println(".info-item strong { display: block; font-size: 14px; opacity: 0.9; margin-bottom: 5px; }");
        resp.getWriter().println(".info-item span { display: block; font-size: 20px; font-weight: 600; }");
        resp.getWriter().println(".btn-back { display: inline-block; margin-top: 20px; padding: 12px 30px; background: #667eea; color: white; text-decoration: none; border-radius: 8px; transition: transform 0.2s; text-align: center; }");
        resp.getWriter().println(".btn-back:hover { transform: translateY(-2px); background: #764ba2; }");
        resp.getWriter().println("</style>");
        resp.getWriter().println("</head>");
        resp.getWriter().println("<body>");
        resp.getWriter().println("<div class='container'>");
        resp.getWriter().println("<h1>🎓 Студент туралы ақпарат</h1>");
        resp.getWriter().println("<div class='info-box'>");
        resp.getWriter().println("<div class='info-item'><strong>👤 Аты-жөні:</strong><span>" + name + "</span></div>");
        resp.getWriter().println("<div class='info-item'><strong>🏫 Тобы:</strong><span>" + group + "</span></div>");
        resp.getWriter().println("<div class='info-item'><strong>📅 Ағымдағы күн:</strong><span>" + LocalDate.now() + "</span></div>");
        resp.getWriter().println("</div>");
        resp.getWriter().println("<a href='index.jsp' class='btn-back'>← Артқа қайту / Вернуться</a>");
        resp.getWriter().println("</div>");
        resp.getWriter().println("</body>");
        resp.getWriter().println("</html>");
    }
}