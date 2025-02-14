<%@page import="models.Student"%>
<%@page import="dao.StudentDAO"%>


<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    StudentDAO dao = new StudentDAO();
    Student student = dao.getStudentById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Student Management</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-warning text-white text-center">
                        <h4>Edit Student</h4>
                    </div>
                    <div class="card-body">
                        <form action="students" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="<%= student.getId() %>">

                            <div class="mb-3">
                                <label class="form-label">Name</label>
                                <input type="text" name="name" class="form-control" value="<%= student.getName() %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" value="<%= student.getEmail() %>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Course</label>
                                <input type="text" name="course" class="form-control" value="<%= student.getCourse() %>" required>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-success">Update Student</button>
                                <a href="index.jsp" class="btn btn-secondary">Back</a>
                            </div>
                        </form>
                    </div>
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
