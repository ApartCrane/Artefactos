package com.example.Artefactos.Controller;

import com.example.Artefactos.Model.BeanArtefactos;
import com.example.Artefactos.Model.BeanDirect;
import com.example.Artefactos.Model.DaoArtefactos;
import com.sun.org.slf4j.internal.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

@WebServlet(name = "ServletArtefactos", value = "/ServletArtefactos")
public class ServletArtefactos extends HttpServlet {
    private Map map = new HashMap();
    final private Logger CONSOLE = LoggerFactory.getLogger(ServletArtefactos.class);
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        map.put("listArtefactos", new DaoArtefactos().findAll());
        write(response,map);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        BeanArtefactos beanArtefactos = new BeanArtefactos();
        switch (action){
            case "create":
                String name = request.getParameter("nombre");
                String street = request.getParameter("direccion");
                String suburb = request.getParameter("urb");
                int postalCode = Integer.parseInt(request.getParameter("postal"));
                String state = request.getParameter("estado");
                String country = request.getParameter("pais");
                String date = request.getParameter("dia");
                beanDirect = new BeanDirect(0,direccion,urb,postal,estado,pais);
                beanArtefactos = new BeanArtefactos(0,nombre,dia,beanDirect,0)

                boolean flag = new DaoArtefactos().create(beanArtefactos);

                if (flag){
                    map.put("message","Se ha registrado correctamente");
                } else {
                    map.put("message","No se registró correctamente");
                }
                response.sendRedirect(request.getContextPath() + "/readArtefactos");
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                int idDirect = Integer.parseInt(request.getParameter("idDirect"));
                String nombre1 = request.getParameter("nombre");
                String direccion1 = request.getParameter("direccion");
                String urb1 = request.getParameter("urb");
                int postal1 = Integer.parseInt(request.getParameter("postal"));
                String estado1 = request.getParameter("estado");
                String pais1 = request.getParameter("pais");
                String dia1 = request.getParameter("dia");
                beanDirect = new BeanDirect(idDirect,direccion1,urb1,postal1,estado1,pais1);
                beanArtefactos = new BeanArtefactos(id,nombre1,dia1,beanArtefactos.0);
                boolean flag1 = new DaoArtefactos().update(beanArtefactos);

                if (flag1){
                    CONSOLE.error("Se ha actualizado correctamente");
                } else {
                    CONSOLE.error("message", "No se logro actualizar correctamente");
                }
                request.getRequestDispatcher("/views/gadget/gadgets.jsp").forward(request,response);
                break;
            case "delete":
                if (new DaoArtefactos().delete(Integer.parseInt(request.getParameter("id2")))){
                    request.setAttribute("message", "Se ha eliminado correctamente");

                }else {
                    CONSOLE.error("No se eliminó correctamente");
                }
                request.getRequestDispatcher("/views/gadget/gadgets.jsp").forward(request,response);
                break;
            case "findById":
                long id3 = Long.parseLong(request.getParameter("id"));
                beanArtefactos= new DaoArtefactos().findById(id3);
                map.put("gadget", beanArtefactos);
                response.sendRedirect(request.getContextPath() + "/readArtefactos");
                break;


            default:
                request.getRequestDispatcher("/").forward(request, response);
                break;
        }

    }
    private void write(HttpServletResponse response, Map<String, Object> map) throws IOException{
        response.setContentType("aplication/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(map));
    }
}
