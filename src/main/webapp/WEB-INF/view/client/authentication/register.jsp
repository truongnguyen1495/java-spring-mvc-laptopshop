<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Register - SB Admin</title>
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
                                    <div class="col-lg-7">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form action="/register" method="post"
                                                    modelAttribute="registerUser" enctype="multipart/form-data">
                                                    <div class="row mb-3">
                                                        <!-- First Name -->
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorFirstName">
                                                                    <form:errors path="firstName"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input class="form-control" type="text"
                                                                    cssClass="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                                    placeholder="Enter your first name"
                                                                    path="firstName" />
                                                                <label for="inputFirstName">First name</label>
                                                                <form:errors path="firstName"
                                                                    cssClass="invalid-feedback" />
                                                            </div>
                                                        </div>
                                                        <!-- Last Name -->
                                                        <div class="col-md-6">
                                                            <div class="form-floating">
                                                                <c:set var="errorLastName">
                                                                    <form:errors path="lastName"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input class="form-control" type="text"
                                                                    cssClass="form-control ${not empty errorLastName ? 'is-invalid' : ''}"
                                                                    placeholder="Enter your last name"
                                                                    path="lastName" />
                                                                <label for="inputLastName">Last name</label>
                                                                <form:errors path="lastName"
                                                                    cssClass="invalid-feedback" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <!-- Email -->
                                                                <c:set var="errorEmail">
                                                                    <form:errors path="email"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input id="inputEmail" path="email" type="email"
                                                                    cssClass="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                                    placeholder="name@example.com" />
                                                                <label>Email address</label>
                                                                <form:errors path="email" cssClass="invalid-feedback" />
                                                            </div>
                                                        </div>
                                                        <!-- Phone number-->
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorPhone">
                                                                    <form:errors path="phone"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input class="form-control" type="phone"
                                                                    cssClass="form-control ${not empty errorPhone ? 'is-invalid' : ''}"
                                                                    placeholder="0906...." path="phone" />
                                                                <label for="inputPhone">Phone number</label>
                                                                <form:errors path="phone" cssClass="invalid-feedback" />
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <!-- Password -->
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorPassword">
                                                                    <form:errors path="password"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input class="form-control" type="password"
                                                                    cssClass="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                    placeholder="Create a password" path="password" />
                                                                <label> Password</label>
                                                                <form:errors path="password"
                                                                    cssClass="invalid-feedback" />
                                                                <!-- Show/hide Password -->
                                                                <button type="button"
                                                                    class="btn btn-sm btn-outline-secondary position-absolute top-50 end-0 translate-middle-y me-2"
                                                                    onclick="togglePassword('password', this)">
                                                                    <i class="bi bi-eye"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <!-- Confirm Password -->
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorConfirmPassword">
                                                                    <form:errors path="confirmPassword"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input class="form-control" type="password"
                                                                    cssClass="form-control ${not empty errorConfirmPassword ? 'is-invalid' : ''}"
                                                                    placeholder="Confirm password"
                                                                    path="confirmPassword" />
                                                                <label for="inputPasswordConfirm">Confirm
                                                                    Password</label>
                                                                <form:errors path="confirmPassword"
                                                                    cssClass="invalid-feedback" />
                                                                <!-- Show/hide ConfirmPassword -->
                                                                <button type="button"
                                                                    class="btn btn-sm btn-outline-secondary position-absolute top-50 end-0 translate-middle-y me-2"
                                                                    onclick="togglePassword('confirmPassword', this)">
                                                                    <i class="bi bi-eye"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-4 mb-0">
                                                        <button type="submit" class="btn btn-primary px-4">Create
                                                            Account</button>

                                                    </div>
                                                </form:form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/login">Have an account? Go to login</a>
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