package servlet;

import dao.StudentDAO;
import models.Student;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
    private StudentDAO dao = new StudentDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            dao.addStudent(new Student(0, request.getParameter("name"), request.getParameter("email"), request.getParameter("course")));
        } 
        else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Student student = new Student(id, request.getParameter("name"), request.getParameter("email"), request.getParameter("course"));
            dao.updateStudent(student);
        } 
        else if ("delete".equals(action)) {
            dao.deleteStudent(Integer.parseInt(request.getParameter("id")));
        }

        response.sendRedirect("index.jsp");
    }
}
