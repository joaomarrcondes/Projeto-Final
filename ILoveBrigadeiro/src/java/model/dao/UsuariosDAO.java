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

            stmt = conexao.prepareStatement("SELECT * FROM usuarios");
            rs = stmt.executeQuery();

            while (rs.next()) {
                UsuariosDTO objUsuario = new UsuariosDTO();
                objUsuario.setId_usuario(rs.getInt("id_usuario"));
                objUsuario.setNome(rs.getString("nome"));
                objUsuario.setSenha(rs.getString("senha"));
                objUsuario.setUsuario(rs.getString("usuario"));
                objUsuario.setTelefone(rs.getString("telefone"));
                objUsuario.setData_nascimento(rs.getString("data_nascimento"));
                objUsuario.setCpf(rs.getString("cpf"));
                usuarios.add(objUsuario);
            }
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return usuarios;
    }

    public void inserir(UsuariosDTO objUsuario) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO usuarios (nome, senha, usuario, telefone, data_nascimento, cpf) VALUES (?, ?, ?, ?, ?, ?)");
            stmt.setString(1, objUsuario.getNome());
            stmt.setString(2, objUsuario.getSenha());
            stmt.setString(3, objUsuario.getUsuario());
            stmt.setString(4, objUsuario.getTelefone());
            stmt.setString(5, objUsuario.getData_nascimento());
            stmt.setString(6, objUsuario.getCpf());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
    }
}
