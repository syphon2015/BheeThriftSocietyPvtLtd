<%@page import="Model.Dao.FdRoiDao"%>
<%@page import="Model.Bean.FdRoiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bean.MenuBean"%>
<%@page import="Model.Bean.TypeOfFdBean"%>
<%@page import="Model.Dao.TypeOfFdDao"%>
<%@page import="Model.Bean.FdCategoryBean"%>
<%@page import="Model.Dao.FdCategoryDao"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<%@ include file= "Layout/header.jsp" %>
<link rel="stylesheet" href="assets/plugins/data-tables/DT_bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-full-width">
<%@ include file= "Layout/headtitle.jsp" %>
<!-- BEGIN HEADER -->
<div class="header navbar mega-menu">
<!-- BEGIN TOP NAVIGATION BAR -->
<%@ include file= "Layout/navbar.jsp" %>
<!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN EMPTY PAGE SIDEBAR -->
	<%@ include file= "Layout/emptynavbar.jsp" %>
	<!-- END EMPTY PAGE SIDEBAR -->
	<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
<div class="page-content">
<!-- BEGIN PAGE CONTENT-->
<div class="row">
<div class="col-md-2 sidebar-content ">
<%@ include file= "Layout/sidebar.jsp" %>
</div>
<div class="col-md-10">
<!-- BEGIN PAGE HEADER-->
<div class="row">
	<div class="col-md-12">
		<ul class="page-breadcrumb breadcrumb">
			<li><i class="fa fa-home"></i>
				<a href="#">Setup</a><i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#">FD</a><i class="fa fa-angle-right"></i>Edit FD ROI Add and View</li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
