using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace sckregLib
{
    public class clsSCKCREG
    {
        public static bool IsEntriesCoach(SqlConnection connection, string psMeetId, string psqcc, ref  string rsName, ref string rsTeamId, ref string rsClub)
        {
            // checks if qcc (Coach entries tag) is registered for the current Regatta 
            //   if so returend True and their name and club

            using (connection)
            {
                string sFullClubName = "";
                string sCoachName = "";
                string sTeamId = "";
                bool bCoachFound = false;
                string sSql = "select rtrim([First]) + ' ' + rtrim([Last]) as 'Coachname' , tc.clubApprev, tt.[name] 'TeamName' FROM tCoaches tc join [th2013_teams] tt on tt.[id]= tc.clubApprev where qcc = '" + psqcc + "'";

                SqlCommand command = new SqlCommand(sSql, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sCoachName = reader.GetString(0);
                        sTeamId = reader.GetString(1);
                        sFullClubName = reader.GetString(2);
                        bCoachFound = true;
                    }
                }
                else
                {
                    sFullClubName = "Team Not Found";
                }
                rsClub = sFullClubName.Trim();
                rsTeamId = sTeamId.Trim();
                rsName = sCoachName.Trim();
                reader.Close();
                return bCoachFound;
            }
    
    }

        public static string GetClubName(SqlConnection connection, string psTeamId)
        {
            // Returns Club Name for given club ID
            using (connection)
            {
                string sFullClubName = "";
                SqlCommand command = new SqlCommand(
                  "SELECT [name] FROM [th2013_Teams] where [id] = '" + psTeamId + "' ;",
                  connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sFullClubName = reader.GetString(0);
                    }
                }
                else
                {
                    sFullClubName = "Team Not Found";
                }
                reader.Close();
                return sFullClubName;
            }
        }
        public static string GetCoachName(SqlConnection connection, string psCoachId)
        {
            // This function returns the name of the coach with the qcc value given
            using (connection)
            {
                string sMeetName = "";
                SqlCommand command = new SqlCommand(
                  "SELECT rtrim([First]) + ' ' + rtrim([Last]) as 'Coachname' FROM tCoaches where qcc = '" + psCoachId + "' ;",
                  connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    { sMeetName = reader.GetString(0); }
                }
                else
                { sMeetName = "No Coach"; }
                reader.Close();
                return sMeetName;
            }
        }
        public static string GetPaddlerName(SqlConnection connection, string psPaddlerID)
        {
            // This function returns the name of the coach with the qcc value given
            using (connection)
            {
                string sPaddlerName = "";
                SqlCommand command = new SqlCommand(
                  "select firstName +' '+lastName 'PaddlerName' from [th2013_Paddlers] where [id]= '" + psPaddlerID + "' ;",
                  connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    { sPaddlerName = reader.GetString(0); }
                }
                else
                { sPaddlerName = "No Paddler"; }
                reader.Close();
                return sPaddlerName;
            }
        }
        public static string GetMeetName(SqlConnection connection, string psMeetId)
        {
            using (connection)
            {
                string sMeetName = "";
                SqlCommand command = new SqlCommand(
                  "SELECT meetName FROM tMeets where meetid = '" + psMeetId + "' ;",
                  connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sMeetName = reader.GetString(0);
                    }
                }
                else
                {
                    sMeetName = "Meet Not Found";
                }
                reader.Close();
                return sMeetName;
            }
        }
        public static string GetMeetName(SqlConnection connection, string psMeetId, ref string pretLocation)
        {
            using (connection)
            {
                string sMeetName = "";
                string sMeetLocation = "";
                SqlCommand command = new SqlCommand(
                  "SELECT meetName, Location FROM tMeets where meetid = '" + psMeetId + "' ;",
                  connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sMeetName = reader.GetString(0);
                        sMeetLocation = reader.GetString(1);
                    }
                }
                else
                {
                    sMeetName = "Meet Not Found";
                }
                reader.Close();
                pretLocation = sMeetLocation;
                return sMeetName;
            }
        }
        public static string GetEventName(SqlConnection connection, string psEventID, string psMeetId, ref int pretiSeats, ref string pretsCompetition)
        {
            // This function returns the name of the Event with the eventId given, and returns th number of seats in boat (1,2,3)
            using (connection)
            {
                string sEventName = "";
                string sSeats ="";
                string sCompetition = "";
                SqlCommand command = new SqlCommand(
                  "select [name] 'EventName', SUBSTRING(competitionId,2,1) 'Seats' , competitionId from tEvents where EventsId= '" + psEventID + "'and meetId='" + psMeetId + "' ;",
                  connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    { sEventName = reader.GetString(0);

                        sSeats = reader.GetString(1);
                        int n =-1;
                        bool isNumeric = int.TryParse(sSeats, out n);
                        if (isNumeric)
                        {
                            pretiSeats = n;
                        }
                        else
                        { pretiSeats = -1; }
                        sCompetition = reader.GetString(2);
                    }
                }
                else
                { 
                    sEventName = "No Paddler";
                    sCompetition = "";
                    pretiSeats = -1;
                }
                pretsCompetition = sCompetition;
                reader.Close();
                return sEventName;
            }
        }
        public static int Save_PaddlerEntry(SqlConnection connection, string psMeetId, string psPaddlerID, string psEventID, string psBoatName, ref string pretsErr)
        {
            //Saves a paddlers entry in the given event
            int retVal = 0;
            string steamboat = psBoatName;
            string sPaddlerID = psPaddlerID;
            string sEventNum = psEventID;
            string smeetid = psMeetId;
                try
                {
                    // Attempts to Add/Remove an Entry Record for this paddler, in this event, in this Meet
                    pretsErr = "";

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        if(connection != null && connection.State == ConnectionState.Closed){ connection.Open();}
                        cmd.Connection = connection;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "sp_idEntry";
                        cmd.Parameters.Add(new SqlParameter("@MeetID", SqlDbType.VarChar, 50));
                        cmd.Parameters.Add(new SqlParameter("@bEnterPaddler", SqlDbType.Bit, 0));
                        cmd.Parameters.Add(new SqlParameter("@personId", SqlDbType.VarChar, 50));
                        cmd.Parameters.Add(new SqlParameter("@eventId", SqlDbType.VarChar, 50));
                        cmd.Parameters.Add(new SqlParameter("@boatgroup", SqlDbType.VarChar, 10));
                        cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;
                        cmd.Parameters["@MeetID"].Value = smeetid; 
                        cmd.Parameters["@bEnterPaddler"].Value = true.ToString();
                        cmd.Parameters["@personId"].Value = sPaddlerID.Trim();
                        cmd.Parameters["@eventId"].Value = sEventNum.Trim();
                        cmd.Parameters["@boatgroup"].Value = steamboat.Trim().Length > 1 ? steamboat.Trim() : " ";
                        cmd.ExecuteNonQuery();
                        retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                    }
                    
                    if (retVal == 2)
                    {
                        pretsErr = String.Format("Failed to remove entry for {0} in Event {1} ", sPaddlerID, sEventNum);
                    }
                    if (retVal == 3)
                    {
                        pretsErr = String.Format("Entry for {0} in Event {1} already exists ", sPaddlerID, sEventNum);
                    }

                }
                catch (Exception excp)
                {
                    retVal = 1;
                    pretsErr = String.Format("Entry not updated - {0}", excp.Message);
                }

                return retVal;
        }
        public static int Delete_PaddlerEntry(SqlConnection connection, string psMeetId, string psPaddlerID, string psEventID,  ref string pretsErr)
        {
            //Saves a paddlers entry in the given event
            int retVal = 0;  //success
            string sPaddlerID = psPaddlerID;
            string sEventNum = psEventID;
            string smeetid = psMeetId;
            try
            {
                // Attempts to Add/Remove an Entry Record for this paddler, in this event, in this Meet
                pretsErr = "";

                using (SqlCommand cmd = new SqlCommand())
                {
                    if (connection != null && connection.State == ConnectionState.Closed) { connection.Open(); }
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_idEntry";
                    cmd.Parameters.Add(new SqlParameter("@MeetID", SqlDbType.VarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@bEnterPaddler", SqlDbType.Bit, 0));
                    cmd.Parameters.Add(new SqlParameter("@personId", SqlDbType.VarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@eventId", SqlDbType.VarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@boatgroup", SqlDbType.VarChar, 10));
                    cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters["@MeetID"].Value = smeetid;
                    cmd.Parameters["@bEnterPaddler"].Value = false.ToString();  // This is directive to delete
                    cmd.Parameters["@personId"].Value = sPaddlerID.Trim();
                    cmd.Parameters["@eventId"].Value = sEventNum.Trim();
                    cmd.Parameters["@boatgroup"].Value = " ";
                    cmd.ExecuteNonQuery();
                    retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                }

                if (retVal == 2)
                {
                    pretsErr = String.Format("Failed to remove entry for {0} in Event {1} ", sPaddlerID, sEventNum);
                }
                if (retVal == 3)
                {
                    pretsErr = String.Format("Entry for {0} in Event {1} already exists ", sPaddlerID, sEventNum);
                }

            }
            catch (Exception excp)
            {
                retVal = 1;
                pretsErr = String.Format("Entry not updated - {0}", excp.Message);
            }

            return retVal;
        }

        public static int Drop_BoatCoPaddlers(SqlConnection connection, string psMeetId, string psEventID, string psTeamId, string psPaddlerID, ref string pretsErr)
        {
            //Saves a paddlers entry in the given event -- string sMeetID, string sEventId, string sTeamID, string sPersonId
            int retVal = 0;
            string sTeamId = psTeamId;
            string sPersonId = psPaddlerID;
            string sEventId = psEventID;
            string sMeetID = psMeetId;
            try
            {
                // Attempts to Add/Remove an Entry Record for this paddler, in this event, in this Meet
                pretsErr = "";

                using (SqlCommand cmd = new SqlCommand())
                {
                    if (connection != null && connection.State == ConnectionState.Closed) { connection.Open(); }
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_uDropBoatCoPaddlers";
                    cmd.Parameters.Add(new SqlParameter("@meetId", SqlDbType.VarChar, 25));
                    cmd.Parameters.Add(new SqlParameter("@EventId", SqlDbType.VarChar, 25));
                    cmd.Parameters.Add(new SqlParameter("@teamId", SqlDbType.VarChar, 25));
                    cmd.Parameters.Add(new SqlParameter("@PersonId", SqlDbType.VarChar, 25));
                    cmd.Parameters.Add("@pIntErrDescOut", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters["@meetId"].Value = sMeetID.Trim();
                    cmd.Parameters["@EventId"].Value = sEventId.Trim();
                    cmd.Parameters["@teamId"].Value = sTeamId.Trim();
                    cmd.Parameters["@PersonId"].Value = sPersonId.Trim(); cmd.ExecuteNonQuery();
                    retVal = (int)cmd.Parameters["@pIntErrDescOut"].Value;
                }

                if (retVal == 0)
                {
                    pretsErr = String.Format("Failed to remove copaddlers for {0} in Event {1} ", sPersonId, sEventId);
                }
                else
                {
                    pretsErr = String.Format("Removed {2} co-paddlers of {0} in Event {1} already exists ", sPersonId, sEventId, retVal.ToString());
                }

            }
            catch (Exception excp)
            {
                retVal = -1;
                pretsErr = String.Format("No Entryupdated: unexpected error - {0}", excp.Message);
            }

            return retVal;
        }

        public static int Get3TierInvoiceCounts(SqlConnection connection, string psMeetId, string psTeamId, string psAge, ref int pretInvoiceID, ref int retiMastersPara, ref int retiPartial, ref int retiFull, ref string retsTotalFees)
        {
             //Retrievs Fees counts for 3 Tier Accounting
            int retVal = 0;
            string sTeamId = psTeamId;
            string sAge = psAge;
            string sMeetID = psMeetId;
            string pretsErr="";
            Random rnd = new Random();
            int iInvoiceID = rnd.Next(1, 100000); // creates a number between 1 and 100000

            int iMastersPara = 0;
            int iPartial = 0;   // padlers who do less than threshold number of events pay less
            int iFull = 0;
            string sTotalEntryFee = "";
            string sEntrantCategory = "";
            string sNumberPaddlers = "0";
            string sIndividualEntryFee = "@ $0.00";
            string sEntryFees = "$0.00";

            try
            {
                // Attempts to Add/Remove an Entry Record for this paddler, in this event, in this Meet
                pretsErr = "";

                using (SqlCommand cmd = new SqlCommand())
                {
                    if (connection != null && connection.State == ConnectionState.Closed) { connection.Open(); }
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sTeamPayments3Tier";
                    cmd.Parameters.Add(new SqlParameter("@MeetId", SqlDbType.VarChar, 20));
                    cmd.Parameters.Add(new SqlParameter("@TeamId", SqlDbType.VarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@Age", SqlDbType.VarChar, 25));
                    cmd.Parameters["@MeetId"].Value = sMeetID.Trim();
                    cmd.Parameters["@teamId"].Value = sTeamId.Trim();
                    cmd.Parameters["@Age"].Value = sAge.Trim(); 
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            sEntrantCategory = reader.GetString(0);
                            sNumberPaddlers = reader.GetValue(1).ToString();
                            sIndividualEntryFee = reader.GetString(2);
                            sEntryFees = reader.GetString(3);
                            //NAT15
                            if (sEntrantCategory == "ParaCanoeists or Masters") { iMastersPara = Convert.ToInt32(sNumberPaddlers); }
                            if (sEntrantCategory == "Juniors/Seniors 1-3") { iPartial = Convert.ToInt32(sNumberPaddlers); }
                            if (sEntrantCategory == "Junior/senior Full") { iFull = Convert.ToInt32(sNumberPaddlers); }
                            if (sEntrantCategory == "Totals") { sTotalEntryFee = sEntryFees; }
                            //NT16
                            if (sEntrantCategory == "Paddlers in 4 or more events") { iFull = Convert.ToInt32(sNumberPaddlers); }
                            if (sEntrantCategory == "Paddlers with 1-3 Events") { iPartial = Convert.ToInt32(sNumberPaddlers); }
                            if (sEntrantCategory == "Totals") { sTotalEntryFee = sEntryFees; }
                           
                        
                        }
                        pretInvoiceID = iInvoiceID;
                        retiMastersPara = iMastersPara;
                        retiPartial = iPartial;
                        retiFull = iFull;
                        retsTotalFees = sTotalEntryFee;
                    }
                    else
                    {
                        iInvoiceID = 0;
                        retVal = -2;
                    }

                }

   
            }
            catch (Exception excp)
            {
                retVal = -1;
                pretsErr = String.Format("3 Tier Team Invoice Calc Failed: unexpected error - {0}", excp.Message);
            }

            return retVal;

        }

        public static int Insert3TierInvoiceRecords(SqlConnection connection, string psMeetId, string psTeamId, string psAge, int piFull , int piPartial, int piSpecial, string psTotalFees)
        {
            //Saves invoice data for 3 Tier Accounting
            int retVal = 0;
            string sTeamId = psTeamId;
            string sAge = psAge;
            string sMeetID = psMeetId;
            string pretsErr = "";
            Random rnd = new Random();  // In case of logging failure, we won't stop redirect
            int iInvoiceID = rnd.Next(1, 100000); // creates a number between 1 and 100000
            string sInvoiceNumber = "";
            int iSpecial = piSpecial;
            int iPartial = piPartial;   // padlers who do less than threshold number of events pay less
            int iFull = piFull;
            string sTotalEntryFee = psTotalFees;
            string sNote = "saved via Insert3TierInvoiceRecords method";
 
            try
            {
                // Attempts to Add/Remove an Entry Record for this paddler, in this event, in this Meet
                pretsErr = "";

                using (SqlCommand cmd = new SqlCommand())
                {
                    if (connection != null && connection.State == ConnectionState.Closed) { connection.Open(); }
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_iTeamInvoice";
                    cmd.Parameters.Add(new SqlParameter("@MeetId", SqlDbType.VarChar, 20));
                    cmd.Parameters.Add(new SqlParameter("@TeamId", SqlDbType.VarChar, 50));
                    cmd.Parameters.Add(new SqlParameter("@AgeFilter", SqlDbType.VarChar, 25));
                    cmd.Parameters.Add(new SqlParameter("@FullCount", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@PartialCount", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@SpecialCount", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@TotalFees", SqlDbType.Money));
                    cmd.Parameters.Add(new SqlParameter("@Note", SqlDbType.VarChar, 255));
                    cmd.Parameters.Add(new SqlParameter("@InvoiceNumber", SqlDbType.BigInt)).Direction=ParameterDirection.Output;
                    cmd.Parameters["@MeetId"].Value = sMeetID.Trim();
                    cmd.Parameters["@teamId"].Value = sTeamId.Trim();
                    cmd.Parameters["@AgeFilter"].Value = sAge.Trim();
                    cmd.Parameters["@FullCount"].Value = iFull;
                    cmd.Parameters["@PartialCount"].Value = iPartial;
                    cmd.Parameters["@SpecialCount"].Value = iSpecial;
                    cmd.Parameters["@TotalFees"].Value = sTotalEntryFee;
                    cmd.Parameters["@Note"].Value = sNote.Trim();
                    retVal =  cmd.ExecuteNonQuery();
                    sInvoiceNumber = cmd.Parameters["@InvoiceNumber"].Value.ToString();
                    try { retVal = Convert.ToInt32(sInvoiceNumber); }
                    catch { retVal = iInvoiceID; }
                }
                
                return retVal;  //should be the invoice number
            }
            catch (Exception excp)
            {
                retVal = -1;
                pretsErr = String.Format("3 Tier Team Invoice Save Failed: unexpected error - {0}", excp.Message);
            }

            return retVal;

        }
    }
}
