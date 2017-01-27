using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Model
{
    public class TLesson
    {
        public TLesson(TClass tClass, string title)
        {
            this.tClass = tClass;
            this.title = title;
        }

        public override string ToString()
        {
            return tClass.id + " - " + title;
        }

        private int idPvt;
        public int id
        {
            get { return idPvt; }
            set { idPvt = value; }
        }

        private TClass tClassPvt;
        public TClass tClass
        {
            get { return tClassPvt; }
            set { tClassPvt = value; }
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
