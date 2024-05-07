package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.UsuariosDTO;
import model.dao.UsuariosDAO;

/**
 *
 * @author Senai
 */
@WebServlet(name = "ControllerUsuarios", urlPatterns = {"/tela-login", "/tela-cadastro", "/logar", "/cadastro", "/users"})
public class ControllerUsuarios extends HttpServlet {

    UsuariosDTO objUsuariosDTO = new UsuariosDTO();
    UsuariosDAO objUsuariosDAO = new UsuariosDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getServletPath();
        if (url.equals("/tela-login")) {
            String nextPage = "/WEB-INF/jsp/login.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        } else if (url.equals("/tela-cadastro")) {
            String nextPage = "/WEB-INF/jsp/cadastro.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        } else if (url.equals("/logar")) {
            String nextPage = "/WEB-INF/jsp/index.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        }
        if (url.equals("/cadastro")) {
            doPost(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String url = request.getServletPath();
        if (url.equals("/users")) {
            List<UsuariosDTO> usuarios = objUsuariosDAO.ler();

            Gson gson = new Gson();
            String json = gson.toJson(usuarios);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        objUsuariosDTO.setNome(request.getParameter("Nome"));
        objUsuariosDTO.setSenha(request.getParameter("Senha"));
        objUsuariosDTO.setUsuario(request.getParameter("Usuario"));
        objUsuariosDTO.setTelefone(request.getParameter("Telefone"));
        objUsuariosDTO.setData_nascimento(request.getParameter("Data_nascimento"));
        objUsuariosDTO.setCpf(request.getParameter("Cpf"));
        objUsuariosDAO.inserir(objUsuariosDTO);
        String path = "/WEB-INF/jsp/login.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }
}
