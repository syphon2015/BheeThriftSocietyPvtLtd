<%@page import="Model.Bean.MemberRegistrationBean"%>
<%@page import="Model.Dao.MemberRegistrationDao"%>
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
				<a href="#">Setup</a><i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#">Member</a><i class="fa fa-angle-right"></i>Posting Detail Add and view</li>
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
	   <div class="caption">Search Posting Detail</div>
	   <div class="tools"> <a href="javascript:;" class="collapse"> </a>
	   </div>
	   </div>
	   <div class="portlet-body">
	   <form id="frmPostingDetail" name="frmPostingDetail" action="#">
			<table class="table table-bordered">
				<tr>
					<td width="15%">Select Member : <span class="red">*</span></td>
				    <td width="30%">
				    <select class="form-control input-lg" name="ad_member_id" id="ad_member_id" style="width: 300px; height: 50px" data-placeholder="Select Member" class="chosen-select"  tabindex="2">
						<option value="">--Select Member--</option>
							<% MemberRegistrationDao dao=new MemberRegistrationDao();
							ArrayList<MemberRegistrationBean> alist=dao.getAllMemberlist();
							if(alist!=null){
							for(MemberRegistrationBean bean:alist){%>
						<option value="<%=bean.getAd_member_id()%>"><%=bean.getAd_member_id() %> <%=bean.getName() %></option>
						<%} 
						}%>
					</select>
				    <label class="error"></label></td>				
				</tr>
				<tr>
					<td></td>					
					<td colspan="3">
					  <input class="btn btn blue" type="button" id="submit" name="Submit" value="submit"/>
					  <input id="clear" class="btn btn green" type="reset" name="Clear"/>
					</td>
				</tr>
			</table>
			</form>
	    </div><!-- End portlet-body -->
	</div>
	
	<!-- BEGIN BORDERED TABLE PORTLET-->
	 <div class="portlet box purple">
	  <div class="portlet-title">
	   <div class="caption">
		View Posting Detail
	   </div>
	   <div class="tools"> <a href="javascript:;" class="collapse"> </a>
	   </div>
	   </div>
	    <div class="portlet-body">
		 <div id="dispalyMemberData"></div>
		<div class="clearfix"></div>
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
<%@ include file= "Layout/footer.jsp" %>
<script type="text/javascript" src="assets/plugins/data-tables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery.validate.min.js"></script>
<script src="assets/plugins/select2/select2.min.js"></script>
<script>
jQuery(function() {       
	jQuery('#dataTable1').DataTable();
	jQuery('#ad_member_id').select2();
	
	jQuery("#frmPostingDetail").validate({
		  rules: {
			  ad_member_id: {
		      required: true,
		      digits:true
		    }
		  }
	});
	
	$('#clear').click(function(){
		jQuery('#ad_member_id').select2("val","");
		jQuery('#dispalyMemberData').html("");
	});	

	/* var url= "get_posting_detail.jsp?ad_member_id=0";
	$('#posting_detail_window').attr('src', url); */ 
	
	$("#submit").click(function(e){	
		
	var id = $('#ad_member_id').val();
	if($("#frmPostingDetail").valid()==false){
		return false;
	}else{
		$.ajax({
			  type:"post",
			  url:"get_posting_detail.jsp",
			  data:{"ad_member_id":id},
			  success: function(data){
				  $('#dispalyMemberData').html(data);
			  },
			  error: function(dataXhr, status, errorElement){
				  console.log(status);
			  }
			});//end ajax
	}//end check id
		
	});//end member id change event
	
	
	
});//end dom

</script>
<%}catch(Exception e){
	e.printStackTrace();
} %>
</body>
</html>