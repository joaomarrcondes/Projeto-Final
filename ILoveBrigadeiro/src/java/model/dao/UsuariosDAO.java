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
import model.bean.UsuariosDTO;

/**
 *
 * @author Senai
 */
public class UsuariosDAO {
    
    public List<UsuariosDTO> ler() {
        List<UsuariosDTO> usuarios = new ArrayList<>();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("select * from usuarios");
            rs = stmt.executeQuery();

            while (rs.next()) {
                UsuariosDTO usuario = new UsuariosDTO();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setData_nascimento(rs.getString("data_nascimento"));
                usuario.setCpf(rs.getString("cpf"));
                usuarios.add(usuario);
            }
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return usuarios;
    }

    public void inserir(UsuariosDTO usuario) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO usuarios (nome, senha, usuario, telefone, data_nascimento, cpf) VALUES (?, ?, ?, ?, ?, ?)");
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getSenha());
            stmt.setString(3, usuario.getUsuario());
            stmt.setString(4, usuario.getTelefone());
            stmt.setString(5, usuario.getData_nascimento());
            stmt.setString(6, usuario.getCpf());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
    }
}
