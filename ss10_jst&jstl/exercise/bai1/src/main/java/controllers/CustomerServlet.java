package controllers;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")

public class CustomerServlet extends HttpServlet {
    static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add( new Customer( "Võ Tiến Đạt", "29/11/1999", "vn", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fvcdn1-dulich.vnecdn.net%2F2021%2F07%2F16%2F8-1626444967.jpg%3Fw%3D1200%26h%3D0%26q%3D100%26dpr%3D1%26fit%3Dcrop%26s%3DGfgGn4dNuKZexy1BGkAUNA&imgrefurl=https%3A%2F%2Fvnexpress.net%2F10-buc-anh-troi-dem-dep-nhat-the-gioi-4325978.html&tbnid=wk-9sdK_hFsoGM&vet=12ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygAegUIARCyAQ..i&docid=aTNeU1tYb-0C1M&w=1200&h=800&q=%E1%BA%A3nh&ved=2ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygAegUIARCyAQ"));
        customerList.add( new Customer( "Tien Dat", "25/11/1999", "dn", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.sforum.vn%2Fsforum%2Fwp-content%2Fuploads%2F2018%2F11%2F3-8.png&imgrefurl=https%3A%2F%2Fcellphones.com.vn%2Fsforum%2Fthu-thuat-vi-tri-va-goc-bi-kip-chup-anh-dep-bang-smartphone-khong-the-bo-qua&tbnid=fBSs9Cjd2dUg6M&vet=12ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygBegUIARC0AQ..i&docid=9XcVg_zxx4jajM&w=600&h=400&q=%E1%BA%A3nh&ved=2ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygBegUIARC0AQ"));
        customerList.add( new Customer( "Hoan", "09/11/1999", "aa","https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cdn-v2.laodong.vn%2FStorage%2FNewsPortal%2F2021%2F5%2F26%2F913299%2FNgan-Ha25.jpg&imgrefurl=https%3A%2F%2Flaodong.vn%2Fthe-gioi%2Fman-nhan-voi-25-buc-anh-giai-nhiep-anh-gia-dai-ngan-ha-nam-2021-913299.ldo&tbnid=bHaSQgA_OE7HRM&vet=12ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygCegUIARC2AQ..i&docid=CqlCoHkFLwQfCM&w=960&h=529&q=%E1%BA%A3nh&ved=2ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygCegUIARC2AQ" ));
        customerList.add( new Customer( "Hai", "23/11/1999", "nbb", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.nhandan.com.vn%2FFiles%2FImages%2F2020%2F07%2F26%2Fnhat_cay-1595747664059.jpg&imgrefurl=https%3A%2F%2Fnhandan.vn%2Fscience-news%2Fngo-ngang-nhung-buc-anh-chup-tu-dien-thoai-di-dong-610098%2F&tbnid=lP3Lvfbg5h5OvM&vet=12ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygDegUIARC4AQ..i&docid=xCIMnhdTpNN6PM&w=1900&h=1900&q=%E1%BA%A3nh&ved=2ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygDegUIARC4AQ"));
        customerList.add( new Customer( "Tuong", "20/11/1999", "ccc", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.websosanh.vn%2Fv2%2Fusers%2Freview%2Fimages%2F4wvuq0i4ozs1q.jpg%3Fcompress%3D85&imgrefurl=https%3A%2F%2Fwebsosanh.vn%2Ftin-tuc%2F15-cach-chup-anh-chan-dung-dep-o-ngoai-c24-2020070805071324.htm&tbnid=wfzxsVziDl1j8M&vet=12ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygIegUIARDCAQ..i&docid=za-QRYDUk-JP3M&w=2048&h=1365&q=%E1%BA%A3nh&ved=2ahUKEwiViqivrM_4AhUowIsBHV9TABwQMygIegUIARDCAQ"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
