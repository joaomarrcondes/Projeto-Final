package model.bean;

import java.util.ArrayList;
import java.util.List;

public class CarrinhoFuncao {

    private static CarrinhoFuncao instance;
    private final List<CarrinhoDTO> carrinhoProdutos;

    private CarrinhoFuncao() {
        carrinhoProdutos = new ArrayList<>();
    }

    public static CarrinhoFuncao getInstance() {
        if (instance == null) {
            instance = new CarrinhoFuncao();
        }
        return instance;
    }

    public List<CarrinhoDTO> getCarrinhoItens() {
        return carrinhoProdutos;
    }

    public void adicionaItem(CarrinhoDTO item) {
        carrinhoProdutos.add(item);
    }

    public void esvaziar() {
        carrinhoProdutos.clear();
    }

}
