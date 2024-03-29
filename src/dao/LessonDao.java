package dao;

import bean.Lesson;
import util.DBUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Антон on 04.04.2016.
 */
public class LessonDao {
    public static final String GET_LESSONS_BY_USER_ID_QUERY = "SELECT passed_lesson.id_lesson, course.name, data_for_lesson.data FROM passed_lesson INNER JOIN lesson ON passed_lesson.id_lesson = lesson.id INNER JOIN course ON lesson.id_course = course.id INNER JOIN data_for_lesson ON lesson.id_data = data_for_lesson.id WHERE passed_lesson.id_student = ?";

    public static final String GET_ALL_LESSONS = "SELECT  lesson.id, course.name, data_for_lesson.data FROM lesson INNER JOIN course ON lesson.id_course = course.id INNER JOIN data_for_lesson ON lesson.id_data = data_for_lesson.id";


    private final static LessonDao instance = new LessonDao();

    private LessonDao(){}

    public final static LessonDao getInstance() {
        return instance;
    }

    public  List<Lesson> getLessonsByUserID(String userID){
        List<Lesson> lessonList = new ArrayList<>();
        try {
            PreparedStatement ps = DBUtil.getConnection().prepareStatement(GET_LESSONS_BY_USER_ID_QUERY);
            ps.setString(1,userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                lessonList.add(new Lesson(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
            return lessonList;
        } catch (SQLException e) {
            e.printStackTrace();
            return lessonList;
        }

    }

    public List<Lesson> getAllLessons(){
        List<Lesson> lessonList = new ArrayList<>();
        try {
            PreparedStatement ps = DBUtil.getConnection().prepareStatement(GET_ALL_LESSONS);
            ResultSet rs  = ps.executeQuery();
            while (rs.next())
                lessonList.add(new Lesson(rs.getInt(1), rs.getString(2), rs.getString(3)));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lessonList;
    }
}
