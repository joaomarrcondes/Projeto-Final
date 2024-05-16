
package model.bean;


public class EstoqueDTO {
    private int id_estoque;
    private int quantidade;
    private int produto_id2;

    public EstoqueDTO() {
    }

    public EstoqueDTO(int id_estoque, int quantidade, int produto_id2) {
        this.id_estoque = id_estoque;
        this.quantidade = quantidade;
        this.produto_id2 = produto_id2;
    }

    public int getId_estoque() {
        return id_estoque;
    }

    public void setId_estoque(int id_estoque) {
        this.id_estoque = id_estoque;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getProduto_id2() {
        return produto_id2;
    }

    public void setProduto_id2(int produto_id2) {
        this.produto_id2 = produto_id2;
    }
}
