package controller;

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

@WebServlet(name = "CarrinhoController", urlPatterns = {"/adiciona-produto"})
public class CarrinhoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
                int productId = jsonObject.getInt("productId");
                String productName = jsonObject.getString("productName");
                productName = new String(productName.getBytes("ISO-8859-1"), "UTF-8");
                double productPrice = jsonObject.getJsonNumber("productPrice").doubleValue();
                int productQtd = jsonObject.getInt("productQtd");
                JsonString productImage = jsonObject.getJsonString("productImage");
                CartDTO objCart = new CartDTO();
                List<CartDTO> cartItens = ShoppingCart.getInstance().getCarrinhoItens();

                boolean found = false;
                for (CartDTO item : cartItens) {
                    if (item.getIdProduct() == productId) {
                        item.setQuantity(item.getQuantity() + productQtd);
                        found = true;
                        break;
                    }
                }

                if (!found) {
                    objCart.setIdProduct(productId);
                    objCart.setName(productName);
                    objCart.setPriceUnitary(productPrice);
                    objCart.setQuantity(productQtd);
                    objCart.setImage(productImage);
                    ShoppingCart.getInstance().addItem(objCart);
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
