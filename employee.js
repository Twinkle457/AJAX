$(document).ready(function () {
    var employee = {};
    reset();
    getAllEmployees();

    $("#btnAddEmployee").click(function () {
        employee.Name = $('#txtName').val();
        employee.Gender = $('#ddlGender').val();
        employee.Phone = $('#txtPhone').val();
        employee.Email = $('#txtEmail').val();
        employee.Age = $('#txtAge').val();
        employee.Salary = $('#txtSalary').val();

        if (typeof (Page_ClientValidate) == 'function') {
            Page_ClientValidate("form");
            if (Page_IsValid == true) {
                $.ajax({
                    url: 'EmployeeService.asmx/AddEmployee',
                    method: 'post',
                    data: '{emp: ' + JSON.stringify(employee) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        if (data.d) {
                            alert("Congratulation!!..Data inserted successfully");
                            getAllEmployees();
                            reset();
                        }

                        console.log(data);
                    },

                    error: function (err) {
                        console.log(err);
                    }
                });
            }
        } else {
            if ($(this).valid()) {
                alert('the form is valid');
            }
        }        
    });

    function reset() {
        $(':input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
        $('select').each(function () { $(this).get(0).options[0].selected = true; }); 
    }

    function getAllEmployees() {
       
        $.ajax({            
            url: 'EmployeeService.asmx/GetAllEmployees',
            dataType: "json",            
            method: 'get',
            contentType: "application/json; charset=utf-8",
            success: function (employees) {
                var jsonobj = eval('(' + employees.d + ')');
                var employeeTable = $('#employee tbody');
                employeeTable.empty();

                $(jsonobj).each(function (index, emp) {
                    employeeTable.append('<tr><td>' + emp.ID + '</td><td>'
                        + emp.Name + '</td><td>' + emp.Gender + '</td><td>'
                        + emp.Phone + '</td><td>' + emp.Email + '</td><td>'
                        + emp.Age + '</td><td>' + emp.Salary + '</td></tr>');
                }

                );
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
});  