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
                    <title>Update Order - Vũ Đình Hoàng</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Quản lý đơn hàng</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">Dashboard / Order</li>
                                    </ol>
                                    <div class="container mt-5">
                                        <div class="row justify-content-center">
                                            <div class="col-md-6">
                                                <div class="card p-4 shadow-lg">
                                                    <h2 class="text-center mb-3">Update a order</h2>
                                                    <hr />
                                                    <form:form action="/admin/order/update" method="post"
                                                        enctype="multipart/form-data">
                                                        <input type="hidden" name="id" value="${order.id}" />

                                                        <div class="mb-3">
                                                            <strong>Order id = ${order.id}</strong>
                                                        </div>
                                                        <div class="mb-3">
                                                            <strong>Giá:
                                                                <fmt:formatNumber type="number"
                                                                    value="${order.totalPrice}" />
                                                                đ
                                                            </strong>
                                                        </div>
                                                        <div class="mb-3">
                                                            <strong>User:</strong> Admin full
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label fw-bold">Status:</label>
                                                            <select class="form-select" name="status" required>
                                                                <option value="PENDING">PENDING</option>
                                                                <option value="SHIPPING">SHIPPING</option>
                                                                <option value="COMPLETE">COMPLETE</option>
                                                                <option value="CANCEL">CANCEL</option>
                                                            </select>
                                                        </div>

                                                        <div class="d-grid">
                                                            <button type="submit"
                                                                class="btn btn-warning fw-bold">Update</button>
                                                        </div>
                                                    </form:form>
                                                </div>
                                            </div>
                                        </div>
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