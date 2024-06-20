package controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.List;
import javax.json.Json;
import javax.json.JsonString;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.CarrinhoDTO;
import model.bean.CarrinhoFuncao;

@WebServlet(name = "CarrinhoController", urlPatterns = {"/adiciona-produto", "/carrinho-produtos", "/deleta-produto", "/finalizar-compra", "/esvaziar-carrinho", "/quantidade-produto"})
public class CarrinhoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getServletPath();
        if (url.equals("/finalizar-compra")) {
            String path = "/WEB-INF/jsp/checkout-entrega.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
            dispatcher.forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String path = request.getServletPath();
        if (path.equals("/carrinho-produtos")) {
            List<CarrinhoDTO> carrinhoProdutos = CarrinhoFuncao.getInstance().getCarrinhoItens();
            Gson gson = new Gson();
            String json = gson.toJson(carrinhoProdutos);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String path = request.getServletPath();
        if (path.equals("/adiciona-produto")) {
            try {
                BufferedReader reader = request.getReader();
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
                String json = sb.toString();

                javax.json.JsonObject jsonObject = Json.createReader(new StringReader(json)).readObject();
                int produtoId = jsonObject.getInt("idProduto");
                String nomeProduto = jsonObject.getString("nome");
                nomeProduto = new String(nomeProduto.getBytes("ISO-8859-1"), "UTF-8");
                int valorProduto = jsonObject.getJsonNumber("valor").intValue();
                int quantidadeProduto = jsonObject.getInt("quantidade");
                JsonString imagemProduto = jsonObject.getJsonString("imagem");
                CarrinhoDTO objCarrinho = new CarrinhoDTO();
                List<CarrinhoDTO> carrinhoProdutos = CarrinhoFuncao.getInstance().getCarrinhoItens();
                boolean found = false;
                for (CarrinhoDTO item : carrinhoProdutos) {
                    if (item.getId_carrinho() == produtoId) {
                        item.setQuantidade(item.getQuantidade() + quantidadeProduto);
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    objCarrinho.setId_carrinho(produtoId);
                    objCarrinho.setNome(nomeProduto);
                    objCarrinho.setValor(valorProduto);
                    objCarrinho.setQuantidade(quantidadeProduto);
                    objCarrinho.setImagem(imagemProduto);
                    CarrinhoFuncao.getInstance().adicionaItem(objCarrinho);
                }
                javax.json.JsonObject responseJson = Json.createObjectBuilder()
                        .add("message", "Produto adicionado")
                        .build();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(responseJson.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/deleta-produto")) {
            String produtoId = request.getParameter("produtoId");
            List<CarrinhoDTO> carrinhoProdutos = CarrinhoFuncao.getInstance().getCarrinhoItens();
            CarrinhoDTO excluirProduto = null;
            for (CarrinhoDTO item : carrinhoProdutos) {
                if (item.getId_carrinho() == Integer.parseInt(produtoId)) {
                    excluirProduto = item;
                    break;
                }
            }
            if (excluirProduto != null) {
                carrinhoProdutos.remove(excluirProduto);
            }
            response.setStatus(HttpServletResponse.SC_OK);
        }
        if (path.equals("/esvaziar-carrinho")) {
            List<CarrinhoDTO> carrinhoProdutos = CarrinhoFuncao.getInstance().getCarrinhoItens();
            if (!carrinhoProdutos.isEmpty()) {
                carrinhoProdutos.clear();
            }
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/quantidade-produto")) {
            try {
                BufferedReader reader = request.getReader();
                StringBuilder sbuilder = new StringBuilder();
                String linha;
                while ((linha = reader.readLine()) != null) {
                    sbuilder.append(linha);
                }
                String json = sbuilder.toString();              
                javax.json.JsonObject jsonObject = Json.createReader(new StringReader(json)).readObject();
                int produtoId = jsonObject.getInt("produtoId");
                int quantidadeProduto = Integer.parseInt(jsonObject.getString("quantidadeProduto"));
                CarrinhoDTO objCarrinho = new CarrinhoDTO();
                List<CarrinhoDTO> carrinhoProdutos = CarrinhoFuncao.getInstance().getCarrinhoItens();
                for (CarrinhoDTO item : carrinhoProdutos) {
                    if (item.getId_carrinho() == produtoId) {
                        item.setQuantidade(quantidadeProduto);
                        break;
                    }
                }
                javax.json.JsonObject responseJson = Json.createObjectBuilder()
                        .add("message", "Quantidade do produto alterada")
                        .build();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(responseJson.toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
