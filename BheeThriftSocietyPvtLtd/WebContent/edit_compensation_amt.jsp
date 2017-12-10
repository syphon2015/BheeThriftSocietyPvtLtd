<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Bean.CompulsationBean"%>
<%@page import="Model.Dao.CompulsationDao"%>
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
			<li><a href="#">Final Payment</a><i class="fa fa-angle-right"></i>Compensation Amount Edit</li>
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
<%
    String id=request.getParameter("ad_compensation_amt_id");
    int ad_compensation_amt_id=0;
    if(id!=null){
    	ad_compensation_amt_id=Integer.parseInt(id);
    }
    
    CompulsationBean bean=new CompulsationDao().getCompulsationById(ad_compensation_amt_id);
    

%>
	<!-- BEGIN BORDERED TABLE PORTLET-->
	 <div class="portlet box purple">
	  <div class="portlet-title">
	   <div class="caption">Add Final Payment</div>
	   <div class="tools"> <a href="javascript:;" class="collapse"> </a>
	   </div>
	   </div>
	   <div class="portlet-body">
	   <%
	   SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	   String date1 =formatter.format(session.getAttribute("openday"));
	   %>
	    <form id="frmCompensation" action="AdCompensation?action=update&ad_compensation_amt_id=<%=bean.getAd_compensation_amt_id() %>" method="post" autocomplete="off">
			<table class="table table-bordered">
				<tr>
					<td width="20%">Effective From Date : <span class="red">*</span></td>
					<td width="30%"><input class="form-control input-medium date-picker" type="text" name="fdate" id="fdate" value="<%=new SimpleDateFormat("dd/MM/yyyy").format(bean.getEffective_from_date())%>" /><label class="error"></label></td>
					<td width="20%">Compensation Amount : <span class="red">*</span></td>
					<td width="30%"><input class="form-control input-medium" type="text" name="amt" id="amt" value="<%=bean.getAmt() %>" /><label class="error"></label></td>
				</tr>
				<tr>
					<td>Reason Of Compensation : <span class="red">*</span></td>
					<td colspan="3">
						<select class="form-control input-medium" name="reason" id="reason">
						<option value="<%=bean.getReson() %>"><%=bean.getReson() %></option>
						<option value="Death">Death</option>
						<option value="Retirement">Retirement</option>
            			<option value="Transfer">Transfer</option>
                        <option value="Resignation">Resignation</option>
                        <option value="Termination">Termination</option>
                        <option value="Withdrawal">Withdrawal</option>
                       </select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
					  <input class="btn btn-md blue" type="submit" name="Submit" value="submit"/>
					  <input class="btn btn-md green" type="reset" name="Clear"/>
					</td>
				</tr>
			</table>
		 </form>	
	    </div><!-- End portlet-body -->
	</div>
	
	
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
	$('.date-picker').datepicker({format: 'dd/mm/yyyy',autoclose: true,endDate: '<%=date1%>'});
	
	jQuery.validator.addMethod("Alphabet", function(value, element) {
		  return this.optional(element) || /^[a-zA-Z]*$/.test(value);
		}, "Please enter alphabet only.");
	
	jQuery.validator.addMethod("validDate", function(value, element) {
		  return this.optional(element) || /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/.test(value);
		}, "Please enter valid (DD/MM/YYYY) Date formate.");

	jQuery( "#frmCompensation" ).validate({
		  rules: {
			  fdate: {
			      required: true,
			      validDate:true
		      },
		      amt:{
		    	  required: true,
		    	  number:true
		      },
		      reason:{
		    	  required: true,
		    	  Alphabet:true,
		    	  maxlength:20
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