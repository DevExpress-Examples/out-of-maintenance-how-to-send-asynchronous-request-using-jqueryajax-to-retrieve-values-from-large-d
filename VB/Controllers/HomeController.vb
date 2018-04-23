Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Mvc
Imports Example.Models

Namespace Example.Controllers
	<HandleError> _
	Public Class HomeController
		Inherits Controller
		Public Function Index() As ActionResult
			ViewData("Message") = "Welcome to DevExpress Extensions for ASP.NET MVC!"

			Return View()
		End Function

		Public Function GridViewPartial() As ActionResult
			Return PartialView("GridViewPartial")
		End Function

		Public Function GetRowData(ByVal keyValue As Int32) As JsonResult
			Dim result As New JsonResult()

			' get data by key value from you data source and put it to result.Data
			Dim context As New DataClassesDataContext()
			Dim product = context.Products.Select(Function(p) p).Where(Function(p) p.ProductID = keyValue).First()

			result.Data = New With {Key .Discontinued = product.Discontinued}

			Return result
		End Function
	End Class
End Namespace
