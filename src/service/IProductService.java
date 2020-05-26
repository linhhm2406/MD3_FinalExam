package service;

import model.Product;
import java.util.List;

public interface IProductService {
    List<Product> getAllList();
    List<Product> getSearchList(String string);
    void addProduct(Product product);
    void delete(int productId);
    Product getProduct(int productId);
    void update(Product product);
}
