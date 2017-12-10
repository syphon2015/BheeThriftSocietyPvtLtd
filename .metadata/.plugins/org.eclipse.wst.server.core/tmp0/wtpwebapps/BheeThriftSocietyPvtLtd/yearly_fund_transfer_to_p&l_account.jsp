<%@page import="Model.Bean.MemberRegistrationBean"%>
<%@page import="Model.Dao.MemberRegistrationDao"%>
<%@page import="Model.Bean.MemberStatusBean"%>
<%@page import="Model.Dao.MemberStatusDao"%>
<%@page import="Model.Bean.TypeOfFdBean"%>
<%@page import="Model.Dao.TypeOfFdDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2-bootstrap.css"/>
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
				<a href="#">Fund Transfer</a><i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#">Fund Transfer</a><i class="fa fa-angle-right"></i>View</li>
		</ul>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- END PAGE HEADER-->
<!-- BEGIN PAGE CONTENT-->
<div class="row">
<div class="col-md-12">
<!-- Containt Start -->
<!------------------------------------------------------------------- -->
<!-- BEGIN BORDERED TABLE PORTLET-->
<div class="portlet box purple">
<div class="portlet-title">
	<div class="caption">Fund Transfer </div>
	 <div class="tools"> <a href="javascript:;" class="collapse"> </a></div>
</div>
<div class="portlet-body">
<div class="scroller" style="height:350px" data-always-visible="1" data-rail-visible="0">

<ul class="nav nav-pills steps">
	<li class="active"><a href="#tab1" data-toggle="tab" class="step">Fund Transfer</a></li>
	
</ul>
<div class="tab-content">
	<div class="tab-pane fade active in" id="tab1">
	<button id="showModelForm" type="button" class="btn green">Fund Transfer in to P & L Account</button>
	<!-- <button id="showThriftPostingForm" type="button" class="btn blue">Thrift Interest Posting</button> -->
		
	</div><!-- end tab 1 -->
<!-- ------------------------------------------------------End Report 1----------------------------- -->


<!-- ------------------------------------------------------End Report 2----------------------------- -->
</div><!-- End scroller -->
</div><!-- End tab contain -->		
</div><!-- End portlet-body -->
</div>
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

<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

	
	<div class="modal fade member-veiw" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-blue">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title"><i class="fa fa-cogs"></i>Fund Transfer in to P & L A/C </h4>
			</div>
			<div class="modal-body">
				
			<form id="frmFundTransfer"  autocomplete="off" action="AdVoucher?action=fundtransfertopnlaccount"  method="post">
			<table class="table table-bordered">
				<tr>
					<td width="15%">Date : <span class="red">*</span></td>
				    <td width="35%">
				    <input class="form-control input-medium date-picker" type="text" name="date" id="date" placeholder="dd/MM/yyyy" />
				    <label class="error"></label>
				    </td>	
					
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><button type="submit" name="Submit" class="btn blue"><i class="fa fa-bar-chart-o"></i> Transfer</button></td>
				</tr>
			</table>
			
		</form>
				
			</div><!-- end modal-body -->
			<div class="modal-footer">
							<button type="button" class="btn blue" data-dismiss="modal">Close</button>
			</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<!-- /.modal -->




<!-- /.modal -->
<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

<%@ include file= "Layout/footer.jsp" %>
<script type="text/javascript" src="assets/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/select2/select2.min.js"></script>
<script>
	$(function(){
		
		$('#ad_type_of_fd_id').select2();
		$('#ad_member_id').select2();
		$('#ad_member_status_id').select2();
		
		$('.date-picker').datepicker({format: 'dd/mm/yyyy',autoclose: true,endDate : new Date('<%=session.getAttribute("openday")%>'),minDate:'0'});
		jQuery.validator.addMethod("Alpha", function(value, element) {
			  return this.optional(element) || /^[a-zA-Z]*$/.test(value);
			}, "Please enter latter and space only.");
		
		
		jQuery( "#frmFundTransfer" ).validate({
			  rules: {
				  rpt_name: {
			      required: true,
			      Alpha:true
			    },
			    reportype : {
			      required: true
			    }
			  }
			});
		
	
		
		
		
		
		
		
		$('#showModelForm').click(function(){
			$('.member-veiw').modal('show');
			
		});
		
		
		 
	});
</script>
</body>
</html>