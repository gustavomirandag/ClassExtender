using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Model
{
    public class TUser
    {
        public TUser(string id, string name, string email, bool isTeacher)
        {
            this.id = id;
            this.name = name;
            this.email = email;
            this.isTeacher = isTeacher;
        }

        public override string ToString()
        {
            return id + " - " + name;
        }

        private string idPvt;
        public string id
        {
            get { return idPvt; }
            set { idPvt = value; }
        }

        private string namePvt;
        public string name
        {
            get { return namePvt; }
            set { namePvt = value; }
        }

        private string emailPvt;
        public string email
        {
            get { return emailPvt; }
            set { emailPvt = value; }
        }
        

        private bool isTeacherPvt;
        public bool isTeacher
        {
            get { return isTeacherPvt; }
            set { isTeacherPvt = value; }
        }

        private TTopic topicPvt;
        public TTopic topic
        {
            get { return topicPvt; }
            set { topicPvt = value; }
        }
    }
}
