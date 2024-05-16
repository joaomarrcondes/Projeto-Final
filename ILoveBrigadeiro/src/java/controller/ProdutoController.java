package controller;

import com.google.gson.Gson;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.bean.CategoriasDTO;
import model.bean.ProdutosDTO;
import model.dao.CategoriasDAO;
import model.dao.ProdutosDAO;

@WebServlet(name = "produtoController", urlPatterns = {"/categoria-produto", "/lista-produtos", "/produtos-item", "/buscar-produtos", "/lista-categorias", "/inserir-produtos"})
public class ProdutoController extends HttpServlet {

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
        processRequest(request, response);
        String url = request.getServletPath();
        if (url.equals("/inserir-produtos")) {
            Part filePart = request.getPart("imagem");
            InputStream inputStream = filePart.getInputStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesLer = -1;
            while ((bytesLer = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesLer);
            }
            byte[] imagemBytes = outputStream.toByteArray();

            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            nome = new String(nome.getBytes("ISO-8859-1"), "UTF-8");
            descricao = new String(descricao.getBytes("ISO-8859-1"), "UTF-8");
            objProdutoDto.setNome(nome);
            objProdutoDto.setDescricao(descricao);
            objProdutoDto.setValor(Integer.parseInt(request.getParameter("valor")));
            objProdutoDto.setCategoria_id(Integer.parseInt(request.getParameter("categoria_id")));
            objProdutoDto.setImagem(imagemBytes);
            objProdutoDto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            objProdutoDao.inserirProdutos(objProdutoDto);

            String path = "/WEB-INF/jsp/cadastro-produto.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
            dispatcher.forward(request, response);
        }
    }
}
