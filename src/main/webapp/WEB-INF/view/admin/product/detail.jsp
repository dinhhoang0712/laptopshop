<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Detail User - Vũ Đình Hoàng</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Quản lý người dùng</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">Dashboard / Product</li>
                                    </ol>
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <h3 class="text">Thông tin chi tiết của sản phẩm ${product.name}</h3>
                                                <hr />
                                                <div class="card" style="width: 30%;">
                                                    <img class="card-img-top" src="/images/product/${product.image}"
                                                        alt="Card image cap">
                                                </div>
                                                <div class="card">
                                                    <div class="card-header">
                                                        Chi tiết
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${product.id}</li>
                                                        <li class="list-group-item">Tên sản phẩm: ${product.name}</li>
                                                        <li class="list-group-item">Giá:
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            đ
                                                        </li>
                                                        <li class="list-group-item">Thông tin chi tiết:
                                                            ${product.detailDesc}</li>
                                                        <li class="list-group-item">Thông tin ngắn gọn:
                                                            ${product.shortDesc}
                                                        </li>
                                                        <li class="list-group-item">Số lượng: ${product.quantity}</li>
                                                        <li class="list-group-item">Hãng: ${product.factory}</li>
                                                        <li class="list-group-item">Target: ${product.target}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                </body>

                </html>