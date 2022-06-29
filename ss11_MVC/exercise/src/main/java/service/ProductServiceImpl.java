package service;

import models.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    static List<Product> productList = new ArrayList<>();

    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1,new Product(1,"IPhone",2000,"ok","vn"));
        products.put(2,new Product(2,"XiaoMi",3000,"ko","hn"));
        products.put(3,new Product(3,"Durex",4000,"ok","qt"));
        products.put(4,new Product(4,"Kokomi",5000,"ko","tb"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);

    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);

    }

    @Override
    public void remove(int id) {
        products.remove(id);

    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item : productList) {
            if (item.getName().contains(name)){
                searchList.add(item);
            }
        }
        return searchList;
    }

}
