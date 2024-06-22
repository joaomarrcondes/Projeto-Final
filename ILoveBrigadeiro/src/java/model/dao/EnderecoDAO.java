package model.dao;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.EnderecoDTO;

public class EnderecoDAO {

    public List<EnderecoDTO> ler(int id) {
        List<EnderecoDTO> enderecos = new ArrayList<>();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM enderecos WHERE usuario_id = ?");
            rs = stmt.executeQuery();

            while (rs.next()) {
                EnderecoDTO objEndereco = new EnderecoDTO();
                objEndereco.setId_endereco(rs.getInt("id_endereco"));
                objEndereco.setUsuario_id(rs.getInt("usuario_id"));
                objEndereco.setCep(rs.getString("cep"));
                objEndereco.setRua(rs.getString("rua"));
                objEndereco.setNumero(rs.getString("numero"));
                objEndereco.setComplemento(rs.getString("complemento"));
                objEndereco.setBairro(rs.getString("bairro"));
                objEndereco.setCidade(rs.getString("cidade"));
                objEndereco.setEstado(rs.getString("estado"));
                enderecos.add(objEndereco);
            }
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException erro) {
            erro.printStackTrace();
        }
        return enderecos;
    }

    public void inserirEndereco(EnderecoDTO objEndereco) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            stmt = conexao.prepareStatement("INSERT INTO enderecos (usuario_id, cep, rua, numero, complemento, bairro, cidade, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            stmt.setInt(1, objEndereco.getUsuario_id());
            stmt.setString(2, objEndereco.getCep());
            stmt.setString(3, objEndereco.getRua());
            stmt.setString(4, objEndereco.getNumero());
            stmt.setString(5, objEndereco.getComplemento());
            stmt.setString(6, objEndereco.getBairro());
            stmt.setString(7, objEndereco.getCidade());
            stmt.setString(8, objEndereco.getEstado());

            stmt.executeUpdate();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
