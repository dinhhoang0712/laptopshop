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
                <title>Register - Laptopshop</title>
                <link href="css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-7">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Tạo tài khoản</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form method="post" action="/register" modelAttribute="register">

                                                    <c:set var="errorPassword">
                                                        <form:errors path="confirmPassword"
                                                            cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>

                                                    <c:set var="errorName">
                                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="error">
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                    </c:set>

                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input
                                                                    class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                                    type="text" placeholder="Enter your first name"
                                                                    path="firstName" />
                                                                <label for="inputFirstName">Tên</label>
                                                                ${errorName}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating">

                                                                <form:input path="lastName" class="form-control "
                                                                    id="inputLastName" type="text"
                                                                    placeholder="Enter your last name" />
                                                                <label for="inputLastName">Họ</label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <form:input path="email"
                                                            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                            id="inputEmail" type="email"
                                                            placeholder="name@example.com" />
                                                        <label for="inputEmail">Email address</label>
                                                        ${errorEmail}
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">

                                                                <form:input path="password"
                                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                    id="inputPassword" type="password"
                                                                    placeholder="Create a password" />
                                                                <label for="inputPassword">Mật khẩu</label>
                                                                ${errorPassword}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">

                                                                <form:input path="confirmPassword"
                                                                    class="form-control ${not empty error ? 'is-invalid' : ''}"
                                                                    id="inputPasswordConfirm" type="password"
                                                                    placeholder="Confirm password" />
                                                                <label for="inputPasswordConfirm">Xác nhận mật
                                                                    khẩu</label>
                                                                ${error}
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-4 mb-0">

                                                        <div class="d-grid"> <button type=" submit"
                                                                class="btn btn-primary btn-block">Create
                                                                Account</button></div>
                                                    </div>
                                                </form:form>
                                            </div>
                                            <div class="card-footer text-center py-3">

                                                <div class="small"><a href="/login">Đăng nhâp</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>
            </body>

            </html>