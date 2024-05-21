package controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.List;
import javax.json.Json;
import javax.json.JsonString;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.CarrinhoDTO;
import model.bean.CarrinhoFuncao;

@WebServlet(name = "CarrinhoController", urlPatterns = {"/adiciona-produto", "/carrinho-produtos"})
public class CarrinhoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
                        .add("message", "Produto adicionado ao carrinho com sucesso!")
                        .build();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(responseJson.toString());
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Erro interno ao processar a solicitação.");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
