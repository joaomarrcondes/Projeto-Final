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

            stmt = conexao.prepareStatement("SELECT * FROM produtos LIMIT 10");
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

    public void inserir(ProdutosDTO produto) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO produtos (categoria, nome, descricao, imagem, valor) VALUES (?, ?, ?, ?, ?)");
            stmt.setInt(1, produto.getCategoria_id());
            stmt.setString(2, produto.getNome());
            stmt.setString(3, produto.getDescricao());
            stmt.setBytes(4, produto.getImagem());
            stmt.setFloat(5, produto.getValor());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
    }

    public List<ProdutosDTO> buscaProdutos(String busca) {
        List<ProdutosDTO> resultadoBusca = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produtos WHERE nome LIKE ? OR descricao LIKE ?");
            stmt.setString(1, busca);
            stmt.setString(2, busca);

            rs = stmt.executeQuery();

            while (rs.next()) {
                ProdutosDTO produt = new ProdutosDTO();
                produt.setId_produto(rs.getInt("id_produto"));
                produt.setNome(rs.getString("nome"));
                produt.setCategoria_id(rs.getInt("categoria"));
                produt.setDescricao(rs.getString("descricao"));
                produt.setValor(rs.getFloat("valor"));
                produt.setImagem(rs.getBytes("imagem"));

                resultadoBusca.add(produt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultadoBusca;
    }

    public List<ProdutosDTO> buscaCategoria(int categoria_id) {
        List<ProdutosDTO> resultadoBusca = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produtos WHERE categoria_id = ?");
            stmt.setInt(1, categoria_id);

            rs = stmt.executeQuery();

            while (rs.next()) {
                ProdutosDTO produt = new ProdutosDTO();
                produt.setId_produto(rs.getInt("id_produto"));
                produt.setNome(rs.getString("nome"));
                produt.setCategoria_id(rs.getInt("categoria_id"));
                produt.setDescricao(rs.getString("descricao"));
                produt.setValor(rs.getFloat("valor"));
                produt.setImagem(rs.getBytes("imagem"));

                resultadoBusca.add(produt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultadoBusca;
    }
}
