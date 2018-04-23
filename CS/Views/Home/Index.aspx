<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    How to send an asynchronous request using the jQuery.ajax() method to retrieve values from a large database
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewData["Message"] %></h2>
    <script type="text/javascript">
        function OnShowClick(key) {
            $.ajax({
                type: 'POST',
                url: '<%: Url.Action("GetRowData", "Home")%>',
                dataType: 'json',
                data: { keyValue: key },

                success: function (obj) {
                    // show your detail popup
                    alert("Is Discontinued: " + obj.Discontinued);
                }
            });
        }
    </script>
    <p>
        To learn more about DevExpress Extensions for ASP.NET MVC visit <a href="http://devexpress.com/Products/NET/Controls/ASP-NET-MVC/" title="ASP.NET MVC Website">http://devexpress.com/Products/NET/Controls/ASP-NET-MVC/</a>.
    </p>
    <% Html.RenderPartial("GridViewPartial"); %>
</asp:Content>