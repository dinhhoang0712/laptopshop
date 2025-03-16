<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>Giỏ hàng - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">


                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->
                    <jsp:include page="../layout/header.jsp" />

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">

                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Thông tin thanh toán</li>
                                    </ol>
                                </nav>
                            </div>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                            <th scope="col">Xử lý</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cartDetail" items="${cartDetails}">
                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${cartDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${cartDetail.product.id}">
                                                            ${cartDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.quantity * cartDetail.price}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <form action="/delete-cart-product/${cartDetail.id}" method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <form:form action="/place-order" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div class="container mt-5">
                                    <div class="row justify-content-center">
                                        <!-- Cột bên trái: Thông tin người nhận -->
                                        <div class="col-md-5">
                                            <div class="p-4 border rounded shadow-sm bg-white">
                                                <h5 class="mb-3 fw-bold">Thông Tin Người Nhận</h5>
                                                <div class="form-group mb-3">
                                                    <label class="fw-normal">Tên người nhận</label>
                                                    <input type="text" class="form-control" name="receiverName"
                                                        required>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label class="fw-normal">Địa chỉ người nhận</label>
                                                    <input type="text" class="form-control" name="receiverAddress"
                                                        required>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <label class="fw-normal">Số điện thoại</label>
                                                    <input type="text" class="form-control" name="receiverPhone"
                                                        required>
                                                </div>
                                                <div>
                                                    <a href="/cart" class="text-success">
                                                        <i class="fas fa-arrow-left"></i> Quay lại giỏ hàng
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Cột bên phải: Thông tin thanh toán -->
                                        <div class="col-md-5">
                                            <div class="p-4 border rounded shadow-sm bg-white">
                                                <h5 class="mb-3 fw-bold">Thông Tin Thanh Toán</h5>
                                                <div class="d-flex justify-content-between">
                                                    <span class="fw-normal">Phí vận chuyển</span>
                                                    <span>0 đ</span>
                                                </div>

                                                <div class="d-flex justify-content-between mt-2">
                                                    <span class="fw-normal">Hình thức</span>
                                                    <span>Thanh toán khi nhận hàng (COD)</span>
                                                </div>

                                                <div
                                                    class="py-3 mt-3 border-top border-bottom d-flex justify-content-between">
                                                    <h5 class="mb-0">Tổng số tiền</h5>
                                                    <h5 class="mb-0">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </h5>
                                                </div>

                                                <button class="btn btn-outline-success w-100 mt-4 py-2 fw-bold"
                                                    type="submit">
                                                    XÁC NHẬN THANH TOÁN
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>


                        </div>
                    </div>
                    <!-- Single Product End -->


                    <jsp:include page="../layout/footer.jsp" />



                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>