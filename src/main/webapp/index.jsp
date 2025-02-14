
<%@page import="models.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Student Management</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <h2 class="text-center">Student List</h2>

        <!-- Add Student Button -->
        <button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addStudentModal">
            + Add Student
        </button>

        <!-- Student Table -->
        <div class="table-responsive">
            <table class="table table-bordered text-center">
                <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Course</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        StudentDAO dao = new StudentDAO();
                        List<Student> students = dao.getAllStudents();
                        for (Student s : students) {
                    %>
                    <tr>
                        <td><%= s.getId() %></td>
                        <td><%= s.getName() %></td>
                        <td><%= s.getEmail() %></td>
                        <td><%= s.getCourse() %></td>
                        <td>
                            <a class="btn btn-warning btn-sm" href="edit-student.jsp?id=<%= s.getId() %>">Edit</a>
                            <form action="students" method="post" class="d-inline">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= s.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add Student Modal -->
    <div class="modal fade" id="addStudentModal" tabindex="-1" aria-labelledby="addStudentLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addStudentLabel">Add New Student</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="students" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Course</label>
                            <input type="text" name="course" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Add Student</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-primary text-white text-center py-3 mt-5">
        &copy; 2025 Student Management System
    </footer>

</body>
</html>
