package service.customer.impl;

import model.customer.Customer;
import repository.customer.CustomerRepository;
import repository.customer.impl.CustomerRepositoryImpl;
import service.customer.CustomerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public Map<String, String> create(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> map = new LinkedHashMap<>();

        String idCustomer = request.getParameter("idCustomer");
        map.put("idCustomer", "ok");


        String customerName = request.getParameter("customerName");
        map.put("customerName", "ok");

        String birthday = request.getParameter("birthday");
        map.put("birthday", "ok");

        int gender = 0;
        try {
            gender = Integer.parseInt(request.getParameter("gender"));
            if (gender < 0 || gender > 1) {
                map.put("gender", "Chỉ được nhập số 0 hoặc 1 ");
            }
        } catch (NumberFormatException o) {
            map.put("gender", "Không được nhập chữ hoặc để trống hoặc nhập chữ");
        }


        String idCard = request.getParameter("idCard");
        map.put("idCard", "ok");



        String phone = request.getParameter("phone");

        map.put("phone", "ok");


        String email = request.getParameter("email");
        map.put("email", "ok");


        String address = request.getParameter("address");
        map.put("address", "ok");


        int customerTypeId = 0;

        try {
            customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
            if (customerTypeId < 1 || customerTypeId > 5) {
                map.put("customerTypeId", "Chỉ được nhập từ 1 đến 5");
            }
        } catch (NumberFormatException o) {
            map.put("customerTypeId", "Không được nhập chữ hoặc để trống");
        }

        if (map.isEmpty()) {
            Customer customer = new Customer(idCustomer, customerName, birthday, gender, idCard, phone, email, address, customerTypeId);
            customerRepository.create(customer);
        }

        return map;
    }
    @Override
    public Customer findById(String idCustomer) {
        return customerRepository.findById(idCustomer);
    }

    @Override
    public void delete(String idCustomer) {
        customerRepository.delete(idCustomer);
    }

    @Override
    public void update(String idCustomer, Customer customer) {
        customerRepository.update(idCustomer, customer);
    }

    @Override
    public List<Customer> search(String customerSearch, String id) {
        return customerRepository.search(customerSearch, id);
    }
}
