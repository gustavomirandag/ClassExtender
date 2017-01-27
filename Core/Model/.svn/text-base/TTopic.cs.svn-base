using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Model
{
    public class TTopic
    {
        public TTopic(TCourse tCourse, string title)
        {
            this.tCourse = tCourse;
            this.title = title;
        }

        public override string ToString()
        {
            return tCourse.id + " - " + title;
        }

        private int idPvt;
        public int id
        {
            get { return idPvt; }
            set { idPvt = value; }
        }

        private TCourse tCoursePvt;
        public TCourse tCourse
        {
            get { return tCoursePvt; }
            set { tCoursePvt = value; }
        }

        private string titlePvt;
        public string title
        {
            get { return titlePvt; }
            set { titlePvt = value; }
        }

        private DateTime startDateTimePvt;
        public DateTime startDateTime
        {
            get { return startDateTimePvt; }
            set { startDateTimePvt = value; }
        }

        private DateTime finishDateTimePvt;
        public DateTime finishDateTime
        {
            get { return finishDateTimePvt; }
            set { finishDateTimePvt = value; }
        }

        private TUser starterTeacherPvt;
        public TUser starterTeacher
        {
            get { return starterTeacherPvt; }
            set { starterTeacherPvt = value; }
        }
    }
}
