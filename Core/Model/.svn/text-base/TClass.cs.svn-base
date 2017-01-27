using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Model
{
    /// <summary>
    /// Class Type
    /// </summary>
    public class TClass
    {
        public TClass(string id, string name, string groupId)
        {
            this.id = id;
            this.name = name;
            this.groupId = groupId;
        }

        public TClass(string id, string name, string groupId, TUser responsableTeacher)
        {
            this.id = id;
            this.name = name;
            this.groupId = groupId;
            this.responsableTeacher = responsableTeacher;
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

        private string groupIdPvt;
        public string groupId
        {
            get { return groupIdPvt; }
            set { groupIdPvt = value; }
        }

        private TUser responsableTeacherPvt;
        public TUser responsableTeacher
        {
            get { return responsableTeacherPvt; }
            set { responsableTeacherPvt = value; }
        }
    }
}
