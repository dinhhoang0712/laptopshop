<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Sản phẩm - Laptopshop</title>
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
                        <div class="row g-4 mb-5">
                            <div>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Danh sách sản phẩm</li>
                                    </ol>
                                </nav>
                            </div>

                            <div class="row g-4 fruite">
                                <div class="col-12 col-md-4">
                                    <div class="row g-4">
                                        <div class="col-12" id="factoryFilter">
                                            <div class="mb-2"><b>Hãng sản suất</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-1"
                                                    value="APPLE">
                                                <label class="form-check-label" for="factory-1">Apple</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-2"
                                                    value="ASUS">
                                                <label class="form-check-label" for="factory-2">Asus</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-3"
                                                    value="LENOVO">
                                                <label class="form-check-label" for="factory-3">Lenovo</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-4"
                                                    value="DELL">
                                                <label class="form-check-label" for="factory-4">Dell</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-5"
                                                    value="LG">
                                                <label class="form-check-label" for="factory-5">LG</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="factory-6"
                                                    value="ACER">
                                                <label class="form-check-label" for="factory-6">Acer</label>
                                            </div>
                                        </div>

                                        <div class="col-12" id="targetFilter">
                                            <div class="mb-2"><b>Mục đính sử dụng</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-1"
                                                    value="GAMING">
                                                <label class="form-check-label" for="target-1">Gaming</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-2"
                                                    value="SINHVIEN-VANPHONG">
                                                <label class="form-check-label" for="target-2">Sinh viên - văn
                                                    Phòng</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-3"
                                                    value="THIET-KE-DO-HOA">
                                                <label class="form-check-label" for="target-3">Thiết kế đồ họa</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-4"
                                                    value="MONG-NHE">
                                                <label class="form-check-label" for="target-4">Mỏng nhẹ</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="target-5"
                                                    value="DOANH-NHAN">
                                                <label class="form-check-label" for="target-5">Doanh Nhân</label>
                                            </div>
                                        </div>

                                        <div class="col-12" id="priceFilter">
                                            <div class="mb-2"><b>Mức giá</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-1"
                                                    value="duoi-10-trieu">
                                                <label class="form-check-label" for="price-1">Dưới 10 triệu</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-2"
                                                    value="tu-10-15-trieu">
                                                <label class="form-check-label" for="price-2">Từ 10 - 15 triệu</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-3"
                                                    value="tu-15-20-trieu">
                                                <label class="form-check-label" for="price-3">Từ 15 - 20 triệu</label>
                                            </div>
                                            <div class="form-check from-check-inline">
                                                <input class="form-check-input" type="checkbox" id="price-4"
                                                    value="tren-20-trieu">
                                                <label class="form-check-label" for="price-4">Trên 20 triệu</label>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="mb-2"><b>Sắp xếp</b></div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" name="sort" type="radio" id="sort-1"
                                                    value="gia-tang-dan">
                                                <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" name="sort" type="radio" id="sort-2"
                                                    value="gia-giam-dan">
                                                <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                            </div>
                                            <div class="form-check from-check-inline">
                                                <input class="form-check-input" name="sort" type="radio" id="sort-3"
                                                    checked value="khong-sort">
                                                <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <button
                                                class="btn border border-secondary rounded-pill px-4 py-3 text-primary"
                                                id="btnFilter">
                                                Lọc sản phẩm</button>
                                        </div>

                                    </div>
                                </div>



                                <div class="col-12 col-md-8 text-center">
                                    <c:if test="${empty products}">
                                        <p>Không tìm thấy sản phẩm nào phù hợp</p>
                                    </c:if>

                                    <c:if test="${not empty products}">
                                        <div class="row g-4">
                                            <c:forEach var="product" items="${products}">
                                                <div class="col-md-6 col-lg-6 col-xl-4">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/images/product/${product.image}"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Laptop</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 style="font-size: 15px;">
                                                                <a href="/product/${product.id}">${product.name}</a>
                                                            </h4>
                                                            <p style="font-size: 13px;">${product.shortDesc}</p>
                                                            <div class="d-flex flex-lg-wrap justify-content-center">
                                                                <p style="font-size: 15px; text-align: center; width: 100%"
                                                                    class="text-dark fw-bold mb-3">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" /> đ
                                                                </p>
                                                                <form action="/add-product-to-cart/${product.id}"
                                                                    method="post">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />
                                                                    <button
                                                                        class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <div class="pagination d-flex justify-content-center mt-5">

                                                <c:choose>
                                                    <c:when test="${curPage > 1}">
                                                        <a class="rounded"
                                                            href="/products?page=${curPage - 1}${queryString}"
                                                            aria-label="Previous">&laquo;</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="rounded disabled" aria-label="Previous">&laquo;</a>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach begin="1" end="${totalPage}" var="i">
                                                    <a href="/products?page=${i}${queryString}"
                                                        class="${curPage == i ? 'active' : ''} rounded">${i}</a>
                                                </c:forEach>
                                                <c:choose>
                                                    <c:when test="${curPage < totalPage}">
                                                        <a class="rounded"
                                                            href="/products?page=${curPage + 1}${queryString}"
                                                            aria-label="Next">&raquo;</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="rounded disabled" aria-label="Next">&raquo;</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                        </div>

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