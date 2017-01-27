using System;
using System.Collections.Generic;
using System.Text;
using Core.Model;
using System.Data.OleDb;
using System.Configuration;

namespace Core.Control
{
    /// <summary>
    /// Patterns: Singleton
    /// </summary>
    public class DbControl
    {
        private static DbControl instance = null;
        //TODO:Connection String
        //private string conectionString = System.Configuration.ConfigurationManager.ConnectionStrings[0].ConnectionString;
        private string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + databasePath + ";User Id=admin;Password=";

        private static string databasePath;

        /// <summary>
        /// DbControl
        /// </summary>
        private DbControl()
        {
        }

        public static void setDataBasePath(string dbPath)
        {
            databasePath = dbPath;
        }

        public static DbControl getInstance()
        {
            if (instance == null)
                instance = new DbControl();
            return instance; 
        }

        /// <summary>
        /// Get User verifyng de password.
        /// </summary>
        /// <param name="user_id"></param>
        /// <param name="user_password"></param>
        /// <returns></returns>
        public TUser getUser(string user_id, string user_password)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Users WHERE (id = '" + user_id + "') AND (user_password = '" + user_password + "')";
            dbConnection.Close();
            dbConnection.Open();
            try
            {
                dbDataReader = dbCommand.ExecuteReader();
                TUser tUser;
                dbDataReader.Read();
                tUser = new TUser(dbDataReader["id"].ToString(), dbDataReader["user_name"].ToString(), dbDataReader["email"].ToString(), Convert.ToBoolean(dbDataReader["is_teacher"]));
                dbDataReader.Close();
                dbConnection.Close();
                return tUser;
            }
            catch
            {
                dbConnection.Close();
                return null;
            }
        }

