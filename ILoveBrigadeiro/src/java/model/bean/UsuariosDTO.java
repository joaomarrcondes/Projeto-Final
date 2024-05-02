/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author Senai
 */
public class UsuariosDTO {

    private int id_usuario;
    private static int id;
    private String nome;
    private String senha;
    private String usuario;
    private String telefone;
    private String data_nascimento;
    private String cpf;

    public UsuariosDTO() {
    }

    public UsuariosDTO(int id_usuario, String nome, String senha, String usuario, String telefone, String data_nascimento, String cpf) {
        this.id_usuario = id_usuario;
        this.nome = nome;
        this.senha = senha;
        this.usuario = usuario;
        this.telefone = telefone;
        this.data_nascimento = data_nascimento;
        this.cpf = cpf;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public static int getId() {
        return id;
    }

    public static void setId(int id) {
        UsuariosDTO.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(String data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    } 
}
