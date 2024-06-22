package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.EnderecoDTO;
import model.dao.EnderecoDAO;

@WebServlet(name = "EnderecoController", urlPatterns = {"/cadastro-endereco"})
public class EnderecoController extends HttpServlet {

    EnderecoDTO objEnderecoDto = new EnderecoDTO();
    EnderecoDAO objEnderecoDao = new EnderecoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        String url = request.getServletPath();
        if (url.equals("/cadastro-endereco")) {
            objEnderecoDto.setCep(request.getParameter("enderecoCep"));
            String rua = request.getParameter("enderecoRua");
            rua = new String(rua.getBytes("ISO-8859-1"), "UTF-8");
            objEnderecoDto.setRua(rua);
            objEnderecoDto.setNumero(request.getParameter("enderecoNumero"));           
            String complemento = request.getParameter("enderecoComplemento");
            complemento = new String(rua.getBytes("ISO-8859-1"), "UTF-8");
            objEnderecoDto.setComplemento(complemento);
            objEnderecoDto.setBairro(request.getParameter("enderecoBairro"));           
            String cidade = request.getParameter("enderecoCidade");
            cidade = new String(cidade.getBytes("ISO-8859-1"), "UTF-8");
            objEnderecoDto.setCidade(cidade);          
            objEnderecoDto.setEstado(request.getParameter("enderecoEstado"));
            objEnderecoDao.inserirEndereco(objEnderecoDto);
            String path = "/WEB-INF/jsp/checkout-entrega.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
            dispatcher.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
