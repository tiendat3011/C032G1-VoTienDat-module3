package repository.customer;

import model.customer.CustomerType;

import java.util.List;

public interface CustomerTypeRepository {
    List<CustomerType> findAll();
    void create(CustomerType customerType);
}
