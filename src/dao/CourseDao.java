package dao;

import bean.Course;
import util.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Антон on 03.04.2016.
 */
public class CourseDao {
    private final static String GET_COURSES_BY_USER_ID_QUERY = "SELECT c.id, c.name, c.technology, c.id_lecturer, c.price FROM course c INNER JOIN student_course sc ON c.id = sc.id_of_course where sc.id_of_student = ?";

    public static final String GET_ALL_COURSES = "SELECT * FROM course";

    private final static CourseDao instance = new CourseDao();

    private CourseDao(){}

    public final static CourseDao getInstance() {
        return instance;
    }

    public  List<Course> getCoursesByUserID(String userID){
        List<Course> coursesList = new ArrayList<>();
        try {
            PreparedStatement ps = DBUtil.getConnection().prepareStatement(GET_COURSES_BY_USER_ID_QUERY);
            ps.setString(1,userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                coursesList.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }
            return coursesList;
        } catch (SQLException e) {
            e.printStackTrace();
            return coursesList;
        }

    }
    
    public List<Course> getAllCourses(){
        List<Course> courseList = new ArrayList<>();
        try {
            PreparedStatement ps = DBUtil.getConnection().prepareStatement(GET_ALL_COURSES);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                courseList.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseList;
    }
}
