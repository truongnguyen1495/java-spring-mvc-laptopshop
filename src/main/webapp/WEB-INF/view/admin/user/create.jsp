<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!-- Latest compiled and minified CSS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link href="/css/create.css" rel="stylesheet">


        <body>
            <div class="container">
                <form action="/admin/user/create1" method="post" class="form-card">
                    <h2>Create a user</h2>

                    <label>Email:</label>
                    <input type="email" name="email" required>

                    <label>Password:</label>
                    <input type="password" name="password" required>

                    <label>Phone number:</label>
                    <input type="text" name="phone" required>

                    <label>Full Name:</label>
                    <input type="text" name="fullname" required>

                    <label>Address:</label>
                    <input type="text" name="address" required>

                    <button type="submit">Create</button>
                </form>
            </div>
        </body>

        </html>