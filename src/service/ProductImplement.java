package service;

import model.DBConnect;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductImplement implements IProductService{

    public static final String SELECT_ALL_PRODUCT = "select productId, productName, price,quantity,color, products.categoryId, categoryName from products join categories on products.categoryId = categories.categoryId;";
    public static final String SELECT_PRODUCT = "select productId, productName, price,quantity,color, products.categoryId, categoryName from products join categories on products.categoryId = categories.categoryId where productId = ?";
    public static final String ADD_NEW_PRODUCT = "insert into finalexammod3.products value(?,?,?,?,?,?)";
    public static final String GET_PRODUCT_BY_ID = "delete from products  where productId = ?";
    public static final String UPDATE_PRODUCT = "update products set productName = ?, price = ?, quantity =?, color=?, categoryId =? where productId= ?";
    public static final String SEARCH_PRODUCT = "select productId, productName, price,quantity,color, products.categoryId, categoryName from products join categories on products.categoryId = categories.categoryId where productName like ?;";

    @Override
    public List<Product> getAllList() {
        Connection connection = DBConnect.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int productId = resultSet.getInt("productId");
                String productName = resultSet.getString("productName");
                float price = resultSet.getFloat("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                int categoryId = resultSet.getInt("categoryId");
                String categoryName = resultSet.getString("categoryName");

                productList.add(new Product(productId,productName,price,quantity,color,categoryId,categoryName));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }

    @Override
    public void addProduct(Product product) {
        Connection connection = DBConnect.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW_PRODUCT);
            preparedStatement.setInt(1,product.getProductId());
            preparedStatement.setString(2,product.getProductName());
            preparedStatement.setFloat(3,product.getPrice());
            preparedStatement.setInt(4,product.getQuantity());
            preparedStatement.setString(5,product.getColor());
            preparedStatement.setInt(6,product.getCategoryId());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int productId) {
        Connection connection = DBConnect.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_BY_ID);
            preparedStatement.setInt(1,productId);

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Product getProduct(int productId) {
        Connection connection = DBConnect.getConnection();
        Product product = new Product();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT);
            preparedStatement.setInt(1,productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String productName = resultSet.getString("productName");
                float price = resultSet.getFloat("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                int categoryId = resultSet.getInt("categoryId");
                String categoryName = resultSet.getString("categoryName");

                product = new Product(productId,productName,price,quantity,color,categoryId,categoryName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }

    @Override
    public void update(Product product) {
        Connection connection = DBConnect.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1,product.getProductName());
            preparedStatement.setFloat(2,product.getPrice());
            preparedStatement.setInt(3,product.getQuantity());
            preparedStatement.setString(4,product.getColor());
            preparedStatement.setInt(5,product.getCategoryId());
            preparedStatement.setInt(6,product.getProductId());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Product> getSearchList(String string) {
        Connection connection = DBConnect.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCT);
            preparedStatement.setString(1,"%"+string+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int productId = resultSet.getInt("productId");
                String productName = resultSet.getString("productName");
                float price = resultSet.getFloat("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                int categoryId = resultSet.getInt("categoryId");
                String categoryName = resultSet.getString("categoryName");

                productList.add(new Product(productId,productName,price,quantity,color,categoryId,categoryName));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }
}