<div class="col-md-12">
<!-- Containt Start -->
<%
try{
Object AppObj = request.getSession().getAttribute("AppMessage");
String[] AppMessage = (String[])AppObj;
if(AppMessage[1].isEmpty()!=true && AppMessage[1].equals("welcome")!=true){ %>
<div class="alert <%=AppMessage[0] %> alert-dismissable">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
	<%=AppMessage[1] %>
</div>
<%
}
%>
<!------------------------------------------------------------------- -->
	<!-- BEGIN BORDERED TABLE PORTLET-->
	 <div class="portlet box purple">
	  <div class="portlet-title">
	   <div class="caption">Edit FD ROI</div>
	   <div class="tools"> <a href="javascript:;" class="collapse"> </a>
	   </div>
	   </div>
	   <%	
								
								   String fd_roi_id=request.getParameter("ad_fd_roi_id"); 
									int	ad_fd_roi_id=0;
									if(fd_roi_id!=null){ 
									try{
										ad_fd_roi_id=Integer.parseInt(fd_roi_id); 
									FdRoiDao dao=new FdRoiDao();
									FdRoiBean bean=dao.getFdRoiById(ad_fd_roi_id);
									if(bean!=null){ %>
	   <div class="portlet-body">
	    <form id="frmFixDepositeRoi" action="AdFdRoi?action=update&ad_fd_roi_id=<%=ad_fd_roi_id %>" method="post" autocomplete="off">
			<table class="table table-bordered">
				<tr>
					<td width="15%">Fd Type : <span class="red">*</span></td>
					<td width="30%">
					<select class="form-control input-medium" name='ad_type_of_fd_id' id="ad_type_of_fd_id">
					   <option value="<%=bean.getAd_type_of_fd_id()%>"><%=new TypeOfFdDao().gettypeoffdById(bean.getAd_type_of_fd_id()).getName() %></option>
					<% TypeOfFdDao dao2=new TypeOfFdDao();
					   ArrayList<TypeOfFdBean> alist=dao2.getAlltypeoffd();
					 	if(alist!=null){
					 	for(TypeOfFdBean bean2:alist){%>
					   <option value="<%=bean2.getAd_type_of_fd_id()%>"><%=bean2.getName() %></option>
					   <%} 
					 }%>	
					</select>
					<label class="error"></label></td>
					<td width="15%">FD Category : <span class="red">*</span></td>
					<td width="30%">
					<select class="form-control input-medium" name='ad_fd_category_id' id="ad_fd_category_id">
					<option value="<%=bean.getAd_fd_category_id()%>"><%=new FdCategoryDao().getFdCategoryById(bean.getAd_fd_category_id()).getName() %></option>
					 <%
					 FdCategoryDao dao1=new FdCategoryDao();
					 ArrayList<FdCategoryBean> alist1=dao1.getAllFdCategory();
					 if(alist1!=null){
					 for(FdCategoryBean bean1:alist1){%>
					 <option value="<%=bean1.getAd_fd_category_id()%>"><%=bean1.getName() %></option>
					  <%
					   } 
					  }
					 
					  %>
					</select>
					<label class="error"></label>
					</td>
				</tr>
				<tr>
					
					<td>ROI : <span class="red">*</span></td>
					<td><input class="form-control input-medium" type="text" id="roi" name="roi" value="<%=bean.getRoi() %>" /><label class="error"></label></td>
					<td>Compound Frequency : <span class="red">*</span></td>
					<td><input class="form-control input-medium" type="text" id="compound_frequency" name="compound_frequency" value="<%=bean.getCompound_frequency() %>" /><label class="error"></label></td>
				</tr>
				<tr>
				<td>Time Period (in month) : <span class="red">*</span></td>
					<td><input class="form-control input-medium" type="text" id="time_period" name="time_period" value="<%=bean.getTime_period() %>" /><label class="error"></label></td>
					<td>Effective Form Date : <span class="red">*</span></td>
					<td colspan="3"><input class="form-control input-medium date-picker" type="text" id="fdate" name="fdate" value="<%=new SimpleDateFormat("dd/MM/yyyy").format(bean.getEffective_form()) %>" /><label class="error"></label></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">
					  <input class="btn btn-md blue" type="submit" name="Submit" value="submit"/>
					  <input class="btn btn-md green" type="reset" name="Clear"/>
					</td>
				</tr>
			</table>
		 </form>	
	    </div><!-- End portlet-body -->
	</div>
	<%
									}
									}
									catch(Exception e){
										e.printStackTrace();
										response.sendRedirect("fd_roi.jsp");
										}
									}
	%>
	<!------------------------------------------------------------------- -->
	<!-- END BORDERED TABLE PORTLET-->					
<!-- Containt Stop -->
</div>
</div>
</div>
</div>
<!-- END PAGE CONTENT-->
</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@ include file= "Layout/footer.jsp" %>
<script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/scripts/custom/components-pickers.js"></script>
<script>
jQuery(function() {       
	jQuery('#dataTable1').DataTable();
	$('.date-picker').datepicker({format: 'dd/mm/yyyy',autoclose: true});
	
	jQuery.validator.addMethod("Alphanumspace", function(value, element) {
		  return this.optional(element) || /^[a-zA-Z\s]*$/.test(value);
		}, "Please enter latter and space only.");
	
	jQuery.validator.addMethod("validDate", function (value, element) {
        return this.optional(element) || /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/i.test(value);
    }, "Please enter valid Date.");
	
	jQuery( "#frmFixDepositeRoi" ).validate({
		  rules: {
			ad_type_of_fd_id: {
			  required: true,
			  digits:true
		    },
		    ad_fd_category_id:{
		      required: true,
			  digits:true
		    },
		    time_period:{
		    	required: true,
				digits:true
		    },
		    roi:{
		    	required: true,
				number:true
		    },
		    fdate:{
		    	required: true,
		    	validDate:true
		    },
		    compound_frequency:{
		    	required: true,
				number:true
		    }
		  }
		});
});
</script>
<%}catch(Exception e){
	e.printStackTrace();
} %>
</body>
</html>