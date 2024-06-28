package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.UsuariosDTO;
import model.dao.UsuariosDAO;

/**
 *
 * @author Senai
 */
@WebServlet(name = "ControllerUsuarios", urlPatterns = {"/tela-login", "/tela-cadastro", "/login", "/cadastro", "/users", "/home", "/sair", "/pedidos", "/pagamento", "/voltar-pagamento"})
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
        } else if (url.equals("/login")) {
            String usuario = request.getParameter("user");
            HttpSession secao = request.getSession();
            secao.setAttribute("user", usuario);
            String nextPage = "/WEB-INF/jsp/index.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        } else if (url.equals("/home")) {
            String nextPage = "/WEB-INF/jsp/index.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        } else if (url.equals("/pagamento")) {
            String nextPage = "/WEB-INF/jsp/checkout-pagamento.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        } else if (url.equals("/sair")) {
            HttpSession secao = request.getSession();
            secao.invalidate();
            response.sendRedirect("./home");
        } else if (url.equals("/pedidos")) {
            HttpSession secao = request.getSession();
            secao.invalidate();
            String nextPage = "/WEB-INF/jsp/pedidos.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        } else if (url.equals("/voltar-pagamento")) {
            String nextPage = "/WEB-INF/jsp/checkout-entrega.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
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
        processRequest(request, response);
        String url = request.getServletPath();
        if (url.equals("/cadastro")) {
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            String usuario = request.getParameter("usuario");
            String telefone = request.getParameter("telefone");
            String dataNascimento = request.getParameter("data_nascimento");
            String cpf = request.getParameter("cpf");
            objUsuariosDTO.setNome(nome);
            objUsuariosDTO.setSenha(senha);
            objUsuariosDTO.setUsuario(usuario);
            objUsuariosDTO.setTelefone(telefone);
            objUsuariosDTO.setData_nascimento(dataNascimento);
            objUsuariosDTO.setCpf(cpf);
            objUsuariosDAO.inserir(objUsuariosDTO);
            String path = "/WEB-INF/jsp/login.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
            dispatcher.forward(request, response);
        }
    }
}