        /// <summary>
        /// User details
        /// </summary>
        /// <param name="user_id"></param>
        /// <returns></returns>
        public TUser getUser(string user_id)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Users WHERE id = '" + user_id + "'";
            dbConnection.Close();
            dbConnection.Open();
            try
            {
                dbDataReader = dbCommand.ExecuteReader();
                TUser tUser;
                dbDataReader.Read();
                tUser = new TUser(dbDataReader["id"].ToString(), dbDataReader["user_name"].ToString(), dbDataReader["email"].ToString(), Convert.ToBoolean(dbDataReader["is_teacher"]));
                dbDataReader.Close();
                dbConnection.Close();
                return tUser;
            }
            catch
            {
                dbConnection.Close();
                return null;
            }
        }

        public TUser getUserByEmail(string user_email)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Users WHERE email = '" + user_email + "'";
            dbConnection.Close();
            dbConnection.Open();
            try
            {
                dbDataReader = dbCommand.ExecuteReader();
                TUser tUser;
                dbDataReader.Read();
                tUser = new TUser(dbDataReader["id"].ToString(), dbDataReader["user_name"].ToString(), dbDataReader["email"].ToString(), Convert.ToBoolean(dbDataReader["is_teacher"]));
                dbDataReader.Close();
                dbConnection.Close();
                return tUser;
            }
            catch
            {
                dbConnection.Close();
                return null;
            }
        }

        public String getUserPassword(string user_id)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT user_password FROM Users WHERE id = '" + user_id + "'";
            dbConnection.Close();
            dbConnection.Open();
            try
            {
                dbDataReader = dbCommand.ExecuteReader();
                dbDataReader.Read();
                string userPassword = dbDataReader["user_password"].ToString();
                dbDataReader.Close();
                dbConnection.Close();
                return userPassword;
            }
            catch
            {
                dbConnection.Close();
                return null;
            }
        }

        /// <summary>
        /// Update user parameters
        /// </summary>
        /// <param name="user_id"></param>
        /// <param name="?"></param>
        /// <returns></returns>
        public bool updateUser(string user_id, string new_name, string new_email)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            //------------------------------

            dbCommand.CommandText = "UPDATE Users SET user_name = '" + new_name + "', email = '" + new_email + "' WHERE id = '" + user_id + "'";
            dbConnection.Close();
            dbConnection.Open();
            try
            {
                dbCommand.ExecuteNonQuery();
                dbConnection.Close();
                return true;
            }
            catch
            {
                dbConnection.Close();
                return false;
            }
        }

        public bool changeUserPassword(string user_id, string old_password, string new_password)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            //------------------------------

            dbCommand.CommandText = "UPDATE Users SET user_password='" + new_password + "' WHERE (id = '" + user_id + "') AND (user_password = '" + old_password + "')";
            dbConnection.Close();
            dbConnection.Open();
            try
            {
                dbCommand.ExecuteNonQuery();
                dbConnection.Close();
                return true;
            }
            catch
            {
                dbConnection.Close();
                return false;
            }
        }

        public TCourse getCourse(string course_id)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Courses INNER JOIN User_Course_Group ON Courses.id = User_Course_Group.course_id WHERE (id = '" + course_id + "')";
            dbConnection.Close();
            dbConnection.Open();
            dbDataReader = dbCommand.ExecuteReader();
            TCourse tCourseAux;

            dbDataReader.Read();
            TUser responsableTeacher = null;
            if (dbDataReader["responsable_teacher"] != null)
                responsableTeacher = getUser(dbDataReader["responsable_teacher"].ToString());
            else
                responsableTeacher = null;
            tCourseAux = new TCourse(dbDataReader["id"].ToString(), dbDataReader["course_name"].ToString(), dbDataReader["group_id"].ToString(), responsableTeacher);

            dbDataReader.Close();
            dbConnection.Close();
            return tCourseAux;
        }

        public List<TCourse> getCourses(string user_id, bool current)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT id, course_name, group_id, user_id, is_current, responsable_teacher FROM Courses INNER JOIN User_Course_Group ON (Courses.id = User_Course_Group.course_id) WHERE (user_id = '" + user_id + "') AND (is_current = " + current + ")";
            dbConnection.Close();
            dbConnection.Open();
            dbDataReader = dbCommand.ExecuteReader();
            List<TCourse> tCourseList = new List<TCourse>();
            TCourse tCourseAux;
            while (dbDataReader.Read())
            {
                TUser responsableTeacher = null;
                if (dbDataReader["responsable_teacher"] != null)
                    responsableTeacher = getUser(dbDataReader["responsable_teacher"].ToString());
                else
                    responsableTeacher = null;
                tCourseAux = new TCourse(dbDataReader["id"].ToString(), dbDataReader["course_name"].ToString(), dbDataReader["group_id"].ToString(), responsableTeacher);
                tCourseList.Add(tCourseAux);
            }
            dbDataReader.Close();
            dbConnection.Close();
            return tCourseList;
        }

        public List<TUser> getUsersCourse(String course_id, bool current)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Users INNER JOIN User_Course_Group ON Users.id = User_Course_Group.user_id WHERE (User_Course_Group.course_id = '" + course_id + "') AND (User_Course_Group.is_current = " + current + ")";
            dbConnection.Close();
            dbConnection.Open();
            dbDataReader = dbCommand.ExecuteReader();
            TUser tUserAux;
            List<TUser> usersCourse = new List<TUser>();
            while (dbDataReader.Read())
            {
                tUserAux = new TUser(dbDataReader["id"].ToString(), dbDataReader["user_name"].ToString(), dbDataReader["email"].ToString(), Convert.ToBoolean(dbDataReader["is_teacher"]));
                usersCourse.Add(tUserAux);
            }
            dbDataReader.Close();
            dbConnection.Close();
            return usersCourse;
        }

        public TTopic createTopic(TUser tUserStarter, TCourse tCourse, string title)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            TTopic tTopic = new TTopic(tCourse, title);
            try
            {
                //Begin Transaction
                tTopic.startDateTime = DateTime.Now;
                tTopic.starterTeacher = tUserStarter;
                dbCommand.CommandText = "INSERT INTO Topics (course_id, group_id, title, startDateTime, starterTeacher) VALUES('" + tTopic.tCourse.id + "', '" + tTopic.tCourse.groupId + "', '" + tTopic.title + "', '" + tTopic.startDateTime.ToString() + "', '" + tUserStarter.id + "')";
                dbCommand.ExecuteNonQuery();
                dbCommand.CommandText = "SELECT * FROM Topics WHERE (course_id = '" + tTopic.tCourse.id + "') AND (group_id = '" + tTopic.tCourse.groupId + "') AND (title = '" + tTopic.title + "') AND (startDateTime = '" + tTopic.startDateTime.ToString() + "')";
                dbDataReader = dbCommand.ExecuteReader();
                dbDataReader.Read();
                tTopic.id = Convert.ToInt32(dbDataReader["id"]);
                dbDataReader.Close();
                dbTransaction.Commit();
                //End Transaction
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
                return null;
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbDataReader.Close();
            dbConnection.Close();
            return tTopic;
        }

        public void finishTopic(TTopic tTopic)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            try
            {
                //---Begin Transaction---
                tTopic.finishDateTime = DateTime.Now;
                //UPDATE Topic
                dbCommand.CommandText = "UPDATE Topics SET finishDateTime = '" + tTopic.finishDateTime.ToString() + "' WHERE id = " + tTopic.id.ToString();
                dbCommand.ExecuteNonQuery();;
                dbTransaction.Commit();
                //----End Transaction----
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbConnection.Close();
        }

        public List<TTopic> getStartedTopics(string user_id)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Topics INNER JOIN User_Course_Group ON User_Course_Group.course_id = Topics.course_id  AND User_Course_Group.group_id = Topics.group_id WHERE (User_Course_Group.user_id = '" + user_id + "') AND (Topics.finishDateTime IS NULL)";
            /*AND (User_Course_Group.is_current = True)*/
            dbConnection.Close();
            dbConnection.Open();
            dbDataReader = dbCommand.ExecuteReader();
            TTopic tTopicAux;
            List<TTopic> startedTopics = new List<TTopic>();
            while (dbDataReader.Read())
            {
                tTopicAux = new TTopic(getCourse(dbDataReader["Topics.course_id"].ToString()), dbDataReader["title"].ToString());
                tTopicAux.id = Convert.ToInt32(dbDataReader["id"]);
                tTopicAux.starterTeacher = getUser(dbDataReader["starterTeacher"].ToString());
                tTopicAux.startDateTime = Convert.ToDateTime(dbDataReader["startDateTime"]);
                startedTopics.Add(tTopicAux);
            }
            dbDataReader.Close();
            dbConnection.Close();
            return startedTopics;
        }

        public List<TTopic> getArchivedTopics(string course_id)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Topics WHERE course_id = '" + course_id + "' AND finishDateTime IS NOT NULL";
            dbConnection.Close();
            dbConnection.Open();
            dbDataReader = dbCommand.ExecuteReader();
            TTopic tTopicAux;
            List<TTopic> startedTopics = new List<TTopic>();
            while (dbDataReader.Read())
            {
                tTopicAux = new TTopic(getCourse(dbDataReader["course_id"].ToString()), dbDataReader["title"].ToString());
                tTopicAux.id = Convert.ToInt32(dbDataReader["id"]);
                tTopicAux.starterTeacher = getUser(dbDataReader["starterTeacher"].ToString());
                tTopicAux.startDateTime = Convert.ToDateTime(dbDataReader["startDateTime"]);
                tTopicAux.finishDateTime = Convert.ToDateTime(dbDataReader["finishDateTime"]);
                startedTopics.Add(tTopicAux);
            }
            dbDataReader.Close();
            dbConnection.Close();
            return startedTopics;
        }

        public void activeTopic(int topic_id)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            try
            {
                //---Begin Transaction---
                //UPDATE Topic
                dbCommand.CommandText = "UPDATE Topics SET finishDateTime = NULL WHERE id = " + topic_id;
                dbCommand.ExecuteNonQuery(); ;
                dbTransaction.Commit();
                //----End Transaction----
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbConnection.Close();
        }

        public List<TUser> getUsersInTopic(int topic_id, bool teacher)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //------------------------------

            dbCommand.CommandText = "SELECT * FROM Users INNER JOIN User_Topic ON Users.id = User_Topic.user_id WHERE (User_Topic.topic_id = " + topic_id.ToString() + ") AND (Users.is_teacher = " + teacher + ") AND (User_Topic.finishDateTime IS NULL)";
            dbConnection.Close();
            dbConnection.Open();
            dbDataReader = dbCommand.ExecuteReader();
            TUser tUserAux;
            List<TUser> usersInTopic = new List<TUser>();
            while (dbDataReader.Read())
            {
                tUserAux = new TUser(dbDataReader["id"].ToString(), dbDataReader["user_name"].ToString(), dbDataReader["email"].ToString(), Convert.ToBoolean(dbDataReader["is_teacher"]));
                usersInTopic.Add(tUserAux);
            }
            dbDataReader.Close();
            dbConnection.Close();
            return usersInTopic;
        }

        public void enterTopic(TUser tUser, TTopic tTopic)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            try
            {
                //Begin Transaction
                //Verify if the user is already on-line
                dbCommand.CommandText = "SELECT * FROM User_Topic WHERE user_id = '" + tUser.id + "' AND finishDateTime IS NULL";
                dbDataReader = dbCommand.ExecuteReader();
                if (dbDataReader.HasRows)
                {
                    dbDataReader.Close();
                    dbCommand.CommandText = "UPDATE User_Topic SET finishDateTime = '" + DateTime.Now.ToString() + "' WHERE user_id = '" + tUser.id + "' AND finishDateTime IS NULL";
                    dbCommand.ExecuteNonQuery();
                }
                dbDataReader.Close();
                dbCommand.CommandText = "INSERT INTO User_Topic (user_id, topic_id, startDateTime) VALUES ('" + tUser.id + "', '" + tTopic.id + "', '" + DateTime.Now.ToString() + "')";
                dbCommand.ExecuteNonQuery();
                tUser.topic = tTopic;
                dbTransaction.Commit();
                //End Transaction
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbConnection.Close();
        }

        public void exitTopic(TUser tUser)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            try
            {
                //Begin Transaction
                dbCommand.CommandText = "UPDATE User_Topic SET finishDateTime = '" + DateTime.Now.ToString() + "' WHERE topic_id = " + tUser.topic.id.ToString();
                dbCommand.ExecuteNonQuery();
                tUser.topic = null;
                dbTransaction.Commit();
                //End Transaction
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbConnection.Close();
        }

        public void setMessageDeletedByStudent(string message_id)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            try
            {
                dbCommand.CommandText = "UPDATE Messages SET deletedByStudent = true WHERE id = " + message_id;
                dbCommand.ExecuteNonQuery();
                dbTransaction.Commit();
                //End Transaction
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbConnection.Close();
        }

        public void setPositionOfNewContentItem(string contentItemGroup)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            try
            {
                //Begin Transaction
                //Verify if the user is already on-line
                dbCommand.CommandText = "SELECT MAX(id) FROM ContentItems WHERE item_group = '" + contentItemGroup + "'" ;
                dbDataReader = dbCommand.ExecuteReader();
                if (dbDataReader.HasRows)
                {
                    dbDataReader.Read();
                    Int64 maxId = dbDataReader.GetInt32(0); //MAX id is the new item
                    dbDataReader.Close();
                    dbCommand.CommandText = "UPDATE ContentItems SET [position] = " + maxId.ToString() + " WHERE (id = " + maxId.ToString() + ") AND (item_group = 'A')";
                    dbCommand.ExecuteNonQuery();
                }
                dbTransaction.Commit();
                //End Transaction
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbConnection.Close();
        }

        public void changePositionOfContentItems(int oldPositionIndex, int newPositionIndex, string owner)
        {
            //--Data Base Access Variables--
            System.Data.OleDb.OleDbConnection dbConnection = new System.Data.OleDb.OleDbConnection(connectionString);
            System.Data.OleDb.OleDbCommand dbCommand = new OleDbCommand();
            dbCommand.Connection = dbConnection;
            System.Data.OleDb.OleDbTransaction dbTransaction;
            System.Data.OleDb.OleDbDataReader dbDataReader;
            //-----------------------------

            dbConnection.Close();
            dbConnection.Open();
            dbTransaction = dbConnection.BeginTransaction();
            dbCommand.Transaction = dbTransaction;
            try
            {
                //--Begin Transaction--

                //ID of the oldPosition
                dbCommand.CommandText = "SELECT id, [position] FROM ContentItems WHERE (item_group = 'A') AND (owner = '" + owner + "') ORDER BY [position]";
                dbDataReader = dbCommand.ExecuteReader();
                for (int count = 0; count <= oldPositionIndex; count++)
                    dbDataReader.Read();
                Int64 oldPositionId = dbDataReader.GetInt32(0); //id of the oldPosition
                Int64 oldPosition = dbDataReader.GetInt32(1); //position of the oldPositionIndex
                dbDataReader.Close();

                //ID of the newPosition
                dbCommand.CommandText = "SELECT id, [position] FROM ContentItems WHERE (item_group = 'A') AND (owner = '" + owner + "') ORDER BY [position]";
                dbDataReader = dbCommand.ExecuteReader();
                for (int count = 0; count <= newPositionIndex; count++)
                    dbDataReader.Read();
                Int64 newPositionId = dbDataReader.GetInt32(0); //id of the newPosition
                Int64 newPosition = dbDataReader.GetInt32(1); //position of the newPositionIndex
                dbDataReader.Close();

                //UPDATE of the oldPosition
                dbCommand.CommandText = "UPDATE ContentItems SET [position] = " + newPosition.ToString() + " WHERE (id = " + oldPositionId.ToString() + ") AND (item_group = 'A')";
                dbCommand.ExecuteNonQuery();

                //UPDATE of the newPosition
                dbCommand.CommandText = "UPDATE ContentItems SET [position] = " + oldPosition.ToString() + " WHERE (id = " + newPositionId.ToString() + ") AND (item_group = 'A')";
                dbCommand.ExecuteNonQuery();

                dbTransaction.Commit();

                //--End Transaction--
            }
            catch
            {
                dbTransaction.Rollback();
                dbCommand.Transaction = null;
                dbTransaction = null;
                dbConnection.Close();
            }

            dbCommand.Transaction = null;
            dbTransaction = null;
            dbConnection.Close();
        }
    }
}
