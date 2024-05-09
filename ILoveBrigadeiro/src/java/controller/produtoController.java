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
import model.bean.CategoriasDTO;
import model.bean.ProdutosDTO;
import model.dao.CategoriasDAO;
import model.dao.ProdutosDAO;

@WebServlet(name = "produtoController", urlPatterns = {"/categoria-produto", "/lista-produtos", "/produtos-item", "/buscar-produtos", "/lista-categorias"})
public class produtoController extends HttpServlet {

    ProdutosDAO objProdutoDao = new ProdutosDAO();
    ProdutosDTO objProdutoDto = new ProdutosDTO();
    CategoriasDAO objCategoriaDao = new CategoriasDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getServletPath();
        if (url.equals("/categoria-produto")) {
            String path = "/WEB-INF/jsp/categoria-produto.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
            dispatcher.forward(request, response);
        } else if (url.equals("/buscar-produtos")) {
            String path = "/WEB-INF/jsp/produtos.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String url = request.getServletPath();

        if (url.equals("/lista-produtos")) {
            List<ProdutosDTO> produtos = objProdutoDao.ler();
            Gson gson = new Gson();
            String json = gson.toJson(produtos);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (url.equals("/produtos-item")) {
            List<ProdutosDTO> produtos = objProdutoDao.lerProdutos("%" + request.getParameter("busca") + "%");
            Gson gson = new Gson();
            String json = gson.toJson(produtos);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else if (url.equals("/lista-categorias")) {
            List<CategoriasDTO> categorias = objCategoriaDao.listarCategorias();
            Gson gson = new Gson();
            String json = gson.toJson(categorias);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
