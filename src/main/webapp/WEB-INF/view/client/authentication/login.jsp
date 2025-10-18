<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Login - SB Admin</title>
                <link href="css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <script>
                    // ✅ Hàm bật/tắt xem mật khẩu
                    function togglePassword(inputId, btn) {
                        const input = document.getElementById(inputId);
                        const icon = btn.querySelector("i");
                        if (input.type === "password") {
                            input.type = "text";
                            icon.classList.remove("bi-eye");
                            icon.classList.add("bi-eye-slash");
                        } else {
                            input.type = "password";
                            icon.classList.remove("bi-eye-slash");
                            icon.classList.add("bi-eye");
                        }
                    }
                </script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Login</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form action="/login" method="post" modelAttribute="loginUser"
                                                    enctype="multipart/form-data">
                                                    <!-- Email -->
                                                    <div class="form-floating mb-3">
                                                        <c:set var="errorEmail">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <form:input class="form-control" id="inputEmail" path="email"
                                                            type="email" placeholder="name@example.com"
                                                            cssClass="form-control ${not empty errorEmail ? 'is-invalid' : ''}" />
                                                        <label for="inputEmail">Email address</label>
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </div>
                                                    <!-- Password -->
                                                    <div class="form-floating mb-3">
                                                        <c:set var="errorPassword">
                                                            <form:errors path="password" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <form:input class="form-control" id="inputPassword"
                                                            path="password" type="password" placeholder="Password"
                                                            cssClass="form-control ${not empty errorPassword ? 'is-invalid' : ''}" />
                                                        <label for="inputPassword">Password</label>
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                        <!-- Show/hide Password -->
                                                        <button type="button"
                                                            class="btn btn-sm btn-outline-secondary position-absolute top-50 end-0 translate-middle-y me-2"
                                                            onclick="togglePassword('password', this)">
                                                            <i class="bi bi-eye"></i>
                                                        </button>
                                                    </div>
                                                    <div class="form-check mb-3">
                                                        <input class="form-check-input" id="inputRememberPassword"
                                                            type="checkbox" value="" />
                                                        <label class="form-check-label"
                                                            for="inputRememberPassword">Remember Password</label>
                                                    </div>
                                                    <!-- ✅ Hiển thị lỗi đăng nhập -->
                                                    <c:if test="${not empty loginError}">
                                                        <div class="alert alert-danger text-center" role="alert">
                                                            ${loginError}
                                                        </div>
                                                    </c:if>
                                                    <div
                                                        class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                        <a class="small" href="password.html">Forgot Password?</a>
                                                        <button type="submit" class="btn btn-primary px-4">Login
                                                        </button>
                                                    </div>

                                                </form:form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Need an account? Sign up!</a>
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