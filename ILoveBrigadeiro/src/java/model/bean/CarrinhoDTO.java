
package model.bean;

import com.mysql.cj.xdevapi.JsonString;


public class CarrinhoDTO {
    private int id_carrinho;
    private String nome;
    private int quantidade;
    private int valor;
    private JsonString imagem;

    public CarrinhoDTO() {
    }

    public CarrinhoDTO(int id_carrinho, String nome, int quantidade, int valor, JsonString imagem) {
        this.id_carrinho = id_carrinho;
        this.nome = nome;
        this.quantidade = quantidade;
        this.valor = valor;
        this.imagem = imagem;
    }

    public int getId_carrinho() {
        return id_carrinho;
    }

    public void setId_carrinho(int id_carrinho) {
        this.id_carrinho = id_carrinho;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public JsonString getImagem() {
        return imagem;
    }

    public void setImagem(JsonString imagem) {
        this.imagem = imagem;
    }
}
