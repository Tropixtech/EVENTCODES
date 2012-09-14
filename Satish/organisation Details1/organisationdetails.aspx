<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="organisationdetails.aspx.cs" Inherits="organisationdetails" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="countries.js" type="text/javascript"></script>
  <style type="text/css">
        .style1
        {
            width: 623px;
        }
        .style2
        {
            width: 872px;
            height: 70px;
            font-family: Tahoma;
            font-size: xx-large;
        }
        .style6
        {
      }
        .style7
        {
            width: 182px;
        }
      #country
      {
          height: 23px;
          width: 145px;
      }
      .style9
      {
          color: #CC0000;
      }
      #form1
      {
          height: 562px;
          width: 920px;
      }
      .style11
      {
          font-family: Tahoma;
      }
      .style12
      {
    }
      .style15
      {
          font-family: Tahoma;
          width: 155px;
      }
      .style18
      {
          width: 26px;
      }
      .style19
      {
          width: 202px;
      }
      .style20
      {
          width: 60px;
          font-family: Tahoma;
      }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
     <form id="form1" runat="server">
<asp:Panel ID="Panel1" runat="server" Height="557px" Width="921px" BackColorr="#CCFF99"
        BorderColor="#CCFF99" BackColor="#CCFF99">
                <table>
            <tr>
                <td align="center" class="style2">
                    Organization Details</td>
            </tr>
        </table>
        <br />
        <table align="center" cellspacing="1" class="style1">
            <tr>
                <td class="style12" align="center" colspan="5">
                    <asp:Label ID="Label14" runat="server" Text="od_id "></asp:Label>
                    <asp:Label ID="Label15" runat="server" Text="ud_id"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="style18">
                </td>
                <td class="style11" colspan="2">
                    Organization Name</td>
                <td class="style19">
                    <asp:TextBox ID="txtOrgname" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label1" runat="server" CssClass="style22" style="color: #CC0000" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Organization Type</td>
                <td class="style19">
                    <asp:DropDownList ID="ddOrgtype" runat="server" Height="23px" Width="145px">
                    <asp:ListItem>Select type</asp:ListItem>
                        <asp:ListItem>Bank</asp:ListItem>
                        <asp:ListItem>cooperatives</asp:ListItem>
                        <asp:ListItem>corporation</asp:ListItem>
                        <asp:ListItem>Foundation &amp; Charities</asp:ListItem>
                        <asp:ListItem>Government</asp:ListItem>
                        <asp:ListItem>International organizations</asp:ListItem>
                        <asp:ListItem>Partnerships</asp:ListItem>
                        <asp:ListItem>Private Limited</asp:ListItem>
                        <asp:ListItem>Public Limited</asp:ListItem>
                        <asp:ListItem>Universities</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style7">
                    <asp:Label ID="Label9" runat="server" Text="Label" CssClass="style9"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Industry</td>
                <td class="style21" colspan="2">
                    <asp:DropDownList ID="ddIndustry" runat="server" Height="23px" Width="300px">
                    <asp:ListItem>Select industry</asp:ListItem>
                        <asp:ListItem>Accounting, Auditors, Tax & Bookkeepers</asp:ListItem>
                        <asp:ListItem>Advertising & Public Relations</asp:ListItem>
                        <asp:ListItem>Agriculture Products & Services</asp:ListItem>
                        <asp:ListItem>Airlines, Aviation Services / Supplies</asp:ListItem>
                        <asp:ListItem>Apparel / Accessories / Textiles</asp:ListItem>
                        <asp:ListItem>Architectural, Engineering & Technical</asp:ListItem>
                        <asp:ListItem>Banking & Financial Services</asp:ListItem>
                        <asp:ListItem>Beverages, Alcoholic & Non-alcoholic</asp:ListItem>
                        <asp:ListItem>Building Systems / Materials / Fixtures</asp:ListItem>
                        <asp:ListItem>Business Consultancy & Advisory</asp:ListItem>
                        <asp:ListItem>Computer & IT Products & Services</asp:ListItem>
                        <asp:ListItem>Construction General</asp:ListItem>
                        <asp:ListItem>Education & Training</asp:ListItem>
                        <asp:ListItem>Entertainment & Recreation</asp:ListItem>
                        <asp:ListItem>Environmental Products & Services</asp:ListItem>
                        <asp:ListItem>Executive Search & Personnel Recruitment</asp:ListItem>                        
                        <asp:ListItem> Farm Equipment</asp:ListItem>
                        <asp:ListItem>Food Manufacturing / Distribution / Services</asp:ListItem>
                        <asp:ListItem>Freight Forwarders / Couriers</asp:ListItem>
                        <asp:ListItem>Gases, Natural & Processed</asp:ListItem>
                        <asp:ListItem>Hospitals</asp:ListItem>
                        <asp:ListItem>Hotels / Restaurants / Caterers</asp:ListItem>
                        <asp:ListItem>Industrial Equipment</asp:ListItem>
                        <asp:ListItem>Information & Communications Technology</asp:ListItem>
                        <asp:ListItem>Inspection, Safety & Security</asp:ListItem>
                        <asp:ListItem>Insurance</asp:ListItem>
                        <asp:ListItem>Manufacturing - Automotive</asp:ListItem>
                        <asp:ListItem>Manufacturing - Consumer</asp:ListItem>
                        <asp:ListItem>Manufacturing - Electronics</asp:ListItem>
                        <asp:ListItem>Manufacturing - Industrial</asp:ListItem>                        
                        <asp:ListItem>Manufacturing -Chemical Elements & Allied Products</asp:ListItem>
                        <asp:ListItem>Marketing & Communications</asp:ListItem>
                        <asp:ListItem>Outplacement Services</asp:ListItem>
                        <asp:ListItem>Petroleum & Petroleum Products</asp:ListItem>
                        <asp:ListItem>Pharmaceutical & Medicinal Products</asp:ListItem>
                        <asp:ListItem>Power & Electrical</asp:ListItem>
                        <asp:ListItem>Printing & Publishing</asp:ListItem>
                        <asp:ListItem>Property & Real Estate Services</asp:ListItem>
                        <asp:ListItem>Retail Consumer Products</asp:ListItem>
                        <asp:ListItem>Schools</asp:ListItem>
                        <asp:ListItem>Scientific & Medical Instruments</asp:ListItem>
                        <asp:ListItem>Security, Investigative Services & Products</asp:ListItem>
                        <asp:ListItem>Sourcing, Trading & Buying</asp:ListItem>
                        <asp:ListItem>Transport Vehicles & Parts</asp:ListItem>
                        <asp:ListItem>Transportation & Logistics</asp:ListItem>
                        <asp:ListItem>Travel & Tourism</asp:ListItem>
                        <asp:ListItem>Valuation & Disposal</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label10" runat="server" style="color: #CC0000" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Country</td>
                <td class="style19">
                <%--country drop--%>
                                     
                    <asp:DropDownList ID="ddCountry" runat="server" Height="23px" 
                        onchange="print_state(this.selectedIndex);" Width="145px">
                    </asp:DropDownList>
                   <script language="javascript" type="text/jscript">

                       print_country("ddCountry");
                                         </script>
                                        <%-- <asp:DropDownList id="ddCountry" runat="server">
                                         <asp:ListItem >Select Country</asp:ListItem>
    <asp:ListItem >Afghanistan</asp:ListItem>
    <asp:ListItem >Albania</asp:ListItem>
    <asp:ListItem >Algeria</asp:ListItem>
    <asp:ListItem >American Samoa</asp:ListItem>
    <asp:ListItem >Andorra</asp:ListItem>
    <asp:ListItem >Angola</asp:ListItem>
    <asp:ListItem >Anguilla</asp:ListItem>
    <asp:ListItem >Antarctica</asp:ListItem>
    <asp:ListItem >Antigua And Barbuda</asp:ListItem>
    <asp:ListItem >Argentina</asp:ListItem>
    <asp:ListItem >Armenia</asp:ListItem>
    <asp:ListItem >Aruba</asp:ListItem>
    <asp:ListItem >Australia</asp:ListItem>
    <asp:ListItem >Austria</asp:ListItem>
    <asp:ListItem >Azerbaijan</asp:ListItem>
    <asp:ListItem >Bahamas</asp:ListItem>
    <asp:ListItem >Bahrain</asp:ListItem>
    <asp:ListItem >Bangladesh</asp:ListItem>
    <asp:ListItem >Barbados</asp:ListItem>
    <asp:ListItem >Belarus</asp:ListItem>
    <asp:ListItem >Belgium</asp:ListItem>
    <asp:ListItem >Belize</asp:ListItem>
    <asp:ListItem >Benin</asp:ListItem>
    <asp:ListItem >Bermuda</asp:ListItem>
    <asp:ListItem >Bhutan</asp:ListItem>
    <asp:ListItem >Bolivia</asp:ListItem>
    <asp:ListItem >Bosnia And Herzegowina</asp:ListItem>
    <asp:ListItem >Botswana</asp:ListItem>
    <asp:ListItem >Bouvet Island</asp:ListItem>
    <asp:ListItem >Brazil</asp:ListItem>
    <asp:ListItem >British Indian Ocean Territory</asp:ListItem>
    <asp:ListItem >Brunei Darussalam</asp:ListItem>
    <asp:ListItem >Bulgaria</asp:ListItem>
    <asp:ListItem >Burkina Faso</asp:ListItem>
    <asp:ListItem >Burundi</asp:ListItem>
    <asp:ListItem >Cambodia</asp:ListItem>
    <asp:ListItem >Cameroon</asp:ListItem>
    <asp:ListItem >Canada</asp:ListItem>
    <asp:ListItem >Cape Verde</asp:ListItem>
    <asp:ListItem >Cayman Islands</asp:ListItem>
    <asp:ListItem >Central African Republic</asp:ListItem>
    <asp:ListItem >Chad</asp:ListItem>
    <asp:ListItem >Chile</asp:ListItem>
    <asp:ListItem >China</asp:ListItem>
    <asp:ListItem >Christmas Island</asp:ListItem>
    <asp:ListItem >Cocos (Keeling) Islands</asp:ListItem>
    <asp:ListItem >Colombia</asp:ListItem>
    <asp:ListItem >Comoros</asp:ListItem>
    <asp:ListItem >Congo</asp:ListItem>
    <asp:ListItem >Cook Islands</asp:ListItem>
    <asp:ListItem >Costa Rica</asp:ListItem>
    <asp:ListItem >Cote D'Ivoire</asp:ListItem>
    <asp:ListItem >Croatia (Local Name: Hrvatska)</asp:ListItem>
    <asp:ListItem >Cuba</asp:ListItem>
    <asp:ListItem >Cyprus</asp:ListItem>
    <asp:ListItem >Czech Republic</asp:ListItem>
    <asp:ListItem >Denmark</asp:ListItem>
    <asp:ListItem >Djibouti</asp:ListItem>
    <asp:ListItem >Dominica</asp:ListItem>
    <asp:ListItem >Dominican Republic</asp:ListItem>
    <asp:ListItem >East Timor</asp:ListItem>
    <asp:ListItem >Ecuador</asp:ListItem>
    <asp:ListItem >Egypt</asp:ListItem>
    <asp:ListItem >El Salvador</asp:ListItem>
    <asp:ListItem >Equatorial Guinea</asp:ListItem>
    <asp:ListItem >Eritrea</asp:ListItem>
    <asp:ListItem >Estonia</asp:ListItem>
    <asp:ListItem >Ethiopia</asp:ListItem>
    <asp:ListItem >Falkland Islands (Malvinas)</asp:ListItem>
    <asp:ListItem >Faroe Islands</asp:ListItem>
    <asp:ListItem >Fiji</asp:ListItem>
    <asp:ListItem >Finland</asp:ListItem>
    <asp:ListItem >France</asp:ListItem>
    <asp:ListItem >French Guiana</asp:ListItem>
    <asp:ListItem >French Polynesia</asp:ListItem>
    <asp:ListItem >French Southern Territories</asp:ListItem>
    <asp:ListItem >Gabon</asp:ListItem>
    <asp:ListItem >Gambia</asp:ListItem>
    <asp:ListItem >Georgia</asp:ListItem>
    <asp:ListItem >Germany</asp:ListItem>
    <asp:ListItem >Ghana</asp:ListItem>
    <asp:ListItem>Gibraltar</asp:ListItem>
    <asp:ListItem >Greece</asp:ListItem>
    <asp:ListItem>Greenland</asp:ListItem>
    <asp:ListItem >Grenada</asp:ListItem>
    <asp:ListItem >Guadeloupe</asp:ListItem>
    <asp:ListItem >Guam</asp:ListItem>
    <asp:ListItem >Guatemala</asp:ListItem>
    <asp:ListItem >Guinea</asp:ListItem>
    <asp:ListItem >Guinea-Bissau</asp:ListItem>
    <asp:ListItem >Guyana</asp:ListItem>
    <asp:ListItem >Haiti</asp:ListItem>
    <asp:ListItem >Heard And Mc Donald Islands</asp:ListItem>
    <asp:ListItem >Holy See (Vatican City State)</asp:ListItem>
    <asp:ListItem >Honduras</asp:ListItem>
    <asp:ListItem >Hong Kong</asp:ListItem>
    <asp:ListItem >Hungary</asp:ListItem>
    <asp:ListItem >Icel And</asp:ListItem>
    <asp:ListItem >India</asp:ListItem>
    <asp:ListItem >Indonesia</asp:ListItem>
    <asp:ListItem >Iran (Islamic Republic Of)</asp:ListItem>
    <asp:ListItem >Iraq</asp:ListItem>
    <asp:ListItem >Ireland</asp:ListItem>
    <asp:ListItem >Israel</asp:ListItem>
    <asp:ListItem >Italy</asp:ListItem>
    <asp:ListItem >Jamaica</asp:ListItem>
    <asp:ListItem >Japan</asp:ListItem>
    <asp:ListItem >Jordan</asp:ListItem>
    <asp:ListItem >Kazakhstan</asp:ListItem>
    <asp:ListItem >Kenya</asp:ListItem>
    <asp:ListItem >Kiribati</asp:ListItem>
    <asp:ListItem >Korea, Dem People'S Republic</asp:ListItem>
    <asp:ListItem >Korea, Republic Of</asp:ListItem>
    <asp:ListItem >Kuwait</asp:ListItem>
    <asp:ListItem >Kyrgyzstan</asp:ListItem>
    <asp:ListItem >Lao People'S Dem Republic</asp:ListItem>
    <asp:ListItem >Latvia</asp:ListItem>
    <asp:ListItem >Lebanon</asp:ListItem>
    <asp:ListItem>Lesotho</asp:ListItem>
    <asp:ListItem >Liberia</asp:ListItem>
    <asp:ListItem >Libyan Arab Jamahiriya</asp:ListItem>
    <asp:ListItem >Liechtenstein</asp:ListItem>
    <asp:ListItem >Lithuania</asp:ListItem>
    <asp:ListItem >Luxembourg</asp:ListItem>
    <asp:ListItem Value="MO">Macau</asp:ListItem>
    <asp:ListItem Value="MK">Macedonia</asp:ListItem>
    <asp:ListItem Value="MG">Madagascar</asp:ListItem>
    <asp:ListItem Value="MW">Malawi</asp:ListItem>
    <asp:ListItem Value="MY">Malaysia</asp:ListItem>
    <asp:ListItem Value="MV">Maldives</asp:ListItem>
    <asp:ListItem Value="ML">Mali</asp:ListItem>
    <asp:ListItem Value="MT">Malta</asp:ListItem>
    <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
    <asp:ListItem Value="MQ">Martinique</asp:ListItem>
    <asp:ListItem Value="MR">Mauritania</asp:ListItem>
    <asp:ListItem Value="MU">Mauritius</asp:ListItem>
    <asp:ListItem Value="YT">Mayotte</asp:ListItem>
    <asp:ListItem Value="MX">Mexico</asp:ListItem>
    <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
    <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
    <asp:ListItem Value="MC">Monaco</asp:ListItem>
    <asp:ListItem Value="MN">Mongolia</asp:ListItem>
    <asp:ListItem Value="MS">Montserrat</asp:ListItem>
    <asp:ListItem Value="MA">Morocco</asp:ListItem>
    <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
    <asp:ListItem Value="MM">Myanmar</asp:ListItem>
    <asp:ListItem Value="NA">Namibia</asp:ListItem>
    <asp:ListItem Value="NR">Nauru</asp:ListItem>
    <asp:ListItem Value="NP">Nepal</asp:ListItem>
    <asp:ListItem Value="NL">Netherlands</asp:ListItem>
    <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
    <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
    <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
    <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
    <asp:ListItem Value="NE">Niger</asp:ListItem>
    <asp:ListItem Value="NG">Nigeria</asp:ListItem>
    <asp:ListItem Value="NU">Niue</asp:ListItem>
    <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
    <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
    <asp:ListItem Value="NO">Norway</asp:ListItem>
    <asp:ListItem Value="OM">Oman</asp:ListItem>
    <asp:ListItem Value="PK">Pakistan</asp:ListItem>
    <asp:ListItem Value="PW">Palau</asp:ListItem>
    <asp:ListItem Value="PA">Panama</asp:ListItem>
    <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
    <asp:ListItem Value="PY">Paraguay</asp:ListItem>
    <asp:ListItem Value="PE">Peru</asp:ListItem>
    <asp:ListItem Value="PH">Philippines</asp:ListItem>
    <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
    <asp:ListItem Value="PL">Poland</asp:ListItem>
    <asp:ListItem Value="PT">Portugal</asp:ListItem>
    <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
    <asp:ListItem Value="QA">Qatar</asp:ListItem>
    <asp:ListItem Value="RE">Reunion</asp:ListItem>
    <asp:ListItem Value="RO">Romania</asp:ListItem>
    <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
    <asp:ListItem Value="RW">Rwanda</asp:ListItem>
    <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
    <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
    <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
    <asp:ListItem Value="WS">Samoa</asp:ListItem>
    <asp:ListItem Value="SM">San Marino</asp:ListItem>
    <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
    <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
    <asp:ListItem Value="SN">Senegal</asp:ListItem>
    <asp:ListItem Value="SC">Seychelles</asp:ListItem>
    <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
    <asp:ListItem Value="SG">Singapore</asp:ListItem>
    <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
    <asp:ListItem Value="SI">Slovenia</asp:ListItem>
    <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
    <asp:ListItem Value="SO">Somalia</asp:ListItem>
    <asp:ListItem Value="ZA">South Africa</asp:ListItem>
    <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
    <asp:ListItem Value="ES">Spain</asp:ListItem>
    <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
    <asp:ListItem Value="SH">St. Helena</asp:ListItem>
    <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
    <asp:ListItem Value="SD">Sudan</asp:ListItem>
    <asp:ListItem Value="SR">Suriname</asp:ListItem>
    <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
    <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
    <asp:ListItem Value="SE">Sweden</asp:ListItem>
    <asp:ListItem Value="CH">Switzerland</asp:ListItem>
    <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
    <asp:ListItem Value="TW">Taiwan</asp:ListItem>
    <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
    <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
    <asp:ListItem Value="TH">Thailand</asp:ListItem>
    <asp:ListItem Value="TG">Togo</asp:ListItem>
    <asp:ListItem Value="TK">Tokelau</asp:ListItem>
    <asp:ListItem Value="TO">Tonga</asp:ListItem>
    <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
    <asp:ListItem Value="TN">Tunisia</asp:ListItem>
    <asp:ListItem Value="TR">Turkey</asp:ListItem>
    <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
    <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
    <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
    <asp:ListItem Value="UG">Uganda</asp:ListItem>
    <asp:ListItem Value="UA">Ukraine</asp:ListItem>
    <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
    <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
    <asp:ListItem Value="US">United States</asp:ListItem>
    <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
    <asp:ListItem Value="UY">Uruguay</asp:ListItem>
    <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
    <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
    <asp:ListItem Value="VE">Venezuela</asp:ListItem>
    <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
    <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
    <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
    <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
    <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
    <asp:ListItem Value="YE">Yemen</asp:ListItem>
    <asp:ListItem Value="YU">Yugoslavia</asp:ListItem>
    <asp:ListItem Value="ZR">Zaire</asp:ListItem>
    <asp:ListItem Value="ZM">Zambia</asp:ListItem>
    <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
