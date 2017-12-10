<%@page import="Model.Bean.LoanPurposeBean"%>
<%@page import="Model.Dao.LoanPurposeDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Model.Bean.LoanTrxBean"%>
<%@page import="Model.Dao.CustomMemberInfoDao"%>
<%@page import="Model.Dao.LoanTrxDao"%>
<%@page import="Model.Bean.LoanDetailViewBean"%>
<%@page import="Model.Bean.BankBranchViewBeen"%>
<%@page import="Model.Dao.BankBranchDao"%>
<%@page import="Model.Bean.BankRegionBean"%>
<%@page import="Model.Dao.BankRegionDao"%>
<%@page import="Model.Bean.StateBean"%>
<%@page import="Model.Dao.StateDao"%>
<%@page import="Model.Bean.BankBean"%>
<%@page import="Model.Dao.BankDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bean.MenuBean"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<%@ include file= "Layout/header.jsp" %>
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-datepicker/css/datepicker.css"/>
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
				<a href="#">Loan</a><i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#">Loan Trx</a><i class="fa fa-angle-right"></i>Edit</li>
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
	   <div class="caption">Edit Loan</div>
	   <div class="tools"> <a href="javascript:;" class="collapse"> </a>
	   </div>
	   </div>
	   <%
				String loan_id=request.getParameter("loan_trx_id");
			       
		  		int loan_trx_id=0;
		        if(loan_id!=null){
		        	
		        	try{
		        		 loan_trx_id=Integer.parseInt(loan_id);
		        		 
		        	}catch(NumberFormatException n){
		        		n.printStackTrace();
		        	}
		        	LoanTrxBean loanBean=new LoanTrxDao().getLoanTrxByDetail(loan_trx_id);
		        	List<Map<String, Object>> memberlist=new CustomMemberInfoDao().getMemberDetailsById(loanBean.getAd_member_id());
		        	if(memberlist.isEmpty()!=true){
		        	Map<String, Object> member=memberlist.get(0);
                   LoanDetailViewBean ldb=new LoanTrxDao().getAllLoanDetailByLoanId(loan_trx_id);

%>
	   <div class="portlet-body">
	    <form id="frmLoan" action="AdLoanTrx?action=edit&il_ad_member_id=<%=ldb.getAd_meber_id() %>" method="post" autocomplete="off">
			
				
<table class="table table-bordered">

	
	  <thead>
			<tr><th colspan="4">Loan Detail </th></tr>
	 </thead>
	 <tbody>
	 <tr>
	 		<td>Member : </td>
	 		<td>
	 			<input type="text" id="name" name="name" value="<%=ldb.getMember_name() %>" readonly="readonly" class="form-control input-medium" />
	 			<label class="error"></label>
	 		</td>																																																																																																																																
	 		<td>Mem No : </td>
	 		<td>
	 			<input type="text" id="ad_society_no" name="ad_society_no" readonly="readonly" value="<%=ldb.getAd_society_no() %>" class="form-control input-medium" />
	 			<label class="error"></label>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>Loan ID : </td>
	 		<td>
	 			<input type="text" id="loan_trx_id" name="loan_trx_id" value="<%=ldb.getLoan_trx_id() %>" readonly="readonly" class="form-control input-medium" />
	 			<label class="error"></label>
	 		</td>																																																																																																																																
	 		<td>Voucher No : </td>
	 		<td>
	 			<input type="text" id="vno" name="vno" readonly="readonly" value="<%=ldb.getVno() %>" class="form-control input-medium" />
	 			<label class="error"></label>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>Loan Type : </td>
	 		<td>
	 			<input type="text" id="loan_type" name="loan_type" value="<%=ldb.getLoan_type() %>" readonly="readonly" class="form-control input-medium" />
	 			<label class="error"></label>
	 		</td>																																																																																																																																
	 		<td>Loan Category : </td>
	 		<td>
	 			<input type="text" id="loan_category_name" name="loan_category_name" readonly="readonly" value="<%=ldb.getLoan_category_name() %>" class="form-control input-medium" />
	 			<label class="error"></label>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>Loan Purpose : </td>
	 		<td>
	 			<select class="form-control input-medium" name="loan_purpose" id="loan_purpose">
					<option value="<%=ldb.getLoan_purpose()%>"><%=ldb.getLoan_purpose() %></option>
					 <%
					 LoanPurposeDao daolp=new LoanPurposeDao();
					 ArrayList<LoanPurposeBean> alistlp=daolp.getAllLoanPurpose();
					 if(alistlp!=null){
					 for(LoanPurposeBean beanlp:alistlp){%>
					 <option value="<%=beanlp.getPurpose()%>"><%=beanlp.getPurpose() %></option>
					 <%} 
					 }%>	
				</select>
	 			<label class="error"></label>
	 		</td>																																																																																																																																
	 		<td>
	 		Loan Amt : </td>
	 		<td>
	 		<input type="text" id="req_loan_amt" name="req_loan_amt" value="<%=ldb.getLoan_amt() %>" class="form-control input-medium" />
	 		<label class="error"></label>
           </td>
	 	</tr>
	 	
	 
		<tr>
			<td>Interest Rate : </td>
			<td><input type="text" id="int_rate" name="int_rate" value="<%=ldb.getIntrest_rate() %>" class="form-control input-medium" />
			<label class="error"></label>
			</td>
			<td>Period Month : </td>
			<td>
			<select class="form-control input-medium" name="period_month" id="period_month" >
							<option value="<%=ldb.getPeriod_month()%>"><%=ldb.getPeriod_month()%> Month</option>
							<option value="10">10 Month</option>
							<option value="12">12 Month</option>
							<option value="18">18 Month</option>
		                    <option value="24">24 Month</option>
		                    <option value="30">30 Month</option>
		                    <option value="36">36 Month</option>
		                    <option value="42">42 Month</option>
		                    <option value="48">48 Month</option>
		                    <option value="54">54 Month</option>
		                    <option value="60">60 Month</option>
		                    <option value="66">66 Month</option>
		                    <option value="72">72 Month</option>
		                    <option value="78">78 Month</option>
		                    <option value="84">84 Month</option>
		                    <option value="90">90 Month</option>
		                    <option value="96">96 Month</option>
		                    <option value="102">102 Month</option>
		                    <option value="108">108 Month</option>
		                    <option value="114">114 Month</option>
		                    <option value="120">120 Month</option>
	          </select><label class="error"></label>
			<label class="error"></label>
			</td>
		</tr>
		<tr>
			<td>Start Loan Date : </td>
			<td><input type="text" id="loan_date" name="loan_date" value="<%= new SimpleDateFormat("dd/MM/yyyy").format(ldb.getIssue_date()) %>" class="form-control input-medium date-picker" />
			<label class="error"></label>
			</td>
			<td>End Loan Date : </td>
			<td><input type="text" id="end_date" name="end_date" value="<%=new SimpleDateFormat("dd/MM/yyyy").format(ldb.getEnd_date()) %>" class="form-control input-medium date-picker" />
			<label class="error"></label>
			</td>
		</tr>
		<tr>
			
			<td>EMI : <span class="red">*</span></td>
			<td><input type="text" id="emi" name="emi" value="<%=ldb.getEmi() %>" class="form-control input-medium" />
			<label class="error"></label>
			</td>
			<td>Status : <span class="red">*</span></td>
			<td><select id="status" name="status"  class="form-control input-medium" >
			<option value="<%=ldb.getStatus() %>"><%=ldb.getStatus() %></option>
			<option value="Open">Open</option>
			<option value="Close">Close</option>
			<option value="Cancel">Cancel</option>
			</select>
			<label class="error"></label>
			</td>
			</tr>
			<tr>
			<td>IsActive : <span class="red">*</span></td>
			<td><select class="form-control input-medium" name="isactive">
					    <option>-- Select Status --</option>
						<option value="true" <% if(ldb.isIsactive()==true){%> selected="selected" <%}%>>Active</option>
						<option value="false" <% if(ldb.isIsactive()==false){%> selected="selected" <%}%>>Inactive</option>
					</select><label class="error"></label>
			</td>
			
			<td align="right" colspan="2">
				<input type="submit" class='btn btn-xm blue' name="edit_loan" value="Update"/>
				<a href="loan_detail_view_2.jsp?loan_trx_id=<%=ldb.getLoan_trx_id() %>" class='btn btn-xm red'>Back</a> 
				
			</td>
		</tr>
	</tbody>
	</table><!-- End Tab Issue Loan -->
			<%}
		        	}%>
		 </form>	
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
<script type="text/javascript" src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/select2/select2.min.js"></script>
<script>
jQuery(function() {       
	jQuery('#dataTable1').DataTable();
	jQuery('#ad_state_id').select2();
	jQuery('#ad_district_id').select2();
	jQuery('#ad_city_id').select2();
	jQuery('#ad_bank_id').select2();
	jQuery('#ad_bank_region_id').select2();
	
	$('.date-picker').datepicker({format: 'dd/mm/yyyy',autoclose: true});
	
	jQuery.validator.addMethod("Alphanumspacedot", function(value, element) {
		  return this.optional(element) || /^[a-zA-Z.\s()]*$/.test(value);
		}, "Please enter character, dot(.) and space only.");
	
	jQuery.validator.addMethod("validAddress", function(value, element) {
		return this.optional(element) || /^[a-zA-Z0-9,-\/] ?([a-zA-Z0-9,-\/\s]|[a-zA-Z0-9,-\/\s] )*[a-zA-Z0-9-\/]$/.test(value);
      }, "Please enter Letters, dot(.) and space only.");
	
	jQuery.validator.addMethod("validIFSC", function (value, element) {
        return this.optional(element) || /^([a-zA-Z]){4}([0-9]){7}?$/i.test(value);
    }, "Please enter valid IFSC Code. (xxxx0000000)"); 
	
	jQuery( "#frmBranch" ).validate({
		  rules: {
			ad_bank_id: {
		      	required: true,
		     	digits:true
		    },
		    ad_bank_region_id:{
		    	required: true,
			    digits:true
		    },
		    ad_state_id:{
		    	required: true,
		     	digits:true
		    },
		    ad_district_id:{
		    	required: true,
		     	digits:true
		    },
		    ad_city_id:{
		    	required: true,
		     	digits:true
		    },
		    branch:{
		    	required: true,
		    	Alphanumspacedot:true
		    },
		    branch_code:{
		    	digits:true,
		    	required: true,
		    	maxlength:5
		    },
		    ifsc_code:{
		    	required: true,
		    	validIFSC:true
		    },
		    pincode:{
		    	digits:true,
		    	maxlength:6
		    },
		    email_id:{
		    	email:true
		    },
		    phone_no:{
		    	digits:true,
		    	maxlength:12
		    },
		    contact_person:{
		    	Alphanumspacedot:true
		    },
		    contact_no:{
		    	digits:true,
		    	maxlength:12
		    },
		    address:{
		    	
		    	maxlength:250
		    }
		  }
		});
});
</script>
<script type="text/javascript">
$(document).ready(function(e) {
$("#ad_state_id").change(function(e) {
		if($(this).val()==0)
		{
			alert("Please Select State......!!");
			//$('#subgroup_name').html(data); 
			return false;			
		}
		else
		{
        var ad_state_id=$(this).val();
        //alert(group_id);
		$.ajax({
			   type: "POST",
			   url: "Ajax/read_district_by_state_id.jsp?ad_state_id="+ad_state_id,
			   async:false,
			   success: function(data)
			   {	
				   $('#ad_district_id').select2("val","");
				   $('#ad_city_id').select2("val","");
				   $('#ad_district_id').html(data);
				   $('#ad_city_id').html("<option value=''>--Select City--</option>");
				   $('#ad_district_id').trigger("chosen:updated");
		  	} }); 
		}
		
	});
	
$("#ad_district_id").change(function(e) {
	
	if($(this).val()==0)
	{
		alert("Please Select State......!!");
		 //$('#subgroup_name').html(data); 
		return false;
		
		
	}
	else
	{
    		var ad_district_id=$(this).val();
    		//alert(group_id);
	$.ajax({
		   type: "POST",
		   url: "Ajax/read_city_by_district_id.jsp?ad_district_id="+ad_district_id,
		   async:false,
		   success: function(data)
		   {	
			   $('#ad_city_id').select2("val","");
			   $('#ad_city_id').html(data);
			   $('#ad_city_id').trigger("chosen:updated");
	  	} }); 
	}
	
});  
});	
</script>
<%}catch(Exception e){
	e.printStackTrace();
} %>
</body>
</html>