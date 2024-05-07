/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.ProdutosDTO;

/**
 *
 * @author carlo
 */
public class ProdutosDAO {

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
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            stmt = conexao.prepareStatement("INSERT INTO produtos (categoria_id,nome,descricao,imagem,valor) VALUES (?, ?, ?, ?, ?)");
            stmt.setInt(1, objProdutos.getCategoria_id());
            stmt.setString(2, objProdutos.getNome());
            stmt.setString(3, objProdutos.getDescricao());
            stmt.setBytes(4, objProdutos.getImagem());
            stmt.setFloat(5, objProdutos.getValor());         
            stmt.executeUpdate();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
