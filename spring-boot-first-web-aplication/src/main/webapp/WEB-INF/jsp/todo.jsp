<%@ include file="common/header.jspf" %>
<%@ include file="common/navbar.jspf" %>
<div class="container">

<h1>Add a Todo for ${name}</h1>

<form:form method="post" modelAttribute="todo">
<form:hidden path="id"/>
<fieldset class="form-group">
<form:label path="desc">Description </form:label> 
<form:input type="text"  path="desc" name="desc"  class="form-control" required="required"></form:input> 
<form:errors path="desc" cssClass="text-warning"></form:errors>
</fieldset>

<fieldset class="form-group">
<form:label path="targetDate">Target Date</form:label> 
<form:input type="text"  path="targetDate" name="desc"  class="form-control" required="required"></form:input> 
<form:errors path="targetDate" cssClass="text-warning"></form:errors>
</fieldset>
<button class="btn btn-success"  type="submit">Submit</button>
</form:form>

		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
		<script>
		$('#targetDate').datepicker({
			format : 'dd/mm/yyyy'
		});
	</script>
</div>
<%@ include file="common/footer.jspf" %>
