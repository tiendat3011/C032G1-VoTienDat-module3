package service.customer.impl;


import model.customer.CustomerType;
import repository.customer.CustomerTypeRepository;
import repository.customer.impl.CustomerTypeRepositoryImpl;
import service.customer.CustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements CustomerTypeService {

    CustomerTypeRepository customerTypeRepository = new CustomerTypeRepositoryImpl();


    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepository.findAll();
    }
}
