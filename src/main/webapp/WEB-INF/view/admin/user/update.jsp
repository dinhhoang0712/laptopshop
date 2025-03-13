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
                <title>Update User - Vũ Đình Hoàng</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $('#avatarFile');
                        const orgImage = "${updateUser.avatar}";
                        if (orgImage) {
                            const urlImage = "/images/avatar/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "book" });
                        }
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $('#avatarPreview').attr('src', imgURL);
                            $('#avatarPreview').css('display', 'block');
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
                                <h1 class="mt-4">Quản lý người dùng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard / User</li>
                                </ol>
                                <<div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h1 class="text">Sửa thông tin</h1>
                                            <hr />
                                            <form:form action="/admin/user/update" method="post"
                                                modelAttribute="updateUser" class="row" enctype="multipart/form-data">

                                                <div class="mb-3 col-12 col-md-6" style="display: none;">
                                                    <label for="exampleInputEmail1" class="form-label">ID</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="exampleInputEmail1" class="form-label">Email</label>
                                                    <form:input type="email" class="form-control" path="email"
                                                        disabled="true" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="exampleInputPhone" class="form-label">Số điện
                                                        thoại</label>
                                                    <form:input type="text" class="form-control" path="phone" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="exampleInputName" class="form-label">Họ và tên</label>
                                                    <form:input type="text" class="form-control" path="fullName" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="exampleInputDob" class="form-label">Địa chỉ</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Role</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">ADMIN</form:option>
                                                        <form:option value="USER">USER</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="formFile" class="form-label">Avatar</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="img-file" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: node;" id="avatarPreview" />
                                                </div>
                                                <div class="mb-5 col-12">
                                                    <button type=" submit" class="btn btn-primary">update</button>
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