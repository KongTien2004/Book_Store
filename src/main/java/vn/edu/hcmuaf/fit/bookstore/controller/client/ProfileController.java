package vn.edu.hcmuaf.fit.bookstore.controller.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.bookstore.model.UserProfiles;
import vn.edu.hcmuaf.fit.bookstore.service.client.ProfileService;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Lấy userId từ session (giả sử user đã đăng nhập)
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            // Chưa đăng nhập, redirect về trang login
            response.sendRedirect(request.getContextPath() + "/sign_in");
            return;
        }

        try {
            // Lấy connection từ request attribute hoặc connection pool
            Connection connection = (Connection) request.getAttribute("connection");
            if (connection == null) {
                // Set error message và vẫn forward về profile.jsp
                request.setAttribute("errorMessage", "Không thể kết nối database");
                request.getRequestDispatcher("/client/template/profile.jsp").forward(request, response);
                return;
            }

            ProfileService profileService = new ProfileService(connection);

            // Lấy thông tin profile
            UserProfiles userProfile = profileService.getProfileById(userId);

            // Nếu chưa có profile, tạo object rỗng
            if (userProfile == null) {
                userProfile = new UserProfiles();
                userProfile.setUserId(userId);
            }

            request.setAttribute("userProfile", userProfile);
            request.getRequestDispatcher("/client/template/profile.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("/client/template/profile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Lấy userId từ session
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Lấy connection
            Connection connection = (Connection) request.getAttribute("connection");
            if (connection == null) {
                request.setAttribute("errorMessage", "Không thể kết nối database");
                doGet(request, response);
                return;
            }

            ProfileService profileService = new ProfileService(connection);

            // Lấy dữ liệu từ form
            String fullName = request.getParameter("fullName");
            String birthDateStr = request.getParameter("birthDate");
            String genderStr = request.getParameter("gender");
            String phone = request.getParameter("phone");

            // Validate và convert dữ liệu
            if (fullName == null || fullName.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Họ tên không được để trống");
                doGet(request, response);
                return;
            }

            LocalDate birthDate = null;
            if (birthDateStr != null && !birthDateStr.isEmpty()) {
                try {
                    birthDate = LocalDate.parse(birthDateStr);
                } catch (Exception e) {
                    request.setAttribute("errorMessage", "Ngày sinh không hợp lệ");
                    doGet(request, response);
                    return;
                }
            }

            UserProfiles.Gender gender = null;
            if (genderStr != null && !genderStr.isEmpty()) {
                try {
                    gender = UserProfiles.Gender.valueOf(genderStr);
                } catch (Exception e) {
                    request.setAttribute("errorMessage", "Giới tính không hợp lệ");
                    doGet(request, response);
                    return;
                }
            }

            // Tạo object UserProfiles
            UserProfiles profile = new UserProfiles();
            profile.setUserId(userId);
            profile.setFullName(fullName);
            profile.setBirthDate(birthDate);
            profile.setGender(gender);
            profile.setPhone(phone);

            // Lưu profile
            boolean success = profileService.saveProfile(profile);

            if (success) {
                request.setAttribute("successMessage", "Cập nhật thông tin thành công");
            } else {
                request.setAttribute("errorMessage", "Cập nhật thông tin thất bại");
            }

            // Hiển thị lại trang profile
            doGet(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            doGet(request, response);
        }
    }
}
