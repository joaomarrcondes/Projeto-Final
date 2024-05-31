package model.dao;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.bean.EstoqueDTO;
import model.bean.ProdutosDTO;

public class ProdutosDAO {

    EstoqueDTO objEstoque = new EstoqueDTO();

    public List<ProdutosDTO> ler() {
        List<ProdutosDTO> produtos = new ArrayList<>();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produtos");
            rs = stmt.executeQuery();

            while (rs.next()) {
                ProdutosDTO objProduto = new ProdutosDTO();
                objProduto.setId_produto(rs.getInt("id_produto"));
                objProduto.setCategoria_id(rs.getInt("categoria_id"));
                objProduto.setNome(rs.getString("nome"));
                objProduto.setDescricao(rs.getString("descricao"));
                objProduto.setImagem(rs.getBytes("imagem"));
                objProduto.setValor(rs.getFloat("valor"));
                produtos.add(objProduto);
            }
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return produtos;
    }

    public List<ProdutosDTO> lerProdutos(String busca) {
        List<ProdutosDTO> produtos = new ArrayList<>();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produtos WHERE nome LIKE ?");
            stmt.setString(1, busca);
            rs = stmt.executeQuery();

            while (rs.next()) {
                ProdutosDTO objProduto = new ProdutosDTO();
                objProduto.setId_produto(rs.getInt("id_produto"));
                objProduto.setCategoria_id(rs.getInt("categoria_id"));
                objProduto.setNome(rs.getString("nome"));
                objProduto.setDescricao(rs.getString("descricao"));
                objProduto.setImagem(rs.getBytes("imagem"));
                objProduto.setValor(rs.getFloat("valor"));
                produtos.add(objProduto);
            }
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return produtos;
    }

    public void inserirProdutos(ProdutosDTO objProdutos) {
        String sql = "INSERT INTO produtos (categoria_id, nome, descricao, imagem, valor) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            stmt = conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, objProdutos.getCategoria_id());
            stmt.setString(2, objProdutos.getNome());
            stmt.setString(3, objProdutos.getDescricao());
            stmt.setBytes(4, objProdutos.getImagem());
            stmt.setFloat(5, objProdutos.getValor());
            stmt.executeUpdate();
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            int id_produto = -1;
            if (generatedKeys.next()) {
                id_produto = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Erro no id do produto");
            }
            objEstoque.setQuantidade(objProdutos.getQuantidade());
            objEstoque.setProduto_id(id_produto);
            inserirEstoqueProduto(objEstoque);
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void inserirEstoqueProduto(EstoqueDTO objEstoque) {
        try {
            Connection connection = Conexao.conectar();
            PreparedStatement stmt = null;
            stmt = connection.prepareStatement("INSERT INTO estoque (quantidade ,produto_id) VALUES (?, ?)");
            stmt.setInt(1, objEstoque.getQuantidade());
            stmt.setInt(2, objEstoque.getProduto_id());

            stmt.executeUpdate();
            stmt.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
