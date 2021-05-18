<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="employee.js"></script>
    <%-- <script type="text/Javascript">  
        $(document).ready(function () {
            resetForms();
        });

        function resetForms() {
            document.forms['form1'].reset();
        }
    </script> --%>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container py-3">
            <h4 class="text-center text-uppercase">WELCOME TO BELL</h4>
            <div class="card">
                <div class="card-header bg-danger text-white">
                    <h5 class="card-title text-uppercase">Employee Information</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Name</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="redName" ControlToValidate="txtName" ErrorMessage="Please enter Name" ForeColor="red" ValidationGroup="form" Display="Dynamic" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Gender</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="custom-select">
                                        <asp:ListItem Value="-1">Choose Gender</asp:ListItem>
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Phone Number</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-phone"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator runat="server" ID="regPhone"
                                        ControlToValidate="txtPhone" ValidationExpression="^\d+$"
                                        ErrorMessage="Please Enter Numbers Only" Display="Dynamic" SetFocusOnError="True" ForeColor="red" ValidationGroup="form" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" AutoCompleteType="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="reqEmail" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="Please enter Email" ForeColor="red" ValidationGroup="form" />
                                    <asp:RegularExpressionValidator ID="regEmail" runat="server" ValidationGroup="form" Display="Dynamic"
                                        ErrorMessage="Please enter valid Email" ControlToValidate="txtEmail"
                                        SetFocusOnError="True" ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Age</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtAge" MaxLength="3" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator runat="server" ID="regAge"
                                        ControlToValidate="txtAge" ValidationExpression="^\d+$"
                                        ErrorMessage="Please Enter Numbers Only" Display="Dynamic" SetFocusOnError="True" ForeColor="red" ValidationGroup="form" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Salary</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">$</span>
                                    </div>
                                    <asp:TextBox ID="txtSalary" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btnAddEmployee" CausesValidation="true" ValidationGroup="form" CssClass="btn btn-danger rounded-0" runat="server" Text="Submit" />
                    <p id="msg" style="display: none">Saved</p>

                </div>
            </div>
            <table id="employee" class="table table-bordered" style="margin-top: 10px;">
                <thead class="bg-danger text-center text-white">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Age</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </form>
</body>
</html>
