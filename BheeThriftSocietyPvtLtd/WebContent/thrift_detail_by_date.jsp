
<%@page import="Model.Dao.MemberRegistrationDao"%>
<%@page import="Model.Bean.MemberRegistrationBean"%>
<%@page import="Model.Dao.MemberShareDao"%>
<%@page import="Model.Bean.ShareViewBean"%>
<%@page import="java.util.Calendar"%>

<%@page import="Model.Dao.GenderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bean.MenuBean"%>

<%
try{
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	String from = null;
	String to = null;
	try {
		Date date = (Date) session.getAttribute("openday");

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");

		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int year = cal.get(Calendar.YEAR);

		Date dt = sdf.parse("03/31/" + year);

		if (date.after(dt)) {

			Date fdate = sdf.parse("01/04/" + year);
			from = sdf.format(fdate).toString();

		} else {
			Date tdate = sdf.parse("01/04/" + (year - 1));
			from = sdf.format(tdate).toString();

		}

		to = sdf.format(date).toString();

	} catch (IllegalArgumentException i) {
		i.printStackTrace();
	}
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<%@ include file="Layout/header.jsp"%>
<link rel="stylesheet"
	href="assets/plugins/data-tables/DT_bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2-bootstrap.css"/>
	
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-full-width">
	<%@ include file="Layout/headtitle.jsp"%>
	<!-- BEGIN HEADER -->
	<div class="header navbar mega-menu">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<%@ include file="Layout/navbar.jsp"%>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN EMPTY PAGE SIDEBAR -->
		<%@ include file="Layout/emptynavbar.jsp"%>
		<!-- END EMPTY PAGE SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<div class="col-md-2 sidebar-content ">
						<%@ include file="Layout/sidebar.jsp"%>
					</div>
					<div class="col-md-10">
						<!-- BEGIN PAGE HEADER-->
						<div class="row">
							<div class="col-md-12">
								<ul class="page-breadcrumb breadcrumb">
									<li><i class="fa fa-home"></i> <a href="#">Thrift</a><i
										class="fa fa-angle-right"></i></li>
									<li><a href="#">Thrift Detail</a><i
										class="fa fa-angle-right"></i>View</li>
								</ul>
								<!-- END PAGE TITLE & BREADCRUMB-->
							</div>
						</div>
						<!-- END PAGE HEADER-->
						<!-- BEGIN PAGE CONTENT-->
						<div class="row">
							<div class="col-md-12">
								<!-- Containt Start -->
								<!-- BEGIN BORDERED TABLE PORTLET-->
								<div class="portlet box purple">
									<div class="portlet-title">
										<div class="caption">Thrft Trx Detail</div>
										<div class="tools">
											<a href="javascript:;" class="collapse"> </a>
										</div>
									</div>
									<!-- end portlet-title -->
									<div class="portlet-body">
										<form id="frmthriftDetail" action="#" method="post">
											<table class="table table-bordered">
												<tr>
													<td width="15%">From Date: : <span class="red">*</span>
													</td>
													<td width="35%"><input
														class="form-control input-medium date-picker" type="text"
														placeholder="dd/mm/yyyy" name="from_date" id="from_date"
														value="<%=from%>" /> <label id="form_type_error"
														class="error "></label>
													</td>
													<td width="15%">To Date : <span class="red">*</span></td>
													<td width="35%"><input
														class="form-control input-medium date-picker" type="text"
														placeholder="dd/mm/yyyy" name="to_date" id="to_date"
														value="<%=to%>" /> <label class="error"></label>
													</td>
												</tr>

												<tr>
													<td></td>
													<td colspan="3"><input type="button"
														class="btn btn blue" id="btnShowView" name="Submit"
														value="submit" /> <input class="btn btn green"
														type="reset" name="Clear" />
													</td>
												</tr>
											</table>
										</form>
									</div>
									<!-- End portlet-body -->
								</div>
								<!-- En portlet box -->
								<!------------------------------------------------------------------- -->

								<!-- BEGIN BORDERED TABLE PORTLET-->
								<div class="portlet box purple">
									<div class="portlet-title">
										<div class="caption">View Thrift Detail</div>
										<div class="tools">
											<a href="javascript:;" class="collapse"> </a>
										</div>
									</div>

									<div class="portlet-body">
										<div id="view_thrift_detail" style="height:450px;overflow-y:auto;">
											<!-- <table id="dataTable1" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>Sno</th>
														<th>Date</th>
														<th>Month</th>
														<th>Staff no</th>
														<th>Name</th>
														<th>Deposit</th>
														
														
													</tr>
												</thead>
												
												<tbody>
													
												</tbody>
												<tfoot style="font-size: 14px;font-weight: bold;">
												<tr>
													<td colspan="5" align="right">Total</td><td>0.0</td>
												</tr>
											</tfoot>
											</table> -->

										</div>
										<div class="clearfix"></div>
									</div>
									<!-- End portlet-body -->
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
	<%@ include file="Layout/footer.jsp"%>


	<script type="text/javascript"
		src="assets/plugins/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/scripts/custom/components-pickers.js"></script>
	<script>
jQuery(function() {  
	jQuery(function() {  
		
		jQuery('.date-picker').datepicker({format: 'dd/mm/yyyy',endDate : '<%=to%>',
					autoclose : true});

				jQuery.validator.addMethod("validDate", function(value, element) {
					return this.optional(element)
							|| /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/i.test(value);
				}, "Please enter valid Date.");

				jQuery("#frmLoanDetail").validate({
					rules : {
						from_date : {
							required : true,
							validDate : true
						},
						to_date : {
							required : true,
							validDate : true
						}
					}
				});
			});
			
			
			
			function loading_show(){
		        $('#modelLoad').removeClass('hide').addClass('show');
		     }
		     function loading_hide(){
		       $('#modelLoad').addClass('hide').removeClass('show');
		     } 
		});
	</script>


	<script type="text/javascript">
		jQuery(function() {

			$('#btnShowView').click(function() {
				
				var from          = $('#from_date').val();
				var to            = $('#to_date').val();
				

				if (jQuery("#frmthriftDetail").valid() == true) {

					
							var dataString = {'from':from,'to':to};
						
					$.ajax({
						type : "POST",
						url : "Ajax/getAllThriftDetailByDate.jsp",
						data : dataString,
						success : function(data) {
							//alert(data);
							$("#view_thrift_detail").html(data);
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log(textStatus);
						}

					});
				} else {
					return false;
				}
			});//end showLadger event

		});
	</script>
	<script type="text/javascript"
		src="assets/plugins/data-tables/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
jQuery(function() {       
	jQuery('#dataTable1').DataTable();
	});
</script>
<%}catch(Exception e){
	e.printStackTrace();
} %>
</body>
</html>