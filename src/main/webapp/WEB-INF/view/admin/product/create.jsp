<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Create Product - Vũ Đình Hoàng</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const productFile = $('#productFile');
                        productFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $('#productPreview').attr('src', imgURL);
                            $('#productPreview').css('display', 'block');
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Quản lý sản phẩm</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard / User</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h1 class="text">Tạo sản phẩm</h1>
                                            <hr />
                                            <form:form action="/admin/product/create" method="post"
                                                modelAttribute="product" class="row" enctype="multipart/form-data">
                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorDetailDesc">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorShortDesc">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="exampleInputEmail1"
                                                        class="form-label ${not empty errorName ? 'is-invalid' : ''}">Tên</label>
                                                    <form:input type="text" class="form-control" path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="exampleInputPassword1"
                                                        class="form-label ${not empty errorPrice ? 'is-invalid' : ''}">Giá</label>
                                                    <form:input type="text" class="form-control" path="price" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <label for="exampleInputPhone" class="form-label">Thông tin chi
                                                        tiết</label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                                                        path="detailDesc" />
                                                    ${errorDetailDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="exampleInputName" class="form-label">Thông tin ngắn
                                                        gọn</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                                                        path="shortDesc" />
                                                    ${errorShortDesc}
                                                </div>
                                                <div class="mb-3 col-12" col-md-6>
                                                    <label for="exampleInputDob" class="form-label">Số lượng</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${errorQuantity}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Hãng</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="macbook">MacBook</form:option>
                                                        <form:option value="asus">Asus</form:option>
                                                        <form:option value="acer">Acer</form:option>
                                                        <form:option value="dell">Dell</form:option>
                                                        <form:option value="lenovo">Lenovo</form:option>
                                                        <form:option value="lg">LG</form:option>
                                                        <form:option value="hp">HP</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">

                                                    <label class="form-label" path="target">Target</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="student">Học tập</form:option>
                                                        <form:option value="gamer">Gaming</form:option>
                                                        <form:option value="office">Đồ họa</form:option>
                                                        <form:option value="designer">Văn phòng</form:option>
                                                    </form:select>

                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="formFile" class="form-label">Ảnh</label>
                                                    <input class="form-control" type="file" id="productFile"
                                                        accept=".png, .jpg, .jpeg" name="img-file" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: node;"
                                                        id="productPreview" />
                                                </div>
                                                <div class="mb-5 col-12">
                                                    <button type=" submit" class="btn btn-primary">Create</button>
                                                </div>
                                            </form:form>
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