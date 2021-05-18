using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.Script.Services;

/// <summary>
/// Summary description for EmployeeService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class EmployeeService : System.Web.Services.WebService
{

    public EmployeeService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public Boolean AddEmployee(Employee emp)
    {
        bool result = false;
        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("spAddNewEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Name",
                Value = emp.Name
            });
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Gender",
                Value = emp.Gender
            });
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Phone",
                Value = emp.Phone
            });
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Email",
                Value = emp.Email
            });
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Age",
                Value = emp.Age
            });
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@Salary",
                Value = emp.Salary
            });

            if (!string.IsNullOrEmpty(emp.Name) && !string.IsNullOrEmpty(emp.Email))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                result = true;
            }
        }

        return result;
    }

    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = true, ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
    public string GetAllEmployees()
    {
        List<Employee> listEmployee = new List<Employee>();
        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("spGetEmployees", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Employee employee = new Employee();
                employee.ID = Convert.ToInt32(rdr["ID"]);
                employee.Name = rdr["Name"].ToString();
                employee.Gender = Convert.ToString(rdr["Gender"]).Trim() != "-1" ? rdr["Gender"].ToString() : string.Empty;
                employee.Phone = rdr["Phone"].ToString();
                employee.Email = rdr["Email"].ToString();
                employee.Age = rdr["Age"].ToString();
                //employee.Age = Convert.ToInt32(rdr["Age"]);
                employee.Salary = rdr["Salary"].ToString();

                listEmployee.Add(employee);
            }
        }
        //JavaScriptSerializer js = new JavaScriptSerializer();
        //Context.Response.Write(js.Serialize(listEmployee));
        return (new JavaScriptSerializer()).Serialize(listEmployee);
    }

}
