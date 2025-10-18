package com.nhattruong.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class RegisterDTO {
    @NotNull
    @Size(min = 2, message = "First Name  phải có tối thiểu 2 ký tự")
    private String firstName;

    @NotNull
    @Size(min = 2, message = "Last Name phải có tối thiểu 2 ký tự")
    private String lastName;

    @NotNull
    @Email(message = "Email không hợp lệ. Vui lòng nhập đúng định dạng (ví dụ: ten@gmail.com)", regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")
    private String email;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^(0|\\+?84)[0-9]{9}$", message = "Số điện thoại không hợp lệ (phải bắt đầu bằng 0, 84 hoặc +84 và có 10 số)")
    private String phone;

    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[^A-Za-z0-9\\s]).*[A-Za-z\\d\\S]{8,}$", message = "Mật khẩu phải có ít nhất 8 ký tự, gồm 1 chữ hoa, 1 chữ thường, 1 số và 1 ký tự đặc biệt bất kỳ.")
    private String password;

    @NotBlank(message = "Vui lòng nhập lại mật khẩu để xác nhận")
    private String confirmPassword;

    // ✅ Hàm kiểm tra password có khớp confirmPassword không
    public boolean isPasswordMatch() {
        return password != null && password.equals(confirmPassword);
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