</asp:DropDownList>--%>

                </td>
                <td class="style7">
              
                   

                    <asp:Label ID="Label11" runat="server" Text="Label" style="color: #CC0000"></asp:Label>
              
                   

                </td>
            </tr>
            <tr>
                <td class="style18">
                    </td>
                <td class="style11" colspan="2">
                    State</td>
                <td class="style19">
                    <asp:DropDownList ID="ddState" runat="server" Height="23px" Width="145px">
                    </asp:DropDownList>
                </td>
                <td class="style7">
              
                    <asp:Label ID="Label12" runat="server" Text="Label" style="color: #CC0000"></asp:Label>
              
                    </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    City</td>
                <td class="style19">
                    <asp:TextBox ID="txtCity" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label7" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style15">
                    Address</td>
                <td class="style20">
                    Line 1:</td>
                <td class="style19">
                    <asp:TextBox ID="txtAddress1" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label2" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td class="style20">
                    Line2:</td>
                <td class="style19">
                    <asp:TextBox ID="txtAddress2" runat="server" Height="23px" Width="145px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Zip-code</td>
                <td class="style19">
                    <asp:TextBox ID="txtZipcode" runat="server" Height="23px" Width="145px" 
                        MaxLength="6"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label4" runat="server" CssClass="style22" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtZipcode" ErrorMessage="*enter a valid zipcode" 
                        ValidationExpression="^([1-9])([0-9]){5}$" CssClass="style9"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    </td>
                <td class="style11" colspan="2">
                    Contact No.</td>
                <td class="style19">
                    <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="35px"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" Height="23px" MaxLength="4" 
                        Width="35px"></asp:TextBox>
                    <asp:TextBox ID="txtcontactno" runat="server" Height="23px" Width="83px" 
                        MaxLength="15"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label5" runat="server" CssClass="style22" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtcontactno" ErrorMessage="*enter a valid phone no." 
                        ValidationExpression="^([7-9]{1})([0-9]{9})$" CssClass="style9"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11" colspan="2">
                    Website</td>
                <td class="style19">
                    <asp:TextBox ID="txtWebsite" runat="server" Height="23px" Width="145px">http://www.</asp:TextBox>
                </td>
                <td class="style7">
                    <asp:Label ID="Label6" runat="server" CssClass="style28" Text="Label" 
                        style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style6" colspan="4" align="center">
                    <asp:Label ID="Label13" runat="server" style="color: #CC0000" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style6" align="right" colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" onclick="Button1_Click" Text="Submit" 
                        Height="28px" Width="118px" />
                </td>
                <td class="style19">
                     
                    
                     
                    <asp:Button ID="btnReset" runat="server" onclick="Button2_Click" Text="Reset" 
                        Height="28px" Width="118px" />
                     
                    
                     
                </td>
                <td class="style7">
                    <asp:Label ID="Label8" runat="server" Text="Label" style="color: #CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style6" colspan="2">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style7">
                    &nbsp;</td>
            </tr>
        </table>
                </asp:Panel>
                </form>
</asp:Content>

