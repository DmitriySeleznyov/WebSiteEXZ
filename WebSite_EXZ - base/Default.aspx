﻿<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ" Language="C#" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v18.1" namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <title></title>

  <script type="text/javascript" src="scripts/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="scripts/jquery.countTo.js"></script>

</head>

<body>
    <form id="form1" runat="server">

<script type="text/javascript">
    jQuery(function ($) {
        // custom formatting example
        $('#object').data('countToOptions', {
            formatter: function (value, options) {
                return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
            }
        });

        // start all the timers
        $('.timer').each(count);

        // restart a timer when a button is clicked
        $('.restart').click(function (event) {
            event.preventDefault();
            var target = $(this).data('target');
            $(target).countTo('restart');
        });

        function count(options) {
            var $this = $(this);
            options = $.extend({}, options || {}, $this.data('countToOptions') || {});
            $this.countTo(options);
        }
    });
  </script>

    <div class="header">
            <div id="logo" >
            </div>
            <div class="title" >
            </div>
            <div id="login" style="float: right; padding: 20px 15px">
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Вход" 
                    NavigateUrl="~/Default.aspx#startbox" Target="_self" Font-Size="Large">
                </dx:ASPxHyperLink>    
            </div>
    </div> 


     <div class="header_text" id="Div2" >
            <br />
     		  Система дистанционного мониторинга и управления эхз
            <br />     
            <br />     
     </div>
     <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" 
        BinaryImageCacheFolder="~\Thumb\" Height="654px" Width="100%" 
        BackColor="#EBEBEB">
         <settingsslideshow autoplay="True" />
         <settingsimagearea animationtype="Fade" imagesizemode="FillAndCrop" />
         <settingsnavigationbar mode="Dots" />
<SettingsImageArea ImageSizeMode="FillAndCrop" AnimationType="Fade" 
             animationduration="600" itemtextvisibility="Always"></SettingsImageArea>

<SettingsNavigationBar Mode="Dots"></SettingsNavigationBar>

         <settingsbehavior imageloadmode="DynamicLoadAndCache" />

<SettingsBehavior ImageLoadMode="DynamicLoadAndCache"></SettingsBehavior>

<SettingsSlideShow AutoPlay="True" interval="8000"></SettingsSlideShow>
         <Items>
             <dx:ImageSliderItem ImageUrl="~/Images/Slider/slider1.jpg" 
                 Text="">
             </dx:ImageSliderItem>
             <dx:ImageSliderItem ImageUrl="~/Images/Slider/slider2.jpg" 
                 Text="">
             </dx:ImageSliderItem>
             <dx:ImageSliderItem ImageUrl="~/Images/Slider/slider3.jpg" 
                 Text="">
             </dx:ImageSliderItem>
             <dx:ImageSliderItem ImageUrl="~/Images/Slider/slider4.jpg" 
                 Text="">
             </dx:ImageSliderItem>
             <dx:ImageSliderItem ImageUrl="~/Images/Slider/slider5.jpg" 
                 Text="">
             </dx:ImageSliderItem>
         </Items>
         <styles>
             <itemtextarea cssclass="slider_text" font-size="X-Large">
             </itemtextarea>
         </styles>
    </dx:ASPxImageSlider>

    <div class="section_gray" style="clear: left">
     <h2 class="section_title">вход для зарегистрированных пользователей</h2>
    <div id="startbox">
    <h2 class="title">
        Войти</h2>
    <br/>
    <table>
    <tr>
    <td>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" 
            RenderOuterTable="false" onloggedin="LoginUser_LoggedIn">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Введите имя пользователя и пароль</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Имя пользователя:</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                            ControlToValidate="UserName" CssClass="failureNotification" 
                            ErrorMessage="Поле ''Имя пользователя'' является обязательным" 
                            ToolTip="Поле ''Имя пользователя'' является обязательным" 
                            ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Поле ''Пароль'' является обязательным" ToolTip="Поле ''Пароль'' является обязательным" 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        &nbsp;</p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Сохранять состояние входа</asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Войти" ValidationGroup="LoginUserValidationGroup"/>
                </p>
                <br/>
            </div>
        </LayoutTemplate>
    </asp:Login>
    </td>
    <td align="center">
    <div id="Div1" style="margin-left: 20px">
     <video width="320" height="240" loop="loop" autoplay="autoplay">
        <source src="Images/as_exz.mp4" type="video/mp4">
    </video>
    </div>
    </td>
    </tr>
    </table>
    </div>
    </div>
    </form>

    <div class="footer">
              © ООО &quot;СоюзКомплект&quot;, 2017 
              <br />
              <br />
    </div>

</body>
</html>
