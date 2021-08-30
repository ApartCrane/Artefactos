package com.example.Artefactos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet", value = "/Servlet")
public class HelloServlet extends HttpServlet {
    private String msj;

    public void init(){msj = "Hello Peter";}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + msj + "</h1>");
        out.println("</body></html>");
    }
    public void destroy(){

    }

}
