<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Order - Vũ Đình Hoàng</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard / Order</li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3 class="text">Danh sách đơn hàng</h3>
                                            </div>
                                            <hr />
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Người dùng</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Chức năng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="order" items="${orders}">
                                                        <tr>
                                                            <td>${order.id}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${order.totalPrice}" /> đ
                                                            </td>
                                                            <td>Admin full</td>
                                                            <td>${order.status}</td>
                                                            <td>
                                                                <a href="/admin/order/view/${order.id}"
                                                                    class="btn btn-success">Chi
                                                                    tiết</a>
                                                                <a href="/admin/order/update/${order.id}"
                                                                    class="btn btn-warning" mx-2>Sửa</a>
                                                                <a href="/admin/order/delete/${order.id}"
                                                                    class="btn btn-danger">Xóa</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <!-- Nút Previous -->
                                                    <li class="page-item ${curPage == 1 ? 'disabled' : ''}">
                                                        <a class="page-link" href="/admin/order?page=${curPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>

                                                    <!-- Hiển thị số trang -->
                                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                                        <li class="page-item ${curPage == i ? 'active' : ''}">
                                                            <a class="page-link" href="/admin/order?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>

                                                    <!-- Nút Next -->
                                                    <li class="page-item ${curPage == totalPage ? 'disabled' : ''}">
                                                        <a class="page-link" href="/admin/order?page=${curPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
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