
<%@page import="com.adjetter.customermanagement.db.bean.CMEnquiryBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMLeadConfirmationDetail"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="com.adjetter.db.objects.Resource"%>
<%@page import="com.adjetter.promo.db.objects.EmailTemplate"%>
<%@page import="com.adjetter.whitelabel.PrivilegesEnum"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMQuotationTemplateBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMQuotationTemplate"%>
<%@page import="com.adjetter.db.bean.CMCustomerDesignationBean"%>
<%@page import="com.adjetter.db.objects.CMCustomerDesignation"%>
<%@page import="com.adjetter.customermanagement.db.object.CMNotes"%>
<%@page import="org.apache.commons.beanutils.PropertyUtils"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMCustomerAssociateObjectBean"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMCustomerAssociateObjectValueBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMCustomerAssociateObjectValue"%>
<%@page import="com.adjetter.customermanagement.db.object.CMCustomerAssociateObject"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMAssociateObjectFieldMappingBean"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.adjetter.customermanagement.db.object.CMAssociateObjectFieldMapping"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMCustomerAssociateObjectValueMappingBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMCustomerAssociateObjectValueMapping"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMPartnerJspConfigurationBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMPartnerJspConfiguration"%>
<%@page import="com.adjetter.customermanagement.db.object.CMLeadConfirmationPayment"%>
<%@page import="com.adjetter.whitelabel.WhiteLabelHelper"%>
<%@page import="com.adjetter.customermanagement.db.object.CMAdditionalFields"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMAdditionalFieldsMappingBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMAdditionalFieldsMapping"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.adjetter.whitelabel.WhiteLabelUtils"%>
<%@page import="com.adjetter.customermanagement.db.object.CMEnquiryAction"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMUpdateActionBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMUpdateAction"%>
<%@page import="com.adjetter.customermanagement.db.object.PartnerResources"%>
<%@page import="com.adjetter.utils.DateUtils"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMContactDetailsBean"%>
<%@page import="com.adjetter.utils.TimeZoneUtils"%>
<%@page import="com.adjetter.customermanagement.db.object.CMContactDetail"%>
<%@page import="com.adjetter.utils.StringUtilityClass"%>
<%@page import="com.adjetter.customermanagement.db.object.GenericQuotationTemplate"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMLeadProductBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMLeadProduct"%>
<%@page import="com.adjetter.customermanagement.db.object.CMLeadProductDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.adjetter.customermanagement.db.bean.GenericQuotationTemplateBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMEnquiry"%>
<%@page import="com.adjetter.customermanagement.db.object.CMLeadMember"%>
<%@page import="com.adjetter.servlet.handler.WhiteLabelHandler"%>
<%@page import="com.adjetter.customermanagement.db.bean.CMEmployeeBean"%>
<%@page import="com.adjetter.customermanagement.db.object.CMEmployee"%>
<%@page import="com.adjetter.utils.SessionManager"%>
<%@page import="com.adjetter.customermanagement.db.object.CMPartner"%>
<%@page import="com.adjetter.customermanagement.db.object.CMPartnerUser"%>
<html lang="en">
	<head>
	<jsp:include page="/whitelabel/default_template/n_headtags.jsp" />
	<link rel="stylesheet" type="text/css" href="/static/assets/global/plugins/bootstrap-summernote/summernote.css">
	<link rel="stylesheet" href="/static/crm/css/plugin.wysiwyg.css">
	<link rel="stylesheet" type="text/css" href="/static/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
	<link href="/static/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet"/>
	<link href="/static/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet"/>
	<link href="/static/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet"/>
	<script defer src="/static/crm/js/mylibs/jquery-fallr-1.2.js"></script>
	</head>
	<script type="text/javascript">
	var editContact_array_js = new Array();
	</script>
	<%
	CMPartnerUser partnerUser = SessionManager.getCMPartnerUser(request);
	CMPartner partner = SessionManager.getCMPartner(request);
	int cmId = 0;
	String partnerName= "";
	if(partner!=null){
	partnerName = partner.getName();
	cmId = partner.getCmId();
	}
	CMEmployee loggedInEmp = CMEmployeeBean.allEmployee.get(partnerUser.getEmpId());
	CMEnquiry enqObj = request.getAttribute(WhiteLabelHandler.ENQUIRY_DETAILS) != null ? (CMEnquiry)request.getAttribute(WhiteLabelHandler.ENQUIRY_DETAILS) : null;
	CMLeadMember leadObj = request.getAttribute(WhiteLabelHandler.LEAD_MEMBER) != null ? (CMLeadMember)request.getAttribute(WhiteLabelHandler.LEAD_MEMBER) : null;
	CMLeadConfirmationDetail orderObj = request.getAttribute("CONFIRMED_ENQUIRY") != null ? (CMLeadConfirmationDetail)request.getAttribute("CONFIRMED_ENQUIRY") : null;
	List<CMContactDetail> contactList = request.getAttribute("ENQUIRY_CONTACT_LIST") != null ? (List<CMContactDetail>) request.getAttribute("ENQUIRY_CONTACT_LIST") : null;
	List<CMEnquiryAction> actionList = request.getAttribute("ENQUIRY_ACTION_LIST") != null ? (List<CMEnquiryAction>)request.getAttribute("ENQUIRY_ACTION_LIST") : null;
	List<CMNotes> notesList = request.getAttribute(WhiteLabelHandler.NOTES_LIST_OF_AN_ENQUIRY)!=null ? (List<CMNotes>)request.getAttribute(WhiteLabelHandler.NOTES_LIST_OF_AN_ENQUIRY) : null;
	List<EmailTemplate> emailTemplateList = request.getAttribute(WhiteLabelHandler.EMAIL_TEMPLATE_LIST)!=null ? (List<EmailTemplate>) request.getAttribute(WhiteLabelHandler.EMAIL_TEMPLATE_LIST) : null;
	String msg1 = request.getAttribute(WhiteLabelHandler.MESSAGE)!=null ?(String) request.getAttribute(WhiteLabelHandler.MESSAGE): "";
	String leadActionPriorityStr = PartnerResources.getPartnerResourcesValBasedOnKey(cmId,"ENQUIRY_DETAILS_CONFIGURE_PRE_SELECTED_ACTION_PRIOROTY");
	int actionPriority = WhiteLabelUtils.getIntFromString(leadActionPriorityStr);
	int leadPriority = enqObj != null ? enqObj.getLeadPriority() : 0; 
	String hotLeadText = "";
	String warmLeadText = "";
	String coldLeadText = "";
	String hotLeadColor = CMLeadMember.HOT_LEAD_COLOR;
	String warmLeadColor = CMLeadMember.WARM_LEAD_COLOR;
	String coldLeadColor = CMLeadMember.COLD_LEAD_COLOR;
	List<GenericQuotationTemplate> genericQuotationTemplateList = null;
	String enqPhone = "";
	String leadCurrentStatus = "N/A";
	String leadActionSubStatus = "";
	String dsaStatus = "";
	String nextFollowUpStr = "";
	String lastFollowUpStr = "";
	String conversionDateStr = "";
	String followUpTypeStr = "";
	if(enqObj != null) {
	if(StringUtilityClass.isNotNullAndNotEmpty(enqObj.getCurrentStatus() + "")) {
	if(enqObj.getCurrentStatus() != ' ' && enqObj.getCurrentStatus() == WhiteLabelHandler.NEW_ADD_LEAD) {
	leadCurrentStatus = "On Hold";
	} else if(enqObj.getCurrentStatus() != ' ' && enqObj.getCurrentStatus() == WhiteLabelHandler.TO_FOLLOW_UP) {
	leadCurrentStatus = partner.getFollowUpLeadText();
	} else if(enqObj.getCurrentStatus() != ' ' && enqObj.getCurrentStatus() == WhiteLabelHandler.LEAD_MEMBER_CONVERTED) {
	    leadCurrentStatus = partner.getConvertedLeadText();
	} else if(enqObj.getCurrentStatus() != ' ' && enqObj.getCurrentStatus() == WhiteLabelHandler.LEAD_MEMBER_ANSWERED) {
	    leadCurrentStatus = partner.getRejectedLeadText();
	}
	}
	if(StringUtilityClass.isNotNullAndNotEmpty(enqObj.getSubStatus()) && enqObj.getSubStatus().equals(WhiteLabelHandler.LEAD_MEMBER_ANSWERED + "")) {
	leadActionSubStatus = "Rejected";
	} else if(enqObj.getCurrentStatus() != ' ' && enqObj.getCurrentStatus() == WhiteLabelHandler.LEAD_MEMBER_ANSWERED) {
	leadActionSubStatus = CMEnquiry.getSubStatusName(enqObj.getSubStatus(), cmId);
	if("".equals(leadActionSubStatus)){
	leadActionSubStatus = PartnerResources.getStatusNameFromvalue(cmId, enqObj.getSubStatus(), PartnerResources.BOOKING_REJECTION);
	}
	} else if(StringUtilityClass.isNotNullAndNotEmpty(enqObj.getSubStatus()) && enqObj.getSubStatus().equals(WhiteLabelHandler.NEW_ADD_LEAD + "")){
	leadActionSubStatus = "On Hold";
	}else if(enqObj.getCurrentStatus() != ' ' && enqObj.getCurrentStatus() == WhiteLabelHandler.NEW_ADD_LEAD){
	leadActionSubStatus = PartnerResources.getStatusNameFromvalue(cmId, enqObj.getSubStatus(), "PARTNER_ENQUIRY_CONFIG_BOOKING_ON_HOLD_REASONS");
	if(!StringUtilityClass.isNotNullAndNotEmpty(leadActionSubStatus)) {
	leadActionSubStatus = CMEnquiry.getSubStatusName(enqObj.getSubStatus(), cmId);
	}
	}else{
	if(StringUtilityClass.isNotNullAndNotEmpty(enqObj.getSubStatus()) && enqObj.getSubStatus().equals("SMA")){
	leadActionSubStatus = "Sent For Management Approval";
	}else{
	leadActionSubStatus = CMEnquiry.getSubStatusName(enqObj.getSubStatus(), cmId);
	}
	}
	CMContactDetail enqContactDetail = enqObj.getPrimaryContact();
	if(enqContactDetail != null) {
	enqPhone = StringUtilityClass.isNotNullAndNotEmpty(enqContactDetail.getPhone()) ? enqContactDetail.getPhone() : "";
	}
	if(StringUtilityClass.isNotNullAndNotEmpty(enqObj.getSubStatus())){
	if(enqObj.getSubStatus().equals("NA")){
	dsaStatus = "New";
	}else if(enqObj.getSubStatus().equals("PC") || enqObj.getSubStatus().equals("OH") || enqObj.getSubStatus().equals("PS") || enqObj.getSubStatus().equals("POS") || enqObj.getSubStatus().equals("PD") || enqObj.getSubStatus().equals("CS")){
	dsaStatus = "Pending";
	}else if(enqObj.getSubStatus().equals("PDC")){
	dsaStatus = "Pending From Customer";
	}else if(enqObj.getSubStatus().equals("IAP")){
	dsaStatus = "Pending - Incomplete";
	}else if(enqObj.getSubStatus().equals("C")){
	dsaStatus = "Sanctioned";
	}else if(enqObj.getSubStatus().equals("R")){
	dsaStatus = "Rejected";
	}
	}
	nextFollowUpStr = TimeZoneUtils.getStringForTimestampISTtoPartnerZone(partner, partnerUser.getEmployee(), enqObj.getNextFollowUp(), "dd MMM, yyyy HH:mm");
	    lastFollowUpStr = TimeZoneUtils.getStringForTimestampISTtoPartnerZone(partner, partnerUser.getEmployee(), enqObj.getLastFollowUp(), "dd MMM, yyyy HH:mm");
	conversionDateStr = TimeZoneUtils.getStringForTimestampISTtoPartnerZone(partner, partnerUser.getEmployee(), enqObj.getConversionDate(), "dd MMM, yyyy HH:mm");
	if(enqObj.getFollowUpType() != null && enqObj.getFollowUpType().equals(CMEnquiry.MEETING_FOLLOW_UP_TYPE)){ 
	followUpTypeStr = "Meeting";
	}else if(enqObj.getFollowUpType() != null && enqObj.getFollowUpType().equals(CMEnquiry.CALL_FOLLOW_UP_TYPE)){
	followUpTypeStr = "Call";
	}else if(enqObj.getFollowUpType() != null && enqObj.getFollowUpType().equals("Emails")){
	followUpTypeStr = "Emails";
	}
	}
	List<CMUpdateAction> allActionList = CMUpdateActionBean.cmIdToActionListMap.get(partner.getCmId());
	 	List<CMUpdateAction> followUpActionList = null;
	 	if(allActionList != null && allActionList.size() > 0){
	 	followUpActionList = new ArrayList<CMUpdateAction>();
	 	for(CMUpdateAction action : allActionList){
	 	if(action != null && action.isEnabled() && action.getNextSubStatus() != null && !"".equals(action.getNextSubStatus())){
	 	if(action.getCurrentStatus() != null && action.getCurrentStatus().equals("R")){
	 	}else{
	 	followUpActionList.add(action);
	 	}
	 	}
	 	}
	 	}
	 	HashMap<Integer, HashMap<String, CMUpdateAction>>  allActionMap = CMUpdateActionBean.cmIdToActionStatusToObjMap;
	HashMap<String, CMUpdateAction> cmIDToActinMap = allActionMap.get(cmId);
	CMUpdateAction actionStatusMap = null;
	CMUpdateAction parentActionName = null;
	if(cmIDToActinMap!=null && cmIDToActinMap.size()>0){
	if(cmIDToActinMap.keySet()!=null && cmIDToActinMap.keySet().size()>0){
	 	for(String check : cmIDToActinMap.keySet()){
	 	if(enqObj.getSubStatus().equals(check)){
	 	actionStatusMap = cmIDToActinMap.get(enqObj.getSubStatus());
	 	parentActionName = CMUpdateActionBean.getActionNameById(cmId, actionStatusMap.getParentActionId(), null);
	 	}
	 	}
	 	}
	}
	 	String enquiryAdditionalFieldsOnDeliveryStr = PartnerResources.getPartnerResourcesValBasedOnKey(cmId,"BOOKING_CONFIRM_CONFIGURE_ADD_ENQ_ADDITIONAL_FIELDS");
	  	List<CMAdditionalFieldsMapping> enqiryAdditionalFieldsOnDeliveryList = null;
	  	if(enquiryAdditionalFieldsOnDeliveryStr != null && !"".equals(enquiryAdditionalFieldsOnDeliveryStr)){
	  	Set<String> enquiryAdditionalFieldsOnDeliverySet = WhiteLabelUtils.getStringSetFromString(enquiryAdditionalFieldsOnDeliveryStr, ",");
	  	List<CMAdditionalFieldsMapping> enqAddiList = CMAdditionalFieldsMappingBean.getAdditionalFieldMapping(cmId, CMAdditionalFields.OBJECT_TYPE_ENQUIRY);
	  	if(enqAddiList != null && enqAddiList.size() > 0 && enquiryAdditionalFieldsOnDeliverySet != null && enquiryAdditionalFieldsOnDeliverySet.size() > 0){
	  	enqiryAdditionalFieldsOnDeliveryList = new ArrayList<CMAdditionalFieldsMapping>();
	  	for(CMAdditionalFieldsMapping obj : enqAddiList){
	  	if(obj != null && obj.isEnabled() && obj.getColumnName() != null && enquiryAdditionalFieldsOnDeliverySet.contains(obj.getColumnName())){
	  	enqiryAdditionalFieldsOnDeliveryList.add(obj);
	  	}
	  	}
	  	}
	  	}
	  	boolean tabActive = true;
	  	CMPartnerJspConfiguration jspConfiguration = null;
	if(CMPartnerJspConfigurationBean.cmIdToJspConfigurationMap != null && CMPartnerJspConfigurationBean.cmIdToJspConfigurationMap.size() > 0){
	jspConfiguration = CMPartnerJspConfigurationBean.cmIdToJspConfigurationMap.get(partner.getCmId());
	}
	//int applicationFormId = 24;
	//int sanctionedDetailsId = 25;
	int applicationFormId = 16;
	int sanctionedDetailsId = 13;
	CMCustomerAssociateObject associateObj =  CMCustomerAssociateObjectBean.idToObject.get(applicationFormId);
	CMCustomerAssociateObject sanctionAssociateObj =  CMCustomerAssociateObjectBean.idToObject.get(sanctionedDetailsId);
	HashMap<Integer, List<CMCustomerAssociateObjectValueMapping>> objecIdToAssociateValueMappingMap = CMCustomerAssociateObjectValueMappingBean.getCustomerAssociateObjectMapping(leadObj.getId(), cmId);
	LinkedHashMap<String, LinkedHashMap<Integer,List<CMAssociateObjectFieldMapping>>> customerTypeToObjectFieldsListMap = null; 
	HashMap<Integer, LinkedHashMap<String, LinkedHashMap<Integer,List<CMAssociateObjectFieldMapping>>>> cmIdToCustomerTypeToObjectFieldsListMap =  CMAssociateObjectFieldMappingBean.objectIdToCustomerTypeObjectFieldsMappingMap(cmId); 
	if(cmIdToCustomerTypeToObjectFieldsListMap != null && cmIdToCustomerTypeToObjectFieldsListMap.size()>0){ 
	customerTypeToObjectFieldsListMap = cmIdToCustomerTypeToObjectFieldsListMap.get(cmId); 
	} 
	List<CMAssociateObjectFieldMapping> associateObjectList = null ;
	List<CMAssociateObjectFieldMapping> sanctionAssociateObjectList = null ;
	if(customerTypeToObjectFieldsListMap != null && customerTypeToObjectFieldsListMap.size()>0){ 
	HashMap<Integer, List<CMAssociateObjectFieldMapping>> associateObjectMap = customerTypeToObjectFieldsListMap.get("Other"); 
	if(associateObjectMap != null && associateObjectMap.size()>0){  
	associateObjectList = associateObjectMap.get(applicationFormId); 
	sanctionAssociateObjectList = associateObjectMap.get(sanctionedDetailsId); 
	}
	}
	CMCustomerAssociateObjectValue sanctionedAssociateObjectValueObjEnquiry = null;
	if(orderObj != null && CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectListMap != null && CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectListMap.size() > 0){
	HashMap<Integer, List<CMCustomerAssociateObjectValue>> associatedWithIdToValueListMap = CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectListMap.get(cmId);
	if(associatedWithIdToValueListMap != null && associatedWithIdToValueListMap.size() > 0){
	List<CMCustomerAssociateObjectValue> sanctionValueList = associatedWithIdToValueListMap.get(orderObj.getId());
	if(sanctionValueList != null && sanctionValueList.size() > 0){
	sanctionedAssociateObjectValueObjEnquiry = sanctionValueList.get(0);
	}
	}
	}
	Set<CMUpdateAction> checkParent = new HashSet<CMUpdateAction>();
	for(CMUpdateAction actionStatus : followUpActionList){
	for(CMUpdateAction action : followUpActionList){
	if(action != null && action.isEnabled()){
	if(actionStatus.getId() == action.getParentActionId()){
	checkParent.add(actionStatus);
	}
	}	
	}
	}
	List<CMCustomerAssociateObject> childObjEnqList = null; 
	CMEmployee empObjC = null;
	CMCustomerAssociateObjectValue associateObjectValueObjEnquiry = null;
	CMCustomerAssociateObjectValue sanctionObjectValueObjEnquiry = null;
	HashMap<Integer,CMCustomerAssociateObjectValue> objectIdToObjectValuesEnquiry = null;
	HashMap<String ,HashMap<Integer,CMCustomerAssociateObjectValue>> refIdToOjectIdToObjectValuesEnquiry = null; 
	HashMap<Integer, HashMap<String, HashMap<Integer, CMCustomerAssociateObjectValue>>> leadIdToRefIdToobjectIdToFieldsValueMapEnquiry  =  CMCustomerAssociateObjectValueBean.leadIdToRefIdToObjectsValueMap(cmId);  
	if(leadIdToRefIdToobjectIdToFieldsValueMapEnquiry != null && leadIdToRefIdToobjectIdToFieldsValueMapEnquiry.size()>0 && leadObj.getId() > 0){ 
	refIdToOjectIdToObjectValuesEnquiry = leadIdToRefIdToobjectIdToFieldsValueMapEnquiry.get(leadObj.getId()); 
	}
	HashMap<Integer, List<CMCustomerAssociateObject>> childObjListMapEnquiry = CMCustomerAssociateObjectBean.cmIdToParentIdToChildObjectListMap.get(cmId); 
	if(childObjListMapEnquiry != null && childObjListMapEnquiry.size() > 0){ 
	childObjEnqList = childObjListMapEnquiry.get(applicationFormId); 
	}
	boolean avldata = false;
	String updateId = "";
	String refIdObStr = "";
	if(refIdToOjectIdToObjectValuesEnquiry != null && refIdToOjectIdToObjectValuesEnquiry.size() > 0){
	for(String refIdOb : refIdToOjectIdToObjectValuesEnquiry.keySet()){
	if(StringUtilityClass.isNotNullAndNotEmpty(refIdOb)){ 
	objectIdToObjectValuesEnquiry = refIdToOjectIdToObjectValuesEnquiry.get(refIdOb); 

	}	
	if(objectIdToObjectValuesEnquiry != null && objectIdToObjectValuesEnquiry.size() > 0){ 
	associateObjectValueObjEnquiry = objectIdToObjectValuesEnquiry.get(applicationFormId); 
	}
	if(objectIdToObjectValuesEnquiry != null && objectIdToObjectValuesEnquiry.size() > 0 && objectIdToObjectValuesEnquiry.get(sanctionedDetailsId)!=null){ 
	sanctionObjectValueObjEnquiry = objectIdToObjectValuesEnquiry.get(sanctionedDetailsId); 
	}
	if(associateObjectValueObjEnquiry != null){ 
	 	empObjC = CMEmployeeBean.getEmployee(cmId, associateObjectValueObjEnquiry.getCreatorId()); 
	 	avldata = true;
	 	if(StringUtilityClass.isNotNullAndNotEmpty(updateId) && !updateId.contains(sanctionObjectValueObjEnquiry.getId()+"") && sanctionObjectValueObjEnquiry!=null){
	updateId = updateId + sanctionedDetailsId+"_"+sanctionObjectValueObjEnquiry.getId() + "," ;
	}else if(sanctionObjectValueObjEnquiry!=null){
	if(!updateId.contains(sanctionObjectValueObjEnquiry.getId()+"") && sanctionObjectValueObjEnquiry!=null){
	updateId = updateId + sanctionedDetailsId+"_"+sanctionObjectValueObjEnquiry.getId() + "," ;
	} 
	}
	}else if(childObjEnqList != null && childObjEnqList.size() > 0 && objectIdToObjectValuesEnquiry != null && objectIdToObjectValuesEnquiry.size()>0){
	for(CMCustomerAssociateObject childObj: childObjEnqList){
	CMCustomerAssociateObjectValue childObjVal = objectIdToObjectValuesEnquiry.get(childObj.getId());
	if(childObjVal != null){
	empObjC = CMEmployeeBean.getEmployee(cmId, childObjVal.getCreatorId());
	avldata = true;
	if(StringUtilityClass.isNotNullAndNotEmpty(updateId) && !updateId.contains(childObjVal.getId()+"") && sanctionObjectValueObjEnquiry!=null){
	updateId = updateId + sanctionedDetailsId+"_"+sanctionObjectValueObjEnquiry.getId() + "," ;
	}else if(sanctionObjectValueObjEnquiry!=null){
	if(!updateId.contains(childObjVal.getId()+"")&& sanctionObjectValueObjEnquiry!=null){
	updateId = updateId + sanctionedDetailsId+"_"+sanctionObjectValueObjEnquiry.getId() + "," ;
	}
	}
	break;
	}
	}
	}
	refIdObStr = refIdOb;
	}
	}else{
	if(enqObj != null && CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectIdToAdditionalFieldValueObjMap != null && CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectIdToAdditionalFieldValueObjMap.size() > 0 && CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectIdToAdditionalFieldValueObjMap.get(cmId) != null && CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectIdToAdditionalFieldValueObjMap.get(cmId).size() > 0){
	HashMap<Integer, CMCustomerAssociateObjectValue> objectIdToObjectFieldsValueMap = CMCustomerAssociateObjectValueBean.cmIdToLeadIdToObjectIdToAdditionalFieldValueObjMap.get(cmId).get(enqObj.getId());
	if(objectIdToObjectFieldsValueMap != null && objectIdToObjectFieldsValueMap.size() > 0){
	associateObjectValueObjEnquiry = objectIdToObjectFieldsValueMap.get(applicationFormId);
	sanctionedAssociateObjectValueObjEnquiry = objectIdToObjectFieldsValueMap.get(sanctionedDetailsId);
	if(associateObjectValueObjEnquiry != null){
	avldata = true;
	}
	}
	}
	}
	HashMap<Integer, String> actionIdToObjMap = new HashMap<Integer, String>();
	if(allActionList != null && allActionList.size() > 0){
	for(CMUpdateAction actionObj : allActionList){
	if(actionObj != null){
	actionIdToObjMap.put(actionObj.getId(),actionObj.getActionName());
	}
	}
	}
	List<CMCustomerDesignation> customerDesignation = CMCustomerDesignationBean.cmIdToCustomerDesignationMap.get(cmId);
	List<CMQuotationTemplate> templateList = null;
	if(CMQuotationTemplateBean.cmIdToTemplateMap != null && CMQuotationTemplateBean.cmIdToTemplateMap.size()>0){
	templateList = CMQuotationTemplateBean.cmIdToTemplateMap.get(cmId);
	}
	String empEmailId =  partnerUser.getEmployee() != null && StringUtilityClass.isNotNullAndNotEmpty(partnerUser.getEmployee().getEmail()) ? partnerUser.getEmployee().getEmail() : "";
	String enqEmailId = "";
	if(enqObj != null){
	CMContactDetail contact = enqObj.getContacts() != null && enqObj.getContacts().size() > 0 ? enqObj.getContacts().get(0) : null;
	if(contact == null){
	contact = enqObj.getPrimaryContact();
	}
	if(contact != null){
	enqEmailId = contact.getEmail() != null ? contact.getEmail() : "";
	}
	}
	String nextFollowStr = enqObj != null  && enqObj.getNextFollowUp() != null ? DateUtils.getDateInDdMmYyyyHhMm(enqObj.getNextFollowUp()) : "";
	String productName = ""; 
	  	double quantity = 0;
	 	String allProductNameKey = "";
	 	double totalAMountKey = 0;
	 	String parentProductNameKey = "";
	 	String allowEmailTemplateKeywordReplacementStr = PartnerResources.getPartnerResourcesValBasedOnKey(cmId, "ALLOW_EMAIL_TEMPLATE_KEYWORD_REPLACEMENT");
        if (enqObj != null && StringUtilityClass.isNotNullAndNotEmpty(allowEmailTemplateKeywordReplacementStr)  && allowEmailTemplateKeywordReplacementStr.equals(PartnerResources.TRUE_STRING)) {
        	if (CMLeadProductDetails.leadIdToEnquiryIdListProjectMap != null  && CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.size() > 0) {
        	if (CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.get(enqObj.getLeadId()) != null && CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.get(enqObj.getLeadId()).size() > 0) {
                    if (CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.get(enqObj.getLeadId()).get(enqObj.getId()) != null && CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.get(enqObj.getLeadId()).get(enqObj.getId()).size() > 0) {
                    	List<CMLeadProductDetails> leadProjectDetailsList= CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.get(enqObj.getLeadId()).get(enqObj.getId()); 
                    	if (leadProjectDetailsList != null && leadProjectDetailsList.size() > 0) {
                            for (CMLeadProductDetails obj : leadProjectDetailsList) {
                                if (obj != null) {
                                    if (StringUtilityClass.isNotNullAndNotEmpty(obj.getLeadProductParentName())) {
                                    	allProductNameKey += obj.getLeadProductParentName() + ",";
                                    }
                                    if (StringUtilityClass.isNotNullAndNotEmpty(obj.getName())) {
                                    	allProductNameKey += obj.getName() + ",";
                                    }                                      
                                    quantity += obj.getQuantity();                                      
                                    double prodAmount = obj.getRate() * obj.getQuantity();
                                    double taxRate = obj.getProductTaxId();
                                    totalAMountKey += taxRate > 0 ? ((prodAmount * taxRate) / 100) : prodAmount;
                                    if (StringUtilityClass.isNotNullAndNotEmpty(productName)) {
                                        productName = obj.getName() != null ? (productName + "," + obj.getName()) : productName;
                                        parentProductNameKey = obj.getLeadProductParentName() != null ? (parentProductNameKey + "," + obj.getLeadProductParentName()): parentProductNameKey;
                                    } else {
                                        productName = obj.getName() != null ? obj.getName() : "";
                                        parentProductNameKey = obj.getLeadProductParentName() != null ? obj.getLeadProductParentName() : "";
                                    }
                                }
                           }
                       }
                    }
        	}
        	}
        }
        List<CMAdditionalFieldsMapping> enquiryAditionalFieldsListTemp = CMAdditionalFieldsMappingBean.getAdditionalFieldMapping(partner.getCmId(), CMAdditionalFields.OBJECT_TYPE_ENQUIRY);
        List<CMAdditionalFieldsMapping> enquiryAditionalFieldsList = null;
        if(enquiryAditionalFieldsListTemp != null && enquiryAditionalFieldsListTemp.size() > 0){
        	enquiryAditionalFieldsList = new ArrayList<CMAdditionalFieldsMapping>();
        	for(CMAdditionalFieldsMapping obj : enquiryAditionalFieldsListTemp){
        	if(obj != null && obj.isEnabled() && obj.getColumnName() != null && !obj.getColumnName().equals("attr15")){
        	enquiryAditionalFieldsList.add(obj);
        	}
        	}
        }
	Integer dsaDesignationId = 662;
	boolean isDSA = false;
	if(loggedInEmp != null && loggedInEmp.getDesignationId() != null && loggedInEmp.getDesignationId().contains(dsaDesignationId)){
	isDSA = true;
	}
	boolean isShow = true;
	boolean showSanctionedDetails = true;
	boolean active = true;
	if(isDSA){
	if(enqObj != null && enqObj.getCurrentStatus() != 'C'){
	showSanctionedDetails = false;
	}
	}
	boolean allowEdit = false;
	if(isDSA && StringUtilityClass.isNotNullAndNotEmpty(enqObj.getSubStatus()) && enqObj.getSubStatus().equals("IAP")){
	allowEdit = true;
	}else if(!isDSA){
	allowEdit = true;
	}
	int loanAmountReqdId = 63;
	    int netTakeHomeMonthlySalaryId = 64;
	    int monthlyEMIPaidId = 65;
	    int monthlyRentPaidId = 66;
	    int mobileNumberId = 67;
	    int fullNameId = 68;
	    int cityId = 69;
	    int emailIdId = 70;
	    int dobId = 71;
	    int genderId = 72;
	    int currentWorkExpMonthId = 73;
	    int totalWorkExpMonthId = 74;
	    int noOfMonthsInCurrentResidenceId = 75;
	    int residenceTypeId = 76;
	    int panId = 77;
	    int pincodeOfCurrentResidenceId = 78;
	    int salaryRecvdInId = 79;
	    int loanPurposeId = 80;
	    int companyNameId = 81;
	    int currentAddressId = 82;
	    int currentAddressCityId = 83;
	    int currentAddressStateId = 84;
	    int currentAddressPincodeId = 85;
	    int permanentAddressId = 83;
	    int permanentAddressCityId = 87;
	    int permanentAddressStateId = 88;
	    int permanentAddressPincodeId = 89;
	    int maritalStatusId = 84;
	    int noOfDependantsId = 85;
	    int educationLevelId = 86;
	    int adharId = 87;
	    int voterId = 88;
	    int drivingLicenseId = 89;
	    int bankAccountNumberId = 90;
	    int ifscCodeId = 91;
	    int officialEmailId = 92;
	    int officialPhoneId = 93;
	    int referrenceOneNameId = 94;
	    int referrenceOnePhoneId = 172;
	    int referrenceOneAddressId = 173;
	    int referrenceTwoNameId = 95;
	    int referrenceTwoPhoneId = 175;
	    int referrenceTwoAddressId = 176;
	    int panFileId = 96;
	    int adharFileId = 97;
	    int monthSlipsFileId = 99;
	    int bankStatementFileId = 98;
	    int otherDocumentId = 181;
	    int currentAddressProofId = 182;
	    int currentAddressProofFileId = 183;
	    int sanctionAmountId = 40;
	    int tenureId = 41;
	    int roiId = 42;
	    int completedActionId = 180;
	    /* String visibelId = "433";
	    int loanAmountReqdId = 3640;
	    int netTakeHomeMonthlySalaryId = 3641;
	    int monthlyEMIPaidId = 3642;
	    int monthlyRentPaidId = 3643;
	    int mobileNumberId = 3644;
	    int fullNameId = 3645;
	    int cityId = 3646;
	    int emailIdId = 3647;
	    int dobId = 3648;
	    int genderId = 3649;
	    int currentWorkExpYearId = 3741;
	    int currentWorkExpMonthId = 3650;
	    int totalWorkExpYearId = 3742;
	    int totalWorkExpMonthId = 3651;
	    int noOfYearsInCurrentResidenceId = 3743;
	    int noOfMonthsInCurrentResidenceId = 3652;
	    int residenceTypeId = 3653;
	    int panId = 3654;
	    int pincodeOfCurrentResidenceId = 3655;
	    int salaryRecvdInId = 3656;
	    int loanPurposeId = 3657;
	    int companyNameId = 3658;
	    int currentAddressId = 3659;
	    int currentAddressCityId = 3660;
	    int currentAddressStateId = 3661;
	    int currentAddressPincodeId = 3662;
	    int permanentAddressId = 3663;
	    int permanentAddressCityId = 3664;
	    int permanentAddressStateId = 3665;
	    int permanentAddressPincodeId = 3666;
	    int maritalStatusId = 3667;
	    int noOfDependantsId = 3668;
	    int educationLevelId = 3669;
	    int adharId = 3670;
	    int voterId = 3671;
	    int drivingLicenseId = 3672;
	    int bankAccountNumberId = 3673;
	    int ifscCodeId = 3674;
	    int officialEmailId = 3675;
	    int officialPhoneId = 3676;
	    int referrenceOneNameId = 3705;
	    int referrenceOnePhoneId = 3706;
	    int referrenceOneAddressId = 3707;
	    int referrenceTwoNameId = 3708;
	    int referrenceTwoPhoneId = 3709;
	    int referrenceTwoAddressId = 3710;
	    int panFileId = 3711;
	    int adharFileId = 3712;
	    int bankStatementFileId = 3714;
	    int monthSlipsFileId = 3713;
	    int otherDocumentId = 3715;
	    int currentAddressProofId = 3716;
	    int currentAddressProofFileId = 3717;
	    int sanctionAmountId = 3616;
	    int tenureId = 3617;
	    int roiId = 3618;
	    int completedActionId = 6713; */
	%>
	<body class="page-md page-header-fixed page-sidebar-closed-hide-logo ">
	<div class="page-container">
	<jsp:include page="/whitelabel/default_template/n_header.jsp" />
	<jsp:include page="/whitelabel/default_template/n_side-menu.jsp" />
	<div class="page-content-wrapper">
	<div class="page-content">
	<div class="page-head">
	<div class="page-title">
	<h1><%=partner.getLeadText() %> Details</h1>
	</div>
	</div>
	<ul class="page-breadcrumb breadcrumb">
	<li>
	<a href="home.html">Home</a>
	<i class="fa fa-circle"></i>
	</li>
	<li>
	<a href="search-lead-member.html"><%=partner.getLeadText() %></a>
	<i class="fa fa-circle"></i>
	</li>
	<li>
	<a href="#"><%=partner.getLeadText() %> Details</a>
	</li>
	</ul>
	<%if(!"".equals(msg1)) { %>
	<div class="row">
	<div class="col-md-12">
	<div class="alert alert-success">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
	<%=msg1 %>
	</div>
	</div>
	</div>
	       	<% }%>
	       	<%if(!isDSA){ %>
	<jsp:include page="/whitelabel/template/kapture/employee/note.jsp"></jsp:include>
	<%} %>
	<%if(!isDSA){ %>
	<div class="row">
	<div class="col-md-12">	
	<div class="portlet light">
	<div class="portlet-body">
	<div class="row">
	<div class="col-md-12">
	<%String hotLead = "";
	if(leadPriority == CMLeadMember.HOT_LEADS) {
	    hotLead = "background: none; background-color: "+(hotLeadColor != null && !"".equals(hotLeadColor) ? hotLeadColor : CMLeadMember.HOT_LEAD_COLOR)+"; color: white;";
	}%>
	<button class="btn blue lead_priority_class" type="button" style="margin-top:5px;<%=hotLead%>" onclick="updateLeadPriority(this, <%=CMLeadMember.HOT_LEADS %>)"> <%=(hotLeadText != null && !"".equals(hotLeadText) ? hotLeadText : "Hot Lead")%> </button>
	<%String warmLead = "";
	if(leadPriority == CMLeadMember.WARM_LEADS) {
	    warmLead = "background: none; background-color: "+(warmLeadColor != null && !"".equals(warmLeadColor) ? warmLeadColor : CMLeadMember.WARM_LEAD_COLOR)+"; color: black;";
	}%>
	<button class="btn blue lead_priority_class"  type="button" style="margin-top:5px;<%=warmLead%>" onclick="updateLeadPriority(this, <%=CMLeadMember.WARM_LEADS %>)"> <%=(warmLeadText != null && !"".equals(warmLeadText) ? warmLeadText : "Warm Lead")%> </button>
	<%String coldLead = "";
	if(leadPriority == CMLeadMember.COLD_LEADS || leadPriority == CMLeadMember.COLD_LEADS_ALTERNATE) {
	    coldLead = "background: none; background-color: "+(coldLeadColor != null && !"".equals(coldLeadColor) ? coldLeadColor : CMLeadMember.COLD_LEAD_COLOR)+"; color: white;";
	}%>	
	<button class="btn blue lead_priority_class" type="button" style="margin-top:5px;<%=coldLead%>" onclick="updateLeadPriority(this, <%=CMLeadMember.COLD_LEADS %>)"> <%=(coldLeadText != null && !"".equals(coldLeadText) ? coldLeadText : "Cold Lead")%>  </button>
	<input type="hidden" name="template_id" id="template_id">
	<div class="btn-group" style="margin-top: 6px;margin-left: 15px; float: right;">
	<a class="btn btn-sm blue dropdown-toggle" href="javascript:;" data-toggle="dropdown" style="margin-right: 18px;">
	<i class="fa fa-navicon"></i>
	</a>
	                <ul class="dropdown-menu pull-right" style="margin-right: 18px;">
	                	<li><a href="javascript:;" onclick="funEditLead();"><i class="fa fa-envelope-o"></i>&nbsp;Send Email</a></li>
	                	<li><a href="javascript:;" id="attchFilesBtn"  onclick="attachFilesToEnquiryFunc();" ><i class="fa fa-file-archive-o"></i>&nbsp;Attach Document </a></li>
	                	<%if(enqObj != null && enqObj.getPricingStatus() != 'P'){ %>
	                	<%
	                	if (GenericQuotationTemplateBean.genericQuotationTemplateByCMIDMap!=null && GenericQuotationTemplateBean.genericQuotationTemplateByCMIDMap.size()>0){
	    	genericQuotationTemplateList = GenericQuotationTemplateBean.genericQuotationTemplateByCMIDMap.get(cmId);
	    	}
	    	List<CMLeadProductDetails> leadProductDetailsList = CMLeadProductDetails.leadIdToEnquiryIdListProjectMap!=null && CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.get(enqObj.getLeadId())!=null ? CMLeadProductDetails.leadIdToEnquiryIdListProjectMap.get(enqObj.getLeadId()).get(enqObj.getId()):null;
	    	CMLeadProduct leadProductObj= null;
	    	if(leadProductDetailsList!=null && leadProductDetailsList.size()>0){
	    	for(CMLeadProductDetails productDetailsObj:leadProductDetailsList ){
	    	int prodId = productDetailsObj.getLeadProductId()>0? productDetailsObj.getLeadProductId():productDetailsObj.getLeadProductParentId()>0?productDetailsObj.getLeadProductParentId():0;
	    	if(prodId>0){
	    	leadProductObj = CMLeadProductBean.idToLeadProductMap.get(prodId);
	    	break;
	    	}
	    	}
	    	}
	                	%>
	                	<%if (genericQuotationTemplateList != null && genericQuotationTemplateList.size() > 0){ %>
	                	<%for (GenericQuotationTemplate templateObj : genericQuotationTemplateList){ %>
	                	<li><a href="javascript:;" id="geneedit_rate_quotations<%=templateObj.getId()%>" onclick="selectGenericTemplate('<%=enqObj.getId()%>','<%=enqObj.getLeadId()%>','<%=templateObj.getGenericTemplateId()%>','<%=templateObj.getId()%>')"><i class="fa fa-cloud-download"></i>&nbsp;<%=templateObj.getJspButtonName()%> </a></li>
	                	<%} %>
	                	<%}else{ %>
	                	<li><a href="javascript:;"  id="geneedit_rate_quotations" onclick="selectTemplate('<%=enqObj.getId()%>','<%=enqObj.getLeadId()%>')"><i class="fa fa-cloud-download"></i>&nbsp;Generate Quotations </a></li>
	                	<%} %>
	                	<%} %>
	                	<li><a href="javascript:;" onclick="show_add_note()"><i class="fa fa-edit"></i>&nbsp;Add Note</a></li>
	                	<li><a href="javascript:;" onclick="viewCustomerDetailsFunc('<%= enqObj.getLeadId()%>')"><i class="fa fa-user"></i>&nbsp;View <%=partner.getCustomerText()%> Details</a></li>
	                </ul>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%}else{ %>
	<div class="row">
	<div class="col-md-12">	
	<div class="portlet light">
	<div class="portlet-body">
	<div class="row">
	<div class="col-md-12">
	<button class="btn blue" type="button" style="margin-top:5px;float: right;" onclick="attachOtherDocumentsFunc()">Attach Other Documents</button>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%} %>
	<div class="row">
	<div class="col-md-6 col-sm-12">
	<div class="portlet light tasks-widget">
	<div class="portlet-title">
	<div class="caption caption-md">
	<i class="icon-bar-chart theme-font-color hide"></i>
	<span class="caption-subject theme-font-color bold"><%=partner.getCustomerText()%> Detail</span>
	</div>
	</div>
	<div class="portlet-body">
	<div class="task-content">
	<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 180px;">
	<div class="scroller" style="height: 180px; overflow: hidden; width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	<%if(enqObj != null) { %>
	<ul class="task-list">
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Name</div>
	<div class="col-xs-7 task-title-sp" id="customer_name_td">
	<%if(enqObj.getPrimaryContact()!=null && !(enqObj.getPrimaryContact()).equals("")){ %>
	<%String contactPerson = enqObj.getPrimaryContact().getContactPerson();
	if(StringUtilityClass.isNotNullAndNotEmpty(contactPerson)) {%>
	   <%=StringUtilityClass.isNotNullAndNotEmpty(enqObj.getPrimaryContact().getTitle()) ? enqObj.getPrimaryContact().getTitle().toUpperCase() + " " : ""  %>	<%=contactPerson.toUpperCase() %>  
	<%} else if(StringUtilityClass.isNotNullAndNotEmpty(enqObj.getNameOrCompanyname())) {%>
	  	<%=StringUtilityClass.isNotNullAndNotEmpty(enqObj.getPrimaryContact().getTitle()) ? enqObj.getPrimaryContact().getTitle().toUpperCase() + " " : ""  %> <%=enqObj.getNameOrCompanyname().toUpperCase() %>  
	<%} else {%>
	N/A
	<%}
	%>
	<%}else{ %>
	N/A
	<%} %> 
	</div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Phone</div>
	<div class="col-xs-7 task-title-sp">
	<%=StringUtilityClass.isNotNullAndNotEmpty(enqPhone) ?  enqPhone : "N/A" %>
	</div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">State</div>
	<div class="col-xs-7 task-title-sp" id="customer_state_td">
	<%if(enqObj.getState() != null && !(enqObj.getState()).equals("")) { %>
	<%=enqObj.getState()%> 
	<%} else { %>
	N/A
	<%} %>
	</div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title" >
	<div class="row">
	<div class="col-xs-4 task-title-sp">City</div>
	<div class="col-xs-7 task-title-sp" id="customer_city_td">
	<%if(enqObj.getCity() != null && !(enqObj.getCity()).equals("")) { %>
	<%=enqObj.getCity()%> 
	<%} else { %>
	N/A
	<%} %>
	</div>
	</div>
	</div>
	</li>
	<%String createDateStr = TimeZoneUtils.getStringForTimestampISTtoPartnerZone(partner, partnerUser.getEmployee(), enqObj.getGenerationDate(), "dd MMM, yyyy HH:mm"); %>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Create Date</div>
	<div class="col-xs-7 task-title-sp">
	<%=createDateStr %>  
	</div>
	</div>
	</div>
	</li>
	</ul>
	<%} %>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="portlet light tasks-widget">
	<div class="portlet-title">
	                                <div class="caption caption-md">
	                                    <i class="icon-bar-chart theme-font-color hide"></i>
	                                    <span class="caption-subject theme-font-color bold">Contact Detail</span>
	                                    <h6 style="display: inline;"> [Click on the row to edit details] </h6>
	                                </div>
	                            </div>
	                            <div class="portlet-body">
	                            	<div class="task-content">
	                            	<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; max-height: 282px;">
	                            	<div class="scroller" style="max-height: 282px; overflow: hidden; width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	                            	<%if(enqObj != null) { %>
	                                            <table id="table_space_three" class="table table-bordered table-striped flip-content">
	                                                <thead class="flip-content">
	                                                    <tr>
	                                                        <th>Name</th>
	                                                        <th>Phone No.</th>
	                                                        <th>Email</th>
	                                                    </tr>
	                                                </thead>
	                                                <tbody>
	                                                    <%if(contactList != null && contactList.size() > 0){ %>
	                                                        <%for(CMContactDetail contactObj : contactList){ %>
	                                                            <%if(contactObj != null){ %>
	                                                                <tr class="gradeA" id="contactEditRowTrId_<%=contactObj.getId() %>" onclick="editContactFunc(<%=contactObj.getId() %>);" style="cursor: pointer;" title="Click here to edit contacts" >
	                                                                    <td align="center">
	                                                                        <%String title = StringUtilityClass.isNotNullAndNotEmpty(contactObj.getTitle()) ? contactObj.getTitle().toUpperCase() + " " : "";
	                                                                        String contactPerson = StringUtilityClass.isNotNullAndNotEmpty(contactObj.getContactPerson()) ? contactObj.getContactPerson().toUpperCase() : "";%>
	                                                                        <%= title + contactPerson%>
	                                                                    </td>
	                                                                    <td align="center">
	                                                                        <%=contactObj.getPhone() != null ? contactObj.getPhone() : "N/A" %>
	                                                                    </td>
	                                                                    <td align="center">
	                                                                        <%=contactObj.getEmail() != null ? contactObj.getEmail() : "N/A" %>
	                                                                    <script type="text/javascript">
	                                                                        var editContact_js = new Object();
	                                                                        editContact_js.id = '<%=contactObj.getId()>0? contactObj.getId() : 0%>';
	                                                                        editContact_js.title = '<%=contactObj.getTitle()!=null ? contactObj.getTitle() :"" %>';
	                                                                        editContact_js.name = '<%=contactObj.getContactPerson() != null && !"".equals(contactObj.getContactPerson()) ? contactObj.getContactPerson() : ""%>';
	                                                                        editContact_js.phone_no = '<%=contactObj.getPhone() != null && !"".equals(contactObj.getPhone()) ? contactObj.getPhone() : ""%>';
	                                                                        editContact_js.email ='<%=contactObj.getEmail() != null && !"".equals(contactObj.getEmail()) ? contactObj.getEmail() : ""%>';
	                                                                        editContact_js.birth_date = '<%=contactObj.getDob()!=null ? contactObj.getDob() : "" %>';
	                                                                        editContact_js.birth_date_str = '<%=contactObj.getDob()!=null ? DateUtils.getDateInDDMMYYYYInUIFormat(contactObj.getDob()) : "" %>';
	                                                                        editContact_js.anniversary_date = '<%=contactObj.getAnniversaryDate()!=null ? contactObj.getAnniversaryDate() : "" %>';
	                                                                        editContact_js.anniversary_date_str = '<%=contactObj.getAnniversaryDate()!=null ? DateUtils.getDateInDDMMYYYYInUIFormat(contactObj.getAnniversaryDate()) : "" %>';
	                                                                        editContact_js.additional_phone = '<%=contactObj.getAdditionalPhone()!=null ? contactObj.getAdditionalPhone() : "" %>';
	                                                                        editContact_js.additional_email = '<%=contactObj.getAdditionalEmail()!=null ? contactObj.getAdditionalEmail() :"" %>';
	                                                                        editContact_js.designation_type = '<%=contactObj.getDesignationType()!=null ?contactObj.getDesignationType():"" %>';
	                                                                        editContact_js.designation = '<%=contactObj.getDesignation() != null && !"".equals(contactObj.getDesignation()) ? contactObj.getDesignation() :  ""%>';
	                                                                        editContact_js.is_primary_contact = '<%=contactObj.isPrimaryContact() %>';
	                                                                        editContact_js.first_name='<%=contactObj.getFirstName()!=null ? contactObj.getFirstName() : "" %>';
	                                                                        editContact_js.last_name='<%=contactObj.getLastName()!=null ? contactObj.getLastName() : "" %>';
	                                                                        editContact_array_js[editContact_js.id] = editContact_js;
	                                                                    </script>
	                                                                </tr>
	                                                            <%} %>
	                                                        <%} %>
	                                                    <%} %>
	                                                </tbody>
	                                            </table>
	                                        <%} %>
	                            	</div>
	                            	</div>
	                            	</div>
	                            </div>
	</div>
	<div class="portlet light tasks-widget">
	<div class="portlet-title">
	<div class="caption caption-md">
	<i class="icon-bar-chart theme-font-color hide"></i>
	<div class="caption-subject theme-font-color bold">
	<%=partner.getLeadText()%> Details
	</div>
	</div>
	</div>
	<div class="portlet-body">
	<div class="task-content">
	<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; <%=isDSA ? "height: 155px" : "height: 350px" %>;">
	<div class="scroller" style="<%=isDSA ? "height: 155px" : "height: 350px" %>; overflow: hidden; width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	<%if(enqObj!=null) { %>
	<div class="scroller" style="<%=isDSA ? "height: 155px" : "height: 350px" %>;" data-always-visible="1" data-rail-visible="0" data-handle-color="#D7DCE2">
	<ul class="task-list">
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Enquiry Id</div>
	<div class="col-xs-7 task-title-sp"><%=enqObj.getId() %></div>
	</div>
	</div>
	</li>
	<%if(isDSA){ %>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Status</div>
	<div class="col-xs-7 task-title-sp">
	<%=leadActionSubStatus%>
	</div>
	</div>
	</div>
	</li>
	<%}else{ %>
	<%if(actionStatusMap!=null && actionStatusMap.getParentActionId()>0){ %>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Status</div>
	<div class="col-xs-7 task-title-sp">
	<%=parentActionName.getActionName()%>
	</div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title" >
	<div class="row">
	<div class="col-xs-4 task-title-sp">Action Status</div>
	<div class="col-xs-7 task-title-sp">
	<%=actionStatusMap.getActionName()%>
	</div>
	</div>
	</div>
	</li>
	<%} else { %>
	<li>
	<div class="task-title" >
	<div class="row">
	<div class="col-xs-4 task-title-sp">Status</div>
	<div class="col-xs-7 task-title-sp">
	<%=actionStatusMap!=null ? actionStatusMap.getActionName() : "N/A"%>
	</div>
	</div>
	</div>
	</li>
	<%} %>
	<%} %>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Creator Name</div>
	<div class="col-xs-7 task-title-sp">
	<%if(enqObj.getCreatorName() != null && !(enqObj.getCreatorName()).equals("")){ %>
	<%=enqObj.getCreatorName()%>
	<%}else{ %>
	N/A
	<%} %>
	</div>
	</div>
	</div>
	</li>
	<%if(!isDSA){ %>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Assigned To</div>
	<div class="col-xs-7 task-title-sp">
	<%String assignedTo = CMEmployee.getEmployeeNameById(enqObj.getAssignedToId());%>
	<%=StringUtilityClass.isNotNullAndNotEmpty(assignedTo) ? assignedTo : "" %>
	</div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Next FollowUp</div>
	<div class="col-xs-7 task-title-sp"><%=nextFollowUpStr%></div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Last FollowUp</div>
	<div class="col-xs-7 task-title-sp">
	<%=StringUtilityClass.isNotNullAndNotEmpty(lastFollowUpStr) ? lastFollowUpStr : "N/A" %>	
	</div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Expected Date Of CLosure</div>
	<div class="col-xs-7 task-title-sp">
	 	<%=conversionDateStr %>
	</div>
	</div>
	</div>
	</li>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Follow Up Type</div>
	<div class="col-xs-7 task-title-sp"><%=followUpTypeStr != null && !"".equals(followUpTypeStr) ? followUpTypeStr : "N/A" %></div>
	</div>
	</div>
	</li>
	<%} %>
	<li>
	<div class="task-title">
	<div class="row">
	<div class="col-xs-4 task-title-sp">Remarks</div>
	<div class="col-xs-7 task-title-sp"><%=enqObj != null && enqObj.getRemarks() != null ? enqObj.getRemarks() : "N/A" %></div>
	</div>
	</div>
	</li>
	</ul>
	</div>
	<%} %>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%if(!isDSA && enqObj != null && enqObj.getFilePath() != null && !"".equals(enqObj.getFilePath())){ %>
	<div class="portlet light tasks-widget">
	<div class="portlet-title">
	<div class="caption caption-md">
	<i class="icon-bar-chart theme-font-color hide"></i>
	<span class="caption-subject theme-font-color bold">Download Attached Files</span>
	</div>
	</div>
	<div class="portlet-body">
	<div class="task-content">
	<div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 282px;">
	<div class="scroller" style="height: 282px; overflow: hidden; width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	<table class="table table-bordered table-striped flip-content">
	<thead class="flip-content">
	<tr>
	<th>Download</th>
	<th></th>
	</thead>
	<tbody>
	<%if(enqObj.getFilePath().contains("##")){ %>
	<%String fileArr[] = enqObj.getFilePath().split("##");%>
	<%if(fileArr != null && fileArr.length > 0){ %>
	<%for(String eachFile : fileArr){ %>
	<%if(eachFile != null && !"".equals(eachFile)){ %>
	<%
	String fileNameStr = "";
	int lastIndexOf = eachFile.lastIndexOf("/") + 1;
	fileNameStr = eachFile.substring(lastIndexOf);
	%>
	<tr>
	<td><a href="<%=eachFile%>" target="_blank"><%=fileNameStr != null && !"".equals(fileNameStr) ? fileNameStr : "Download File" %></a></td>
	<td style="cursor: pointer;" onclick="deleteSelectedFileFunc('<%=eachFile%>')">Delete</td>
	</tr>
	<%} %>
	<%} %>
	<%} %>
	<%}else{ %>
	<%
	String fileNameStr = "";
	int lastIndexOf = enqObj.getFilePath().lastIndexOf("/") + 1;
	fileNameStr = enqObj.getFilePath().substring(lastIndexOf);
	%>
	<tr>
	<td><a href="<%=enqObj.getFilePath() %>" target="_blank"><%=fileNameStr != null && !"".equals(fileNameStr) ? fileNameStr : "Download File" %></a></td>
	<td style="cursor: pointer;" onclick="deleteSelectedFileFunc('<%=enqObj.getFilePath()%>')">Delete</td>
	</tr>
	<%} %>
	</tbody>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%} %>
	</div>
	<%if(!isDSA){ %>
	<div class="col-md-6 col-sm-12">
	<%if(enqObj != null && enqObj.getCurrentStatus() == 'F'){ %>
	<div class="portlet tasks-widget box green">
	<div class="portlet-title">
	<div class="caption">
	<i class="fa fa-cogs"></i>Action
	</div>
	<div class="tools">
	<a href="javascript:;" class="<%=isShow ? "collapse" : "expand" %>" data-original-title="" title=""></a>
	</div>
	</div>
	<%
	String actionDisplayNone = "style=\"display: none;\"";
	if(isShow) {
	actionDisplayNone = "";
	isShow = false;
	}
	%>
	<div class="portlet-body" <%=actionDisplayNone %>>
	<div class="task-content">
	<div class="slimScrollDiv" style=" width: auto; ">
	<div class="scroller" style="  width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	<form method="post" id="update_action_form" name="to_follow_up_form" action="enquiry-action-update.html" class="validate">
	<input type="hidden" name="lead_member_id" value="<%=enqObj.getLeadId()%>"/>
	<input type="hidden" name="lead_current_sub_status" value="<%=enqObj.getSubStatus() != null ? enqObj.getSubStatus() : ""%>" />
	<input type="hidden" name="enquiry_id" value="<%=enqObj.getId()%>" />
	<input type="hidden" id="parentObj_to_childObj" name="parentObj_to_childObj" value="<%=sanctionedDetailsId%>">
	<input type="hidden" id="not_to_redirect" name="not_to_redirect" value="1">
	<input type="hidden" id="update_ids" name ="update_ids" value ="<%=updateId%>">
	<div class="row">
	<%if(followUpActionList != null && followUpActionList.size()>0){ %>
	<%
	int priority = 0;	
	String subStatus = enqObj != null ? enqObj.getSubStatus() : "";
	for(CMUpdateAction updateAction : allActionList){
	if(updateAction != null && updateAction.isEnabled()){
	if(subStatus != null && subStatus.equals(updateAction.getNextSubStatus())){
	priority = updateAction.getPriority();
	}
	}
	}
	if(priority <= 0 && actionPriority > 0){
	priority = actionPriority;
	}
	Set<Integer> enqActionIdList = null;
	if(actionList != null && actionList.size() > 0){
	enqActionIdList = new HashSet<Integer>();
	for(CMEnquiryAction actObj : actionList){
	if(actObj != null){
	enqActionIdList.add(actObj.getActionId());
	}
	}
	}
	%>
	<%if(followUpActionList != null && followUpActionList.size()>0){ %>
	<div class="col-md-6">
	   <div class="form-group">
	      <label class="control-label">Select Action</label>
	      <select class="form-control select2me" data-placeholder="Select..." name="update_action_id" id="selected_update_action_id" onchange="setEnquiryActionsFunc();">
	       	  <option></option>
	          <%for(CMUpdateAction action : followUpActionList){ %>
	         	<%if(action != null && action.isEnabled() && action.getParentActionId() <= 0){ %>
	         	<option  value="<%=action.getId()%>"> <%=action.getActionName() %> </option>
	         	<%} %>
	          <%} %>
	      </select>
	   </div>
	</div>
	    	<%} %>
	    	<%if(checkParent!=null && checkParent.size()>0) { %>
	<%for(CMUpdateAction actionStatus : checkParent){%>
	<div class="col-md-6" style="display:none;" id="showChildAction">
	   <div class="form-group" >
	      <label class="control-label">Select Child</label>
	      	<select class="form-control select2me" data-placeholder="Select..." name="child_action_id" id="selected_child_action_id" >
	         <option></option>
	      	</select>
	   	</div>
	</div>
	<%} %>
	<%} %>
	<%} %>
	<%if(sanctionAssociateObjectList != null && sanctionAssociateObjectList.size() > 0){ 
	  String valueStr = "";%>
	<%sanctionAssociateObjectList = CMAssociateObjectFieldMappingBean.getSortedListBasedOnDisplayIndex(sanctionAssociateObjectList); %>
	<%for(CMAssociateObjectFieldMapping listObj : sanctionAssociateObjectList){ %>
	<%if(listObj != null && listObj.isEnabled()){%>
	<%String isRequired= listObj.isRequiredEnabled() ? "required" : "";
	 	  String isReadOnly = listObj.isReadOnly() ? "disabled" : "";%>
	<%String attributeName = ""; %>
	<%if(sanctionObjectValueObjEnquiry != null && listObj.getObjectId() == sanctionObjectValueObjEnquiry.getAssociateObjectId()) { %>
	<% try {
	   attributeName = PropertyUtils.getProperty(sanctionObjectValueObjEnquiry, listObj.getColumnName()) != null ?(String) PropertyUtils.getProperty(sanctionObjectValueObjEnquiry, listObj.getColumnName()) : "";
	       valueStr += sanctionObjectValueObjEnquiry.getAssociateObjectId() + ":" + sanctionObjectValueObjEnquiry.getId() + ",";
	   } catch (Exception e) {
	        attributeName = "";
	   }%>
	<%}%>
	<%if(listObj.getId() == sanctionAmountId){ %>
	<div class="col-md-6" style="display:none;"  id="sanctionAmountDiv">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <span aria-required="true" class="required">* </span></label>
	    	<input class="form-control required"  value="<%=attributeName %>" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" id="sanctioned_amount"/>
	</div>
	</div>
	<%}else if(listObj.getId() == tenureId){ %>
	<div class="col-md-6" style="display:none;"  id="tenureDiv">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <span aria-required="true" class="required">* </span></label>
	    	<input class="form-control required" value="<%=attributeName %>"  name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>"/>
	</div>
	</div>
	<%}else if(listObj.getId() == roiId){ %>
	<div class="col-md-6" style="display:none;"  id="roiDiv">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <span aria-required="true" class="required">* </span></label>
	    	<input class="form-control required" value="<%=attributeName %>" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>"/>
	</div>
	</div>
	<%}else{ %>
	<%if (listObj.getFieldType() != null && CMCustomerAssociateObject.FIELD_TYPE_TEXTBOX.equals(listObj.getFieldType())) { %>
	<div class="col-md-6" style="display:none;"  id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" >
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName()%><%=listObj.isRequiredEnabled() ? "<span aria-required=\"true\" class=\"required\">* </span>" : ""%></label>
	<input class="form-control <%= isRequired%>" value="<%=attributeName %>" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" <%=isReadOnly%>/>
	</div>
	</div>
	<%}else if(listObj.getFieldType()!=null && CMCustomerAssociateObject.FIELD_TYPE_SELECTBOX.equals(listObj.getFieldType())){%>
	<%List<String> optionList = CMAssociateObjectFieldMappingBean.getSerializeStringToStringList(listObj); %>
	<div class="col-md-6" style="display:none;"  id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" >
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %><%=listObj.isRequiredEnabled() ? "<span aria-required=\"true\" class=\"required\">* </span>" : ""%></label>
	<select class="form-control select2me <%=isRequired %>" data-placeholder="Select..." id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>">
	<option></option>
	<%if(optionList != null && optionList.size() > 0){ %>
	<%for(String opStr : optionList){ 
	                      	if(StringUtilityClass.isNotNullAndNotEmpty(opStr)){%>
	<option value="<%=opStr%>"><%=opStr %></option>
	<%} %>
	<%} %>
	<%} %>
	</select>
	</div>
	</div>
	<%}else if(listObj.getFieldType()!=null && CMCustomerAssociateObject.FIELD_TYPE__DATE.equals(listObj.getFieldType())){%>
	<div class="col-md-6" style="display:none;"  id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" >
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <%=listObj.isRequiredEnabled()?"<span aria-required=\"true\" class=\"required\">* </span>":"" %></label>
	<input class="form-control date-picker <%=isRequired%>" type="text" value="<%=attributeName %>" id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" <%=isReadOnly%>>
	</div>
	</div>
	<%} %>
	<%} %>
	<%} %>
	<%} %>
	<%} %>
	<%-- <div class="row">
	<div class="col-md-6">
	<%for(CMUpdateAction action : followUpActionList){ %>
	<%if(action != null && action.isEnabled()){ %>
	<div class="col-md-12">
	<div class="form-group">
	<label class="control-label">
	 <input class="form-control action_radio_class required" <%=action.getPriority() == priority ? "checked=\"checked\"" : ""%> id="update_action_<%=action.getId()%>" type="radio" name="update_action_id" value="<%=action.getId()%>"onchange="showOptional(<%=action.getId()%>,'<%=action.getNextSubStatus()%>','<%=action.getEventAction() %>');" />
	<%if(enqActionIdList != null && enqActionIdList.size() > 0 && enqActionIdList.contains(action.getId())){ %>
	<span style="font-size:14px;font-weight:bold;"><%=action.getActionName() %></span>
	<%}else{ %>
	<span><%=action.getActionName() %></span>
	<%} %>
	</label>
	</div>
	</div>
	<%} %>
	<%} %>
	</div>
	</div>
	<%} %>
	</div> --%>
	<%if(enqObj != null && enqObj.getAssignedToId() <= 0 && CMEmployeeBean.cmIdToEmployeeMap != null && CMEmployeeBean.cmIdToEmployeeMap.size() > 0 && CMEmployeeBean.cmIdToEmployeeMap.get(partnerUser.getCmId()) != null && CMEmployeeBean.cmIdToEmployeeMap.get(partnerUser.getCmId()).size() > 0){ %>
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label">Assign To</label>
	<select class="form-control select2me" data-placeholder="Select..." name="assigned_to" id="assigned_to">
	<option>Select a <%=partner.getEmployeeText()%></option>
	<%for(CMEmployee emp : CMEmployeeBean.cmIdToEmployeeMap.get(partnerUser.getCmId())){ %>
	<option value="<%=emp.getId() %>#<%=emp.getName() %>"><%=emp.getName() %></option>
	<%} %>
	</select>
	</div>
	</div>
	<%} %>
	<div class="col-md-6" id="action_update_follow_up_check">
	<div class="form-group">
	<label class="control-label" id="nextFollowUpLbl">Next Follow Up *</label>
	<input class="form-control datetime-old-disable required" type="text" name="next_follow_up" id="action_update_follow_up" />
	</div>
	</div>
	<div class="col-md-6" id="exp_date_closure_check">
	<div class="form-group">
	<label class="control-label">Expected Date Of Closure</label>
	<input class="form-control datetime-old-disable" type="text" name="exp_date_closure" id="exp_date_closure" value=""/>
	</div>
	</div>
	<div class="col-md-12">
	<div class="form-group">
	<label class="control-label">Remarks*</label>
	<textarea class="form-control required" name="remarks" id="follow_up_remarks" rows="2" cols="40"></textarea>
	</div>
	</div>
	</div>
	<div class="row" id="update_action_button">
	<div class="col-md-12 text-right">
	<button class="btn blue" type="submit" name="saveS" value="S&GB"> Save And Go Back </button>
	<button class="btn blue" type="submit" name="saveS" value="S"> Save </button>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="portlet tasks-widget box green">
	<%
	String reallocateDisplayNone = "style=\"display: none;\"";
	if(isShow) {
	reallocateDisplayNone = "";
	isShow = false;
	}
	%>
	<div class="portlet-title showCls">
	<div class="caption">
	<i class="fa fa-cogs"></i>Sales Reallocation
	</div>
	<div class="tools">
	<a href="javascript:;" class="toolsShowCls <%=isShow?"collapse":"expand" %>" data-original-title="" title="">
	</a>
	</div>
	</div>
	<div id="reallocate_div" <%=reallocateDisplayNone %> class="portlet-body">	
	<div class="task-content">
	<div class="slimScrollDiv" style=" width: auto; ">
	<div class="scroller" style="  width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	<form method="post" id="reassgn_lead_form" name="reassgn_lead_form" action="re-assign-to-emp.html" class="validate">
	<input type="hidden" name="lead_member_id" value="<%=enqObj != null ? enqObj.getLeadId() : 0%>"/>
	<input type="hidden" name="enquiry_id" value="<%=enqObj != null ? enqObj.getId() : 0%>" />
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label">Re-allocate To*</label>
	<select class="form-control select2me required" data-placeholder="Select..." name="reassign_to_emp" id="reallocate_to_emp">
	<option></option>
	<%for(CMEmployee emp : CMEmployeeBean.cmIdToEmployeeMap.get(partnerUser.getCmId())){ %>
	<option value="<%=emp.getId() %>"><%=emp.getName() %></option>
	<%} %>
	</select>
	</div>
	</div>
	<div class="col-md-12">
	<div class="form-group">
	<label class="control-label">Remarks*</label>
	<textarea class="form-control required" name="reassign_remarks" id="reassign_remarks" rows="2" cols="40"></textarea>
	</div>
	</div>
	</div>
	<div class="row">
	<div class="col-md-12 text-right">
	<input type="submit" class="btn blue"  name="saveS" style="width: 70px;" value="Save" id=""/>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="portlet tasks-widget box green">
	<%
	String bookingConfirmDisplayNone = "style=\"display: none;\"";
	if(isShow) {
	bookingConfirmDisplayNone = "";
	isShow = false;
	}
	%>
	<div class="portlet-title showCls">
	<div class="caption">
	<i class="fa fa-cogs"></i> Booking Confirm
	</div>
	<div class="tools">
	<a href="javascript:;" class="toolsShowCls <%=isShow ? "collapse" : "expand" %>" data-original-title="" title="">
	</a>
	</div>
	</div>
	<div id="action_div" <%=bookingConfirmDisplayNone %> class="portlet-body">
	<div class="task-content">
	<div class="slimScrollDiv" style=" width: auto; ">
	<div class="scroller" style="  width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	<form method="post" name="action_form" action="booking-confirm.html" id="action_form" class="validate">
	<input type="hidden" name="lead_member_id" value="<%=enqObj.getLeadId()%>"/>
	<input type="hidden" name="lead_new_status" value="<%=WhiteLabelHandler.CONVERT_LEAD_MEMBER_TO_MEMBER%>" />
	<input type="hidden" name="lead_current_status" value="<%=WhiteLabelHandler.CONVERT_LEAD_MEMBER_TO_MEMBER%>" />
	<input type="hidden" name="enquiry_id" value="<%=enqObj.getId()%>" />
	<input type="hidden" id="parentObj_to_childObj" name="parentObj_to_childObj" value="<%=sanctionedDetailsId%>">
	<%if(sanctionAssociateObjectList != null && sanctionAssociateObjectList.size() > 0){ %>
	<%sanctionAssociateObjectList = CMAssociateObjectFieldMappingBean.getSortedListBasedOnDisplayIndex(sanctionAssociateObjectList); %>
	<div class="row">
	<%for(CMAssociateObjectFieldMapping listObj : sanctionAssociateObjectList){%>
	<%if(listObj != null && listObj.isEnabled()){%>
	<%
	String isRequired= listObj.isRequiredEnabled() ? "required" : "";
	String isReadOnly = listObj.isReadOnly() ? "disabled" : "";
	%>
	<%if(listObj.getId() == sanctionAmountId){ %>
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <span aria-required="true" class="required">* </span></label>
	    	<input class="form-control required" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" id="sanctioned_amount"/>
	</div>
	</div>
	<%}else if(listObj.getId() == tenureId){ %>
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <span aria-required="true" class="required">* </span></label>
	    	<input class="form-control required" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>"/>
	</div>
	</div>
	<%}else if(listObj.getId() == roiId){ %>
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <span aria-required="true" class="required">* </span></label>
	    	<input class="form-control required" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>"/>
	</div>
	</div>
	<%}else{ %>
	<%if (listObj.getFieldType() != null && CMCustomerAssociateObject.FIELD_TYPE_TEXTBOX.equals(listObj.getFieldType())) { %>
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName()%><%=listObj.isRequiredEnabled() ? "<span aria-required=\"true\" class=\"required\">* </span>" : ""%></label>
	<input class="form-control <%= isRequired%>" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" <%=isReadOnly%>/>
	</div>
	</div>
	<%}else if(listObj.getFieldType()!=null && CMCustomerAssociateObject.FIELD_TYPE_SELECTBOX.equals(listObj.getFieldType())){%>
	<%List<String> optionList = CMAssociateObjectFieldMappingBean.getSerializeStringToStringList(listObj); %>
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %><%=listObj.isRequiredEnabled() ? "<span aria-required=\"true\" class=\"required\">* </span>" : ""%></label>
	<select class="form-control select2me <%=isRequired %>" data-placeholder="Select..." name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" id="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>">
	<option></option>
	<%if(optionList != null && optionList.size() > 0){ %>
	<%for(String opStr : optionList){ 
	                      	if(StringUtilityClass.isNotNullAndNotEmpty(opStr)){%>
	<option value="<%=opStr%>"><%=opStr %></option>
	<%} %>
	<%} %>
	<%} %>
	</select>
	</div>
	</div>
	<%}else if(listObj.getFieldType()!=null && CMCustomerAssociateObject.FIELD_TYPE__DATE.equals(listObj.getFieldType())){%>
	<div class="col-md-6">
	<div class="form-group">
	<label class="control-label"><%=listObj.getDisplayName() %> <%=listObj.isRequiredEnabled()?"<span aria-required=\"true\" class=\"required\">* </span>":"" %></label>
	<input class="form-control date-picker <%=isRequired%>" type="text" name="<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>" <%=isReadOnly%>>
	</div>
	</div>
	<%} %>
	<%} %>
	<%} %>
	<%} %>
	</div>
	<%} %>
	<div class="row">
	  	<div class="col-md-12">
	<div class="form-group">
	<label class="control-label">Remarks</label>
	<textarea class="form-control" name="remarks" id="remarks" rows="2" cols="40"></textarea>
	</div>
	</div>
	</div>
	<div class="row">
	  	<div class="col-md-12 text-right">
	<button class="btn blue" type="submit" name="saveS" value="SvCnf"> Save </button>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="portlet tasks-widget box green">
	<div class="portlet-title showCls">
	<div class="caption">
	<i class="fa fa-cogs"></i> Booking Rejection
	</div>
	<div class="tools">
	<a href="javascript:;" class="toolsShowCls <%=isShow ? "collapse" : "expand" %>" data-original-title="" title="">
	</a>
	</div>
	</div>
	<%	
	String bookingRejectionDisplayNone = "style=\"display: none;\"";
	if(isShow) {
	bookingRejectionDisplayNone = "";
	isShow = false;
	}
	%>
	<div class="portlet-body" id="booking_reject_div" <%=bookingRejectionDisplayNone %>>
	<div class="task-content">
	<div class="slimScrollDiv" style=" width: auto; ">
	<div class="scroller" style="  width: auto;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2" data-initialized="1">
	<form method="post" name="booking_reject_from" id="booking_reject_from" action="booking-rejected.html" class="validate" onsubmit="return bookingReject();">
	<input type="hidden" name="lead_member_id" value="<%=enqObj.getLeadId()%>"/>	
	<input type="hidden" name="lead_new_status" value="<%=WhiteLabelHandler.LEAD_MEMBER_ANSWERED%>" />
	<input type="hidden" name="lead_current_status" value="<%=WhiteLabelHandler.LEAD_MEMBER_ANSWERED%>" />
	<%String enqSubStatus = StringUtilityClass.isNotNullAndNotEmpty(enqObj.getSubStatus()) ? enqObj.getSubStatus() : ""; %>
	<input type="hidden" name="enquiry_sub_status" value="<%=enqSubStatus%>" />
	<input type="hidden" name="update_reject_action_id" id="update_reject_action_id">
	<input type="hidden" name="enquiry_id" value="<%=enqObj.getId()%>" />
	<div class="row">
	<div class="col-md-12">
	<div class="form-group">
	<label class="control-label">Remarks*</label>
	<textarea class="form-control required" name="remarks" id = "booking_reject_remarks" rows="2" cols="40"></textarea>
	</div>
	</div>
	</div>
	<div class="row" id="update_action_button">
	<div class="col-md-12 text-right">
	<button class="btn blue" type="submit" name="saveS" value="S&GB"> Save And Go Back </button>
	<button class="btn blue" type="submit" name="saveS" value="S"> Save </button>
	</div>
	</div>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="portlet tasks-widget box green">
	<%
	String createTaskOnEnquiry = "style=\"display: none;\"";
	if(isShow) {
	createTaskOnEnquiry = "";
	isShow = false;
	}
	%>
	<div class="portlet-title showCls">
	<div class="caption">
	<i class="fa fa-ticket"></i>
	Add <%=partner.getTicketText() %>
	</div>
	<div class="tools">
	<a href="javascript:;" class="toolsShowCls <%=isShow?"collapse":"expand" %>" data-original-title="" title="">
	</a>
	</div>
	</div>
	<div class="portlet-body" id="create_task_on_enq" <%=createTaskOnEnquiry %>>
	<div class="task-content">
	<form name="task_form" id="task_form" action="new-tickets.html" method="POST" class="validate" target="_blank">
	<input type="hidden" name="customer_id" value="<%=enqObj != null ? enqObj.getLeadId() : 0%>"/>
	<input type="hidden" name="customer_name" value="<%=leadObj != null ? leadObj.getName() : "" %>"/>
	<input type="hidden" name="customer_code" value="<%=leadObj != null ? leadObj.getCustomerCode() : ""%>" />
	<input type="hidden" name="contact_id" value="<%=enqObj != null && enqObj.getPrimaryContact() != null ? enqObj.getPrimaryContact().getId() : 0%>"/>
	<input type="hidden" name="contact_name" value="<%=enqObj != null && enqObj.getPrimaryContact() != null ? enqObj.getPrimaryContact().getName() : ""%>" />
	<input type="hidden" name="contact_phone" value="<%=enqObj != null && enqObj.getPrimaryContact() != null ? enqObj.getPrimaryContact().getPhone() : ""%>"/>
	<input type="hidden" name="contact_email" value="<%=enqObj != null && enqObj.getPrimaryContact() != null ? enqObj.getPrimaryContact().getEmail() : ""%>" />
	<input type="hidden" name="enquiry_id" value="<%=enqObj != null ? enqObj.getId() : 0%>" />
	</form>
	<div class="row">
	<div class="col-md-12">
	<span class="bold inline-block"  style="color: #666;margin-top: 5px;">	
	Click <a href="javascript:;" style="text-decoration : none;" onclick="$('#task_form').submit()" target="_blank"><span style="color: red; font-weight: bold; font-size: initial;" id="clickHereId"> here </span></a>  to create a <%=partner.getTicketText() %> for this <%=partner.getLeadText() %>
	</span>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%} %>
	</div>
	<%  %>
	</div>
	<div class="row">
	<div class="col-xs-12">
	<div class="portlet box green">
	<div class="portlet-title">
	<div class="caption">
	<i class="fa fa-briefcase"></i>Details
	</div>
	</div>
	<div class="portlet-body">
	<div class="tabbable-line">
	<ul class="nav nav-tabs">
	<%if(showSanctionedDetails && sanctionedAssociateObjectValueObjEnquiry != null){ %>
	<li>
	<a href="#details_tab_1" data-toggle="tab">
	Sanctioned Details</a>
	</li>
	<%} %>
	<%if(avldata){ %>
	<li>
	<a href="#details_tab_2" data-toggle="tab">Application Details</a>
	</li>
	<%} %>
	<%if(enqObj != null && enqObj.getFilePath() != null && !"".equals(enqObj.getFilePath()) && !isDSA){ %>
	<li>
	<a href="#details_tab_3" data-toggle="tab">Attached Documents</a>
	</li>
	<%} %>
	<%if(enquiryAditionalFieldsList != null && enquiryAditionalFieldsList.size() > 0 && !isDSA){ %>
	<li>
	<a href="#details_tab_4" data-toggle="tab">Additional Fields</a>
	</li>
	<%} %>
	<%if(enqObj != null && StringUtilityClass.isNotNullAndNotEmpty(enqObj.getBanquetTermsAndConditions())){ %>
	<li>
	<a href="#details_tab_5" data-toggle="tab">Other Documents - DSA</a>
	</li>
	<%} %>
	</ul>
	<div class="tab-content">
	<%if(showSanctionedDetails && sanctionedAssociateObjectValueObjEnquiry != null){ %>
	<div class="row tab-pane <%=tabActive ? "active" : "" %>"  id="details_tab_1">
	<div class="col-md-12">
	<div class="portlet box green" style="width: 97%;margin-left: 1.5%;">
	<div class="portlet-title">
	<div class="caption">
	Details
	            	</div>
	</div>
	<div class="portlet-body flip-scroll">
	<div class="row">
	<%if(sanctionAssociateObjectList != null && sanctionAssociateObjectList.size() > 0){ %>
	<%sanctionAssociateObjectList = CMAssociateObjectFieldMappingBean.getSortedListBasedOnDisplayIndex(sanctionAssociateObjectList); %>
	<%for(CMAssociateObjectFieldMapping listObj : sanctionAssociateObjectList){ %>
	<%if(listObj != null && listObj.isEnabled()){ %>
	<%if(isDSA){ %>
	<%if(listObj.getId() == sanctionAmountId || listObj.getId() == tenureId || listObj.getId() == roiId){ %>
	<%
	String columnName = listObj.getDisplayName();
	String attributeName = "";
	if(sanctionedAssociateObjectValueObjEnquiry != null && listObj.getObjectId() == sanctionedAssociateObjectValueObjEnquiry.getAssociateObjectId()){
	try{
	attributeName = (String)PropertyUtils.getProperty(sanctionedAssociateObjectValueObjEnquiry, listObj.getColumnName());
	}catch(Exception e){
	attributeName = "";
	}
	}
	%>
	<div class="col-md-6">
	<div class="form-group">
	                                                            <label class="control-label" style="font-weight: bold;"><%=columnName %> : </label>
	                                                            <label class="control-label"><%=attributeName != null ? attributeName : "" %></label>
	                                                         </div>
	</div>
	<%} %>
	<%}else{ %>
	<%
	String columnName = listObj.getDisplayName();
	String attributeName = "";
	if(sanctionedAssociateObjectValueObjEnquiry != null && listObj.getObjectId() == sanctionedAssociateObjectValueObjEnquiry.getAssociateObjectId()){
	try{
	attributeName = (String)PropertyUtils.getProperty(sanctionedAssociateObjectValueObjEnquiry, listObj.getColumnName());
	}catch(Exception e){
	attributeName = "";
	}
	}
	%>
	<div class="col-md-6">
	<div class="form-group">
	                                                            <label class="control-label" style="font-weight: bold;"><%=columnName %> : </label>
	                                                            <label class="control-label"><%=attributeName != null ? attributeName : "" %></label>
	                                                         </div>
	</div>
	<%} %>
	<%} %>
	<%} %>
	<%} %>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%tabActive = false; %>
	<%} %>
	<%if(avldata){ %>
	<div class="row tab-pane <%=tabActive ? "active" : "" %>"  id="details_tab_2">
	<div class="col-md-12">
	<div class="portlet box green" style="width: 97%;margin-left: 1.5%;">
	<div class="portlet-title">
	<div class="caption">
	Form Details
	            	</div>
	</div>
	<div class="portlet-body flip-scroll">
	<div class="row">
	<%if(associateObjectList != null && associateObjectList.size() > 0){ %>
	<%associateObjectList = CMAssociateObjectFieldMappingBean.getSortedListBasedOnDisplayIndex(associateObjectList); %>
	<%if(allowEdit){ %>
	<div class="col-md-12">
	<button type="button" style="float: right;" class="btn btn-xs blue" name="tabid" id="existing_template_id" onclick="addAssociateData(<%=applicationFormId%>,'<%=associateObj.getDisplayName()%>','<%=enqObj != null ? enqObj.getLeadId() : 0 %>','<%=refIdObStr%>', '<%=enqObj != null ? enqObj.getId() : 0%>');">Edit</button>
	</div>
	<%} %>
	<%for(CMAssociateObjectFieldMapping listObj : associateObjectList){ %>
	<%if(listObj != null && listObj.isEnabled()){ %>
	<%
	String columnName = listObj.getDisplayName();
	String attributeName = "";
	if(associateObjectValueObjEnquiry != null && listObj.getObjectId() == associateObjectValueObjEnquiry.getAssociateObjectId()){
	try{
	attributeName = (String)PropertyUtils.getProperty(associateObjectValueObjEnquiry, listObj.getColumnName());
	}catch(Exception e){
	attributeName = "";
	}
	}else{
	CMCustomerAssociateObjectValue	childAssociateObjectValueObj = null ; 
	 	if(childObjEnqList != null && childObjEnqList.size() > 0 && objectIdToObjectValuesEnquiry != null && objectIdToObjectValuesEnquiry.size() > 0){ 
	 	for(CMCustomerAssociateObject assObj: childObjEnqList){ 
	 	if(assObj.getId() == listObj.getObjectId()){ 
	 	childAssociateObjectValueObj = objectIdToObjectValuesEnquiry.get(assObj.getId()); 
	 	break;
	 	} 
	 	} 
	 	}
	 	if(childAssociateObjectValueObj != null){
	 	try{
	 	attributeName = (String)PropertyUtils.getProperty(childAssociateObjectValueObj, listObj.getColumnName());
	 	}catch(Exception e){
	 	attributeName = "";
	 	}
	 	}
	}
	%>
	<%if(listObj.getId() == panFileId || listObj.getId() == adharFileId || listObj.getId() == otherDocumentId){ %>
	<%
	String filePath = "";
	if(StringUtilityClass.isNotNullAndNotEmpty(attributeName)){
	String[] array = attributeName.split("::");
	if(array != null && array.length > 2){
	filePath = array[2] != null ? array[2] : "";
	}
	}
	%>
	<div class="col-md-6">
	<div class="form-group">
	                                                            <label class="control-label" style="font-weight: bold;"><%=columnName %> : </label>
	                                                            <%if(StringUtilityClass.isNotNullAndNotEmpty(filePath)){ %>
	<label class="control-label"><a href="<%=filePath %>" target="_blank">View</a></label>
	<%} %>
	                                                         </div>
	</div>
	<%}else if(listObj.getId() == bankStatementFileId || listObj.getId() == monthSlipsFileId || listObj.getId() == currentAddressProofFileId){ %>
	<%
	String[] fileArr = null;
	if(StringUtilityClass.isNotNullAndNotEmpty(attributeName)){
	fileArr = attributeName.split("#");
	}
	%>
	<%if(fileArr != null && fileArr.length > 0){ %>
	<%for(int index = 0; index < fileArr.length; index++){ %>
	<%String eachFile = fileArr[index]; %>
	<%if(StringUtilityClass.isNotNullAndNotEmpty(eachFile)){ %>
	<%
	String filePath = "";
	String[] array = eachFile.split("::");
	if(array != null && array.length > 2){
	filePath = array[2] != null ? array[2] : "";
	}
	%>
	<div class="col-md-6">
	<div class="form-group">
	                                                            <label class="control-label" style="font-weight: bold;"><%=columnName %> : </label>
	                                                            <%if(StringUtilityClass.isNotNullAndNotEmpty(filePath)){ %>
	<label class="control-label"><a href="<%=filePath %>" target="_blank">View</a></label>
	<%} %>
	                                                         </div>
	</div>
	<%} %>
	<%} %>
	<%} %>
	<%}else{ %>
	<div class="col-md-6">
	<div class="form-group">
	                                                            <label class="control-label" style="font-weight: bold;"><%=columnName %> : </label>
	                                                            <label class="control-label"><%=attributeName != null ? attributeName : "" %></label>
	                                                         </div>
	</div>
	<%} %>
	<%} %>
	<%} %>
	<%} %>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%tabActive = false; %>
	<%} %>
	<%if(enqObj != null && enqObj.getFilePath() != null && !"".equals(enqObj.getFilePath()) && !isDSA){ %>
	<div class="row tab-pane <%=tabActive ? "active" : "" %>"  id="details_tab_3">
	<div class="col-md-12">
	<div class="portlet box green" style="width: 97%;margin-left: 1.5%;">
	<div class="portlet-title">
	<div class="caption">
	Documents
	            	</div>
	</div>
	<div class="portlet-body flip-scroll">
	<div class="row">
	<%if(enqObj.getFilePath().contains("##")){ %>
	<%String fileArr[] = enqObj.getFilePath().split("##");%>
	<%if(fileArr != null && fileArr.length > 0){ %>
	<%for(String eachFile : fileArr){ %>
	<%if(eachFile != null && !"".equals(eachFile)){ %>
	<%
	String fileNameStr = "";
	int lastIndexOf = eachFile.lastIndexOf("/") + 1;
	fileNameStr = eachFile.substring(lastIndexOf);
	%>
	<div class="col-md-12"><a href="<%=eachFile %>" target="_blank"><%=fileNameStr != null && !"".equals(fileNameStr) ? fileNameStr : "Download File" %></a></div>
	<%} %>
	<%} %>
	<%} %>
	<%}else{ %>
	<%
	String fileNameStr = "";
	int lastIndexOf = enqObj.getFilePath().lastIndexOf("/") + 1;
	fileNameStr = enqObj.getFilePath().substring(lastIndexOf);
	%>
	<div class="col-md-12"><a href="<%=enqObj.getFilePath() %>" target="_blank"><%=fileNameStr != null && !"".equals(fileNameStr) ? fileNameStr : "Download File" %></a></div>
	<%} %>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%tabActive = false; %>
	<%} %>
	<%if(enquiryAditionalFieldsList != null && enquiryAditionalFieldsList.size() > 0 && !isDSA){ %>
	<div class="row tab-pane <%=tabActive ? "active" : "" %>"  id="details_tab_4">
	<div class="col-md-12">
	<div class="portlet box green" style="width: 97%;margin-left: 1.5%;">
	<div class="portlet-title">
	<div class="caption">
	Details
	            	</div>
	</div>
	<div class="portlet-body flip-scroll">
	<div class="row">
	<div class="col-md-12">
	<button type="button" style="float: right;" class="btn btn-xs blue" name="teditid" id="existing_template_id" onclick="editAdditionalEnquiryFields()">Edit</button>
	</div>
	<%for(CMAdditionalFieldsMapping obj : enquiryAditionalFieldsList){ %>
	<%if(obj != null && obj.isEnabled()){ %>
	<%
	String databaseStoredValue = "";
	try{
	databaseStoredValue = (String)PropertyUtils.getProperty(enqObj, obj.getColumnName());
	databaseStoredValue = StringUtilityClass.isNotNullAndNotEmpty(databaseStoredValue) ? databaseStoredValue : "";
	}catch(Exception e){
	databaseStoredValue = "";
	}
	%>
	<div class="col-md-6">
	<div class="form-group">
	                                                            <label class="control-label" style="font-weight: bold;"><%=obj.getDisplayName() %> : </label>
	                                                            <label class="control-label"><%=databaseStoredValue %></label>
	                                                         </div>
	</div>
	<%} %>
	<%} %>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%tabActive = false; %>
	<%} %>
	<%if(enqObj != null && StringUtilityClass.isNotNullAndNotEmpty(enqObj.getBanquetTermsAndConditions())){ %>
	<div class="row tab-pane <%=tabActive ? "active" : "" %>"  id="details_tab_5">
	   <div class="col-md-12">
	      <div class="portlet box green" style="width: 97%;margin-left: 1.5%;">
	         <div class="portlet-title">
	            <div class="caption">
	               Documents
	            </div>
	         </div>
	         <div class="portlet-body flip-scroll">
	            <div class="row">
	               <%if(enqObj.getBanquetTermsAndConditions().contains("#")){ %>
	               <%String fileArr[] = enqObj.getBanquetTermsAndConditions().split("#");%>
	               <%if(fileArr != null && fileArr.length > 0){ %>
	               <%for(String eachFile : fileArr){ %>
	               <%if(eachFile != null && !"".equals(eachFile)){ %>
	               <%
	                  String fileNameStr = "";
	                  String fileUploadedPathStr = "";
	                  String[] fileDetailsArr = eachFile.split("::");
	                  if(fileDetailsArr != null && fileDetailsArr.length > 2){
	                  fileNameStr = fileDetailsArr[0];
	                  fileUploadedPathStr = fileDetailsArr[2];
	                  }
	                  %>
	               <div class="col-md-12"><a href="<%=fileUploadedPathStr %>" target="_blank"><%=fileNameStr != null && !"".equals(fileNameStr) ? fileNameStr : "Download File" %></a></div>
	               <%} %>
	               <%} %>
	               <%} %>
	               <%}else{ %>
	               <%
	                  String fileNameStr = "";
	                  String fileUploadedPathStr = "";
	                  String[] fileDetailsArr = enqObj.getBanquetTermsAndConditions().split("::");
	                  if(fileDetailsArr != null && fileDetailsArr.length > 2){
	                  fileNameStr = fileDetailsArr[0];
	                  fileUploadedPathStr = fileDetailsArr[2];
	                  }
	                  %>
	               <div class="col-md-12"><a href="<%=fileUploadedPathStr %>" target="_blank"><%=fileNameStr != null && !"".equals(fileNameStr) ? fileNameStr : "Download File" %></a></div>
	               <%} %>
	            </div>
	         </div>
	      </div>
	   </div>
	</div>
	<%} %>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%if(!isDSA){ %>
	<div class="row">
	<div class="col-xs-12">
	<div class="portlet box green">
	<div class="portlet-title">
	<div class="caption">
	<i class="fa fa-briefcase"></i>Description
	</div>
	</div>
	<div class="portlet-body">
	<div class="tabbable-line">
	<ul class="nav nav-tabs ">
	<%if(notesList != null && notesList.size() > 0){ %>
	<li <%=active?"class=\"active\"":"" %>>
	<a href="#tab_15_4" data-toggle="tab">
	All Notes </a>
	</li>
	<%active = false;%>
	<%} %>
	<%if(actionList != null && actionList.size() > 0){ %>
	<li <%=active?"class=\"active\"":"" %>>
	<a href="#tab_15_11" data-toggle="tab">
	Action History</a>
	</li>
	<%active = false;%>
	<%} %>
	</ul>
	<%active = true; %>
	<div class="tab-content">
	<%if(notesList != null && notesList.size() > 0){ %>
	<div class="tab-pane <%=active ? "active" : "" %>" id="tab_15_4">
	<table class="table table-bordered table-striped table-condensed dataTab flip-content">
	<thead class="flip-content">
	<tr>
	<th>Create Date</th>
	<th>Details</th>
	</tr>
	</thead>
	<tbody>
	<%for(CMNotes notesObj : notesList){ %>
	<%
	String dateToShow = TimeZoneUtils.getStringForTimestampISTtoPartnerZone(partner, partnerUser.getEmployee(), notesObj.getDate(), "dd MMM, yyyy HH:mm");
	dateToShow = StringUtilityClass.isNotNullAndNotEmpty(dateToShow) ? dateToShow : "N/A";
	%>
	<tr>
	        	<td>
	              <%=dateToShow %>
	            </td>
	            <td>
	               <%=notesObj.getDetail()!=null && !(notesObj.getDetail()).equals("") ? notesObj.getDetail() : "N/A"%>
	            </td>
	        </tr> 
	<%} %>
	</tbody>
	</table>
	</div>
	<%active=false; %>
	<%} %>
	<%if(actionList != null && actionList.size() > 0){ %>
	<div class="tab-pane <%=active?"active":"" %>" id="tab_15_11">
	<table class="table table-bordered table-striped table-condensed dataTab flip-content">
	<thead class="flip-content">
	<tr>
	<th>Action</th>
	<th>Date</th>
	<th>Next Follow Up Date</th>
	<th>Remarks</th>
	</tr>
	</thead>
	<tbody>
	<%for(CMEnquiryAction action : actionList){%>
	<%if(action != null){ %>
	<%
	String actionName = "";
	if(actionIdToObjMap != null && actionIdToObjMap.size() > 0){
	actionName = actionIdToObjMap.get(action.getActionId()) != null ? actionIdToObjMap.get(action.getActionId()) : "";
	}
	String createDateStr = "";
	if(action.getCreateDate() != null){
	//createDateStr = DateUtils.getDateInDdMmYyyyHhMmInUIFormat(action.getCreateDate());
	createDateStr = TimeZoneUtils.getStringForTimestampISTtoPartnerZone(partner, partnerUser.getEmployee(), action.getCreateDate(), "dd MMM, yyyy HH:mm");
	}
	String nextFStr = "";
	if(action.getNextFollowup() != null){
	//nextFStr = DateUtils.getDateInDdMmYyyyHhMmInUIFormat(action.getNextFollowup());
	nextFStr = TimeZoneUtils.getStringForTimestampISTtoPartnerZone(partner, partnerUser.getEmployee(), action.getNextFollowup(), "dd MMM, yyyy HH:mm");
	}
	String remStr = action.getRemarks() != null ? action.getRemarks() : "";
	%>
	<tr>
	<td><%=actionName %></td>
	<td><%=StringUtilityClass.isNotNullAndNotEmpty(createDateStr) ? createDateStr : "N/A" %></td>
	<td><%=StringUtilityClass.isNotNullAndNotEmpty(nextFStr) ? nextFStr : "N/A" %></td>
	<td><%=remStr %></td>
	</tr>
	<%}%>
	<%} %>
	</tbody>
	</table>
	</div>
	<%active=false; %>
	<%} %>	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<%} %>
	</div>
	</div>
	</div>
	
	<div class="modal fade" id="attachFilePopUp" tabindex="-1" role="basic" aria-hidden="true">
	        <div class="modal-dialog" style="width:800px">
	            <div class="modal-content">
	                <!-- BEGIN Portlet PORTLET-->
	                <div class="portlet box blue-hoki">
	                    <div class="portlet-title">
	                        <div class="caption">
	                            Attach File
	                        </div>
	                        <div class="actions">
	                            <i style="top: 3px; position: relative; font-size: 18px;cursor:pointer" data-dismiss="modal" aria-hidden="true" class="fa fa-times"></i>
	                        </div>
	                    </div>
	                    <div class="portlet-body">
	                        <div class="horizontal-form margin-bottom-20">
	                            <div class="form-body">
	<form id="updateDueDateForm" method="post" action="attach-files-to-enquiry.html" class="validate" enctype="multipart/form-data">
	<input type="hidden" name="enquiry_id" value="<%=enqObj.getId() %>">
	<input type="hidden" name="lead_member_id" value="<%=enqObj.getLeadId() %>">
	<input type="hidden" id="file_attachment_action_id" name="update_action_id"  />
	<input type="hidden" id="send_notification_to_assigned_to" name="send_notification_to_assigned_to" value="yes" />
	<div id="attach_div" class="col-md-6">
	<div class="form-group">
	<label class="control-label">File</label>
	<input type="file" name="attach_file">
	</div>
	</div>
	<div class="row">
	<div class="col-md-12 text-right">
	<button type="submit">Attach</button>
	</div>
	</div>
	</form>
	                	</div>
	            	</div>
	        	 </div>
	    	  </div>
	   	  </div>
	  	  </div>
	    </div>
	    
	    <div class="modal fade" id="quoatationsPopUp" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog" style="width:800px">
	<div class="modal-content">
	<div class="portlet box blue-hoki" style="width: 115%;">
	<div class="portlet-title">
	<div class="caption">Quotation </div>
	<div class="actions">
	<div class="btn-group">
	<button type="button" class="btn blue-hoki dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i> More </button>
	<ul class="dropdown-menu dropdown_class" role="menu" aria-labelledby="btnGroupVerticalDrop1" style="left:-100px;">
	                                 <li>
	                                    <a href="javascript:;" onClick="showCcBccFunc()" id="title_div">
	                                  	<i class="fa fa-circle-o-notch"></i><span>CC/BCC</span></a>
	                                </li> 
	                            </ul> 
	</div>
	<i style="top: 3px; position: relative; font-size: 18px;cursor:pointer" data-dismiss="modal" aria-hidden="true" class="fa fa-times"></i>
	</div>
	</div>
	<div class="portlet-body">
	<div class="scroller" style="height: 600px;" data-always-visible="1" data-rail-visible="0" data-handle-color="#D7DCE2">
	<div class="horizontal-form margin-bottom-20">
	<div class="form-body">
	<div class="row">
	<div class="col-md-12">
	<%if(GenericQuotationTemplateBean.genericQuotationTemplateByCMIDMap!=null && GenericQuotationTemplateBean.genericQuotationTemplateByCMIDMap.size()>0 && GenericQuotationTemplateBean.genericQuotationTemplateByCMIDMap.containsKey(cmId)) {%>
	<button class="btn blue" type="button" onclick="download(0)">Download</button>
	<button class="btn blue" type="button" onclick="sendEmail(1)">Send Email As Attachment</button>
	<button class="btn blue" type="button" onclick="sendQuoFunc()">Send Email in Email Body</button>
	<button class="btn blue" type="button" onclick="save(2)">Save</button>
	<%} %>
	</div>
	</div>
	<div class="row">
	<div class="col-md-12">
	<div id="quotationsDiv" >
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<div class="modal fade" id="contactEditDiv" tabindex="-1" role="basic" aria-hidden="true" style="z-index: 1000;margin-top: 50px;">
	        <div class="modal-dialog" style="width:800px">
	            <div class="modal-content">
	            	<form id="editContactForm" action="add-more-contact-detail.html" method="post" class="validate">
	<input type="hidden" name="enquiry_id" id="enquiry_id" value="<%=enqObj.getId()%>">
	<input type="hidden" name="lead_member_id" id="lead_member_id_hidden" value="<%=enqObj.getLeadId()%>">
	<input type="hidden" name="contact_id" id="contact_id">
	<input type="hidden" name="check_enquiry_page" id="check_enquiry_page" value="yes">
	                <div class="portlet box blue-hoki">
	                    <div class="portlet-title">
	                        <div class="caption">
	                            Add <%=partner.getLeadText() %> Contacts
	                        </div>
	                        <div class="actions">
	                            <i style="top: 3px; position: relative; font-size: 18px;cursor:pointer" data-dismiss="modal" aria-hidden="true" class="fa fa-times"></i>
	                        </div>
	                    </div>
	                    <div class="portlet-body">
	                        <div class="horizontal-form margin-bottom-20">
	                            <div class="form-body">
	<div class="row">
	<div class="col-md-3">
	<div class="form-group">
	<label class="control-label">Title*</label>
	<%String enqTitle = enqObj.getPrimaryContact() != null && enqObj.getPrimaryContact().getTitle() != null ? enqObj.getPrimaryContact().getTitle() : ""; %>
	<select class="form-control select2me required" data-placeholder="Select..." id="title" name="title">
	<option></option>
	<%
	String mrSelect = "";
	String mrsSelect = "";
	String msSelect = "";
	String masterSelect = "";
	if(StringUtilityClass.isNotNullAndNotEmpty(enqTitle)) {
	if(enqTitle.equals("Mr.")) {
	mrSelect = "selected=\"selected\"";
	} else if(enqTitle.equals("Mrs.")) {
	mrsSelect = "selected=\"selected\"";
	} else if(enqTitle.equals("Ms.")) {
	msSelect = "selected=\"selected\"";
	} else if(enqTitle.equals("Master.") || enqTitle.equals("Master.")) {
	masterSelect = "selected=\"selected\"";
	}
	}
	%>
	<option value="Mr." <%=mrSelect %>>Mr.</option>
	<option value="Mrs." <%=mrsSelect %>>Mrs.</option>
	<option value="Ms." <%=msSelect %>>Ms.</option>	
	<option value="Master." <%=masterSelect %>>Master.</option>	
	</select>
	</div>
	</div>
	<div class="col-md-3">
	<div class="form-group">
	<label class="control-label">Contact Person Name <span aria-required="true" class="required">* </span></label>
	<input type="text" value="<%=enqObj.getPrimaryContact() != null && enqObj.getPrimaryContact().getContactPerson() != null ? enqObj.getPrimaryContact().getContactPerson() : "" %>" class="form-control required" name="name" id="name"></input>
	<span class="help-block">
	</span>
	</div>
	</div>
	<div class="col-md-3">
	<div class="form-group">
	<label class="control-label"><%=partner.getCmId() != 312 ? "Phone" : "Mobile Number" %><span aria-required="true" class="required">* </span></label>
	<input type="text" value="<%=enqObj.getPrimaryContact() != null && enqObj.getPrimaryContact().getPhone() != null ? enqObj.getPrimaryContact().getPhone() : "" %>" class="form-control required" name="phone" id="phone"  onblur="checkDuplicatesPhone(this)"  /> 	  
	<input type="hidden" id="hidden_phone" />
	<span id="phone_msg" style="display: none;"></span>
	</div>
	</div>
	<div class="col-md-3">
	<div class="form-group">
	<label class="control-label">E-Mail</label>
	<input class="form-control" type="email" value="<%=enqObj.getPrimaryContact() != null && enqObj.getPrimaryContact().getEmail() != null ? enqObj.getPrimaryContact().getEmail() : ""  %>" name="email" id="email" onblur="checkDuplicatesEmail(this)" />   
	<span id="email_msg" style="display: none;"></span>
	<input type="hidden" id="hidden_email" />
	</div>
	</div>
	<div class="col-md-3" <%=(partner.getCmId() == 312 || partner.getCmId() == 247) ? "style=\"display:none;\"" : "" %>>
	<div class="form-group">
	<label class="control-label">Birth Date</label>
	<input class="form-control date-picker" type="text" name="dob" id="dob">
	<span class="help-block">
	</span>
	</div>
	</div>
	<div class="col-md-3" <%=(partner.getCmId() == 312 || partner.getCmId() == 247) ? "style=\"display:none;\"" : "" %>>
	<div class="form-group">
	<label class="control-label">Anniversary Date</label>
	<input class="form-control date-picker" type="text" name="anniversary_date" id="anniversary_date">
	<span class="help-block">
	</span>
	</div>
	</div>
	<div class="col-md-3">
	<div class="form-group">
	<label class="control-label"><%=partner.getCmId() == 312 ? "Phone" : "Additional Phone" %></label>
	<input class="form-control" type="text" value="" name="additional_phone" id="additional_phone" onblur="checkDuplicatesAdditionalPhone(this);"/>
	<span id="additional_phone_msg" style="display: none;"></span>
	<input type="hidden" id="hidden_additional_phone" />
	</div>
	</div>
	<div class="col-md-3">
	<div class="form-group">
	<label class="control-label">Additional E-Mail</label>
	<input class="form-control" type="email" value="" name="additional_email" id="additional_email" class="text" onblur="checkDuplicatesAdditionalEmail(this)" /> 
	<span id="additional_email_msg" style="display: none;"></span>
	<input type="hidden" id="hidden_additional_email" />
	</div>
	</div>
	<div class="col-md-3" <%=(partner.getCmId() == 312 || partner.getCmId() == 247) ? "style=\"display:none;\"" : "" %>>
	<div class="form-group">
	<label class="control-label">Designation Type</label>
	<select class="form-control select2me" data-placeholder="Select..." name="designation_type" id="designation_type">
	<option></option>
	<option value="FLM">FLM</option>
	<option value="MLM">MLM</option>
	<option value="SLM">SLM</option>
	<option value="TLM">TLM</option>
	</select>
	</div>
	</div>
	<div class="col-md-3" <%=partner.getCmId() == 247 ? "style=\"display:none;\"" : "" %>>
	<div class="form-group">
	<label class="control-label">Designation</label>
	<%if(customerDesignation != null && customerDesignation.size() > 0){%>
	<select class="form-control select2me" data-placeholder="Select..." name="designation" id="designation_select">
	<option></option>
	<%for(CMCustomerDesignation designation : customerDesignation){%>
	<option value="<%=designation.getName()%>"><%=designation.getName()%></option>
	<%}%>
	<option value="others">others</option>
	</select>
	<%}else{%>
	<input class="form-control" type="text" name="designation" id="designation" />
	<%} %>
	</div>
	</div>
	</div>
	<div class="row">
	<div class="col-md-12 text-right">
	   <span id="duplicate_contact_msg" style="display: none;color: red;font-weight: 600;margin-right: 129px;"></span>
	<input class="btn blue" id="moreContactsSubmit" type="submit" value="Update"/>
	</div>
	</div>
	                	</div>
	            	</div>
	        	</div>
	    	</div>
	    	</form>
	   	</div>
	  	</div>
	</div>
	
	<div class="modal fade" id="confirmationPopUp" tabindex="-1" role="basic" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <!-- BEGIN Portlet PORTLET-->
	  <div class="portlet box blue-hoki">
	                    <div class="portlet-title">
	                        <div class="caption">
	                        </div>
	                        <div class="actions">
	                            <i style="top: 3px; position: relative; font-size: 18px;cursor:pointer" data-dismiss="modal" aria-hidden="true" class="fa fa-times"></i>
	                        </div>
	                    </div>
	                    <div class="portlet-body">
	                        <div class="horizontal-form margin-bottom-20">
	                            <div class="form-body">
	<div class="row">
	<div class="form-group" style="margin-left: 3%">
	Are You sure you want to delete? Data once deleted cannot be retrieved back.
	      </div>
	</div>
	   <div class="row">
	 <div class="col-md-6 text-left">
	 	<button  class="btn btn-danger" onclick="cancelFunc();" type="button"> No </button>
	 </div>
	 <div class="col-md-6 text-right">
	 	<button  class="btn btn-success" onclick="continueFileDelFunc();" type="button"> Yes </button>
	 </div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<div id="leadRowPriviewId" class="modal fade">
	<div class="modal-dialog" style="width:900px">
	<div class="modal-content">
	<div class="portlet box blue-hoki">
	<div class="portlet-title">
	                        <div class="caption">
	                            Send
	                        </div>
	                        <div class="actions">
	                            <i style="top: 3px; position: relative; font-size: 18px;cursor:pointer" data-dismiss="modal" aria-hidden="true" class="fa fa-times"></i>
	                        </div>
	                    </div>
	                    <div class="portlet-body">
	                    	<div class="scroller1" style="height: 460px;">
	                    	<div class="horizontal-form margin-bottom-5">
	                    	<div class="form-body">	
	                    	<form action="send-lead-email.html" method="post" id="emailTaskFieldSet" name="lead-email-form" class="" enctype="multipart/form-data">
	                    	<input type="hidden" name="lead_member_id" id="email_lead_id" value="<%=enqObj.getLeadId()%>">
	<input type="hidden" name="lead_status" id="email_lead_status" value="<%=enqObj!=null ? enqObj.getLeadId():0%>" >
	<input type="hidden" name="phone" id="email_phone" >
	<input type="hidden" name="form_page" value="<%=PrivilegesEnum.SEARCH_LEAD_MEMBER.getHtmlUrl() %>">
	<input type="hidden" name="enquiry_id" value="<%=enqObj.getId()%>">
	<input type="hidden" id="email_action_id" name="update_action_id"  />
	<input type="hidden" name="total_attachment_div" id="total_attachment_div" value="1">
	<input type="hidden" name="attachmentNo" id="attachmentNo"/>
	                        <input type="hidden" name="ticket_id" id="reply_ticket_id">
	                                <div style="margin:0;" class="row">
	                                	<div class="col-md-12">
	                                	<div style="margin-right: 10px;" class="panel panel-default">
	                                	<div class="panel-body">
	                                	<div class="row">
	                                              	<div class="col-md-12 text-right">
	                                                          	<input type="button"class="btn btn-primary" onClick="showCcBccFieldsFunc()" value="Cc/Bcc" id="title_div">
	                                               	</div>
	                                           	</div>
	                                                <div class="row">
	                                                	<div class="col-md-6">
	                                                        <div class="form-group">
	                                                            <label for="from_email" class="control-label">From</label>
	                                                            <input type="text" class="form-control required" <%=empEmailId != null && !"".equals(empEmailId) && StringUtilityClass.isValidEmailAddress(empEmailId) ? "readonly='readonly'":"" %> name="from_email" value="<%=empEmailId %>" id="from_email">
	                                                         </div>
	                                                     </div>
	                                                     <div class="col-md-6">
	                                                        <div class="form-group">
	                                                            <label  for="to_email" class="control-label">To</label>
	                                                            <input type="text" class="form-control required" name="to_email" <%=enqEmailId != null && !"".equals(enqEmailId) && StringUtilityClass.isValidEmailAddress(enqEmailId) ? "readonly='readonly'":"" %> id="to_email" required value="<%=enqEmailId%>">
	                                                        </div>
	                                                  	 </div>
	                                                 <div id="cc_div" style="display:none;" class="col-md-6">
	                                                        <div class="form-group">
	                                                            <label for="cc_email" class="control-label">Cc</label>
	                                                            <input type="text" name="cc_email" id="cc_email" class="form-control">
	                                                        </div>
	                                                  </div>
	                                                  <div id="bcc_div" style="display:none;" class="col-md-6">
	                                                        <div class="form-group">
	                                                            <label for="bcc_email" class="control-label">Bcc</label>
	                                                            <input type="text" name="bcc_email" id="bcc_email" class="form-control" value="">
	                                                        </div>
	                                                  </div>
	                                                  <div class="col-md-12">
	                                                      <div class="form-group">
	                                                      	  <label class="control-label">Subject</label>
	                                         	              <input type="text" class="form-control required" name="subject_email" id="subject_email">
	                                                      </div>
	                                                  </div>
	                                                  <%if(emailTemplateList != null && emailTemplateList.size() > 0){ %>
	                                                      <div id="tempImage" class="col-md-12">
	                                                      	  <div class="form-group" id="carousel">
	                                                      	      <label class="control-label">Template</label>
	                                                          <div class="slider slick-desc infiniteCarousel">
	                                                              <div class="wrapper">
	                                                              	  <ul>
	                                                              	  	  <%for(EmailTemplate emailTemplate : emailTemplateList) { %>
	                                                              	  	  	  <%if(emailTemplate != null && emailTemplate.isVisible()) { %>
	                                                              	  	  	  	  <%
	                                                              	  	  	  String finalAttachment = "";
	                                                              	  	  	  if(emailTemplate.getAttachment()!=null && !"".equals(emailTemplate.getAttachment())){
	                                                                      List<String> attachmentList = emailTemplate.getAttachment();
	                                                                      if(attachmentList!=null && attachmentList.size()>0){
	                                                                          for(String emailAttachment : attachmentList){
	                                                                        	  emailAttachment = emailAttachment.replace(Resource.getValue(Resource.INVENTORY_IMAGES_LOCATION) , Resource.getValue(Resource.GROUP_IMAGES_WEB_LOCATION));
	                                                                              finalAttachment += emailAttachment + ",";
	                                                                          }
	                                                                          finalAttachment.substring(0, finalAttachment.length() - 1);
	                                                                          finalAttachment = finalAttachment.replaceAll("(\r\n|\n\r|\r|\n)", " ");
	                                                                      }
	                                                                  }
	                                                                  String body = StringEscapeUtils.escapeHtml(emailTemplate.getEmailBody());
	                                                	  if(body != null && !"".equals(body)){
	                                                	  String leadName = enqObj!=null && enqObj.getNameOrCompanyname()!=null && !"".equals(enqObj.getNameOrCompanyname()) ? enqObj.getNameOrCompanyname():"";
	                                                	  body = body.replace(EmailTemplate.LEAD_NAME, leadName);
	                                                	  body = body.replace(EmailTemplate.EMP_NAME, partnerUser.getEmployee() != null && partnerUser.getEmployee().getName() != null ? partnerUser.getEmployee().getName() : "");
	                                                	  body = body.replace(EmailTemplate.EMP_PHONE, partnerUser.getEmployee() != null && partnerUser.getEmployee().getPhone() != null ? partnerUser.getEmployee().getPhone() : "");
	                                                	  body = body.replaceAll(EmailTemplate.ENQUIRY_PRODUCT_NAME, allProductNameKey);
	                                                	  body = body.replaceAll(EmailTemplate.ENQUIRY_PRODUCT_VALUE, totalAMountKey+"");
	                                                	  body = body.replaceAll("#NEXT_FOLLOW_UP#", nextFollowStr);
	                                                	  body = body.replace(EmailTemplate.EMP_EMAIL, partnerUser.getEmployee() != null && partnerUser.getEmployee().getEmail() != null ? partnerUser.getEmployee().getEmail() : "");
	                                                	  body = body.replace(EmailTemplate.EMP_DESIGNATION, partnerUser.getEmployee() != null && partnerUser.getEmployee().getDesignation() != null ? partnerUser.getEmployee().getDesignation() : "");	
	                                                	  }
	                                                              	  	  	  	  %>
	                                                              	  	  	  	  <li>
	                                                                <div title="Click Here">
	                         	<i class="fa scrrol_template" onclick="getEmailBody('<%=emailTemplate.getId() %>','<%=finalAttachment%>');"><img height="64" width="64" src="/static/crm/img/email_template.png" /></i>
	                                                                	<div><%=emailTemplate.getName() %></div>
	                    	<input type="hidden" id="template_body_<%=emailTemplate.getId()%>" value="<%=body!=null ?StringEscapeUtils.escapeHtml(body) :"" %>">
	                                                               	</div>
	                                                               	  </li>
	                                                              	  	  	  <%} %>
	                                                              	  	  <%} %>
	                                                              	  </ul>
	                                                              </div>
	                                                          </div>
	                                                      	  </div>
	                                                      </div>
	                                                  <%} %>
	                                                  <div class="col-md-12">
	                                                  	  <div class="form-group">
	                                                  	      <button style="display:none;" type="button" id="show_template" onclick="getImages()" id="template" name="template" class="btn btn-primary pull-right">Show Template</button>
	                                                          <%if (WhiteLabelHelper.checkEmployeePrivilege(request, PrivilegesEnum.EMAIL_TEMPLATE.getPrivileges())) { %>
	                                                            	<button type="button" id="template" onclick="getNewTemplate()" name="template" class="btn btn-primary pull-right margin-right-10">Add New Template</button>
	                                                          <%} %>
	                                                  	  </div>
	                                                  </div>
	                                                  <div class="col-md-12 summerfont-sm">
	                                                      <label class="control-label">Message Body</label>
	                                                  <div id="emailLeadTextBox">
	                                                      <textarea id="send_email_message_body" name="email_content">
	                                                      </textarea>
	                                                  </div>
	                                                  </div>
	                                                  <div id="attachment" style="display: none;" class="col-md-12 form-group">
	                                              </div>
	                                             <div class="col-md-12 ex-ic" title="Add Attachment">
	                         <i class="fa fa-plus-square pull-right" onclick="addAttachmentFunc()"></i>
	                     </div>
	 <div class="col-md-12" style="clear:left;">
	     <div style="float:right;"> 
	<img src="/static/crm/img/add.png" onclick="addMoreAttachmentDivFunc()">
	 </div>
	 <div id="attachment_div_1" style="margin-top:2%;">
	     <div class="form-group">
	         <label class="control-label">New Attachment :</label><br />
	         <div class="input-group">
	             <input type="text" id="upload_attachment_1" class="form-control file-up-text" readonly>  
	                                                         <span class="input-group-btn">
	                                                            <span class="btn btn-primary btn-file">
	                                                                Browse&hellip; <input type="file" name="upload_attachment_1">
	                                                            </span>
	                                                 </span>
	         </div>
	     </div>
	 </div>
	 <div id="more_attachment_div">
	 </div>
	 </div> 
	 <div id="more_attachment_div" class="col-md-12">
	 </div>
	                                                </div>
	                                	</div>
	                                	</div>
	                                	</div>
	                                	<div style="padding-right: 27px;" class="col-md-12">
	                                    <button type="submit" value="Send" class="btn blue pull-right questionMark" ><i class="fa fa-send"></i>Send</button>
	                                </div>
	                                </div>
	                    	</form>
	                    	</div>
	                    	</div>
	                    	</div>
	                    </div>
	</div>
	</div>
	</div>
	</div>
	
	<div class="modal fade" id="associateDataPopUp" tabindex="-1" role="basic" aria-hidden="true">
	        <div class="modal-dialog" style="width:85%;">
              	<form id="add-associate-frm" class="validate" action="add-enquiry-associate-object-field-data.html" method="post">
	<input type="hidden" name="lead_member_id" value="<%=leadObj!=null ? leadObj.getId():0%>"/>
	<input type="hidden" name="enquiry_id" value="<%=enqObj!=null ? enqObj.getId():0%>"/>
	<input type="hidden" name="enquiry_page_id" value="1"/>
	<input type="hidden" name="enquiry_action_id" id="enquiry_action_id"/>
	<input type="hidden" name="enquiry_assigned_to_id" value="<%=enqObj != null ? enqObj.getAssignedToId() : 0%>">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	                    <h4 class="modal-title" style="text-transform: uppercase;" id="associateDataPopUp_title">Edit</h4>
	                </div>
	                <div class="modal-body">
	                    <div class="row">
	                    	<div class="col-md-12">
	                    	<div class="form-group">
	                    	<label class="control-label">
	                    	<input type="checkbox" name="checkbox_completed" class="completedCls" value="1">Mark As Completed
	                    	</label>
	                    	</div>
	                    	</div>
	                    </div>
	                    <div class="row" id="assosicated_main_new">
	                    </div>
	                </div>
	                <div class="modal-footer">
	                	<button type="submit" class="btn default blue">Save</button>
	                </div>
	            </div>
           	</form>
	        </div>
	    </div>
	    
	    <div class="modal fade" id="dsaDocPopUp" tabindex="-1" role="basic" aria-hidden="true">
	    	<div class="modal-dialog">
	    	<div class="modal-content">
	    	<div class="portlet box blue-hoki">
	    	<div class="portlet-title">
	    	<div class="caption">
	                        	Add Documents
	                        </div>
	                        <div class="actions">
	                            <i style="top: 3px; position: relative; font-size: 18px;cursor:pointer" data-dismiss="modal" aria-hidden="true" class="fa fa-times"></i>
	                        </div>
	    	</div>
	    	<div class="portlet-body">
	    	<div class="horizontal-form margin-bottom-20">
	                            <div class="form-body">
	<form id="attachUpdateDueDateForm" method="post" action="update-selected-enquiry-additional-fields.html" class="validate">
	<input type="hidden" name="enquiry_id" value="<%=enqObj.getId() %>">
	<input type="hidden" name="lead_member_id" value="<%=enqObj.getLeadId() %>">
	<input type="hidden" name="additional_fields_to_update" id="additional_fields_to_update" value="banquet_terms_conditions">
	<input type="hidden" name="banquet_terms_conditions" id="additional_field_value">	
	<input type="hidden" name="notification_to_be_sent" value="Other Documents added by DSA">
	<input type="hidden" name="enquiry_assigned_to" value="<%=enqObj != null ? enqObj.getAssignedToId() : 0%>">
	<div class="row">
	<div class="col-md-10">
	<div class="form-group">
	<label class="control-label">Documents Upload</label>
	<div class="input-group">
	<input type="text" class="form-control file-up-text" readonly>
	<span class="input-group-btn"><span class="btn btn-primary btn-file">Browse&hellip; <input type="file" name="other_doc_file" id="other_doc_file"></span></span>
	</div>
	<div id="other_doc_msg_div"></div>
	</div>
	</div>
	<div class="col-md-2">
	<div class="form-group">
	<label class="control-label">&nbsp;</label>
	<button type="button" class="btn blue btn-sm"  id="edit_btn" onclick="createFilePathAndReturnFunc('other_doc_file','#additional_field_value','#other_doc_msg_div','yes')">Upload</button>
	</div>
	</div>
	</div>
	<div class="row">
	<div class="col-md-12 text-right">
	<button class="btn blue" onclick="attachDocumentsForm()" type="button">Save</button>
	</div>
	</div>
	</form>
	                	</div>
	            	</div>
	    	</div>
	    	</div>
	    	</div>
	    	</div>
	    </div>
	    
	    <div class="modal fade" id="enquiryTypePopUp" tabindex="-1" role="basic" aria-hidden="true">
	    	<div class="modal-dialog">
	    	<div class="modal-content">
	    	<div class="portlet box blue-hoki">
	    	<div class="portlet-title">
	    	<div class="caption">
	                        	Edit Additional Details
	                        </div>
	                        <div class="actions">
	                            <i style="top: 3px; position: relative; font-size: 18px;cursor:pointer" data-dismiss="modal" aria-hidden="true" class="fa fa-times"></i>
	                        </div>
	    	</div>
	    	<div class="portlet-body">
	    	<div class="horizontal-form margin-bottom-20">
	    	<%if(enquiryAditionalFieldsList != null && enquiryAditionalFieldsList.size() > 0){ %>
	    	<form id="addition_enquiry_fields_form" action="edit-enquiry-type">
	    	<input type="hidden" id="total_additional_field" name="total_additional_field" value="14" />
                                        <input type="hidden" name="enquiry_id" value="<%=enqObj.getId() %>"/>
	<input type="hidden" name="lead_member_id" value="<%=enqObj.getLeadId() %>"/>
	    	<div class="form-body">
	    	<div class="row">
	    	<%for(CMAdditionalFieldsMapping obj : enquiryAditionalFieldsList){ %>
	    	<%if(obj != null && obj.isEnabled()){ %>
	    	<%
	                                            	String databaseStoredValue = "";
	try{
	databaseStoredValue = (String)PropertyUtils.getProperty(enqObj, obj.getColumnName());
	databaseStoredValue = StringUtilityClass.isNotNullAndNotEmpty(databaseStoredValue) ? databaseStoredValue : "";
	}catch(Exception e){
	
	}
	                                            	%>
	                                            	<%if(obj.getFieldType()!=null && CMAdditionalFields.FIELD_TYPE_TEXTBOX.equals(obj.getFieldType())){ %>
	                                            	<div class="col-md-6 additinal_field" id="additional_field_<%=obj.getId() %>" >
	                                                            <div class="form-group">
	                                                                <label class="control-label"><%=obj.getDisplayName() %> <%=obj.isRequiredEnabled()?"<span aria-required=\"true\" class=\"required\">* </span>":"" %></label>
	                                                                <input class="form-control <%=obj.isRequiredEnabled()?"required":"" %>" id="select_<%=obj.getId()%>" name="enq_<%=obj.getColumnName()%>" value="<%=databaseStoredValue%>"/>
	                                                            </div>
	                                                        </div>
	                                            	<%}else if(obj.getFieldType()!=null && CMAdditionalFields.FIELD_TYPE_SELECTBOX.equals(obj.getFieldType())){%>
	                                            	<%
	                                            	boolean optionEnabled = obj.getParentFieldId() > 0 ? false:true;
	                                            	List<String> optionList = CMAdditionalFieldsMappingBean.getSerializeStringToStringList(obj);
	                                            	%>
	                                            	<div class="col-md-6 additinal_field" id="additional_field_<%=obj.getId() %>" >
	                                                    <div class="form-group">
	                                                        <label class="control-label"><%=obj.getDisplayName() %> <%=obj.isRequiredEnabled()?"<span aria-required=\"true\" class=\"required\">* </span>":"" %></label>
	                                                        <select  class="form-control select2me additional-select child-select-<%=obj.getId() %> <%=obj.isRequiredEnabled()?"required":"" %>" data-placeholder="Select..." name="enq_<%=obj.getColumnName()%>" id="select_<%=obj.getId()%>"  onchange="loadAdditionalSelectOption(this,<%=obj.getId()%>,<%=obj.getChildFieldId()%>)">
	                                                            <option> </option>
	                                                            <%if(optionList!=null && optionList.size() > 0 && optionEnabled){ %>
	                                                            	<%for(String opStr : optionList){ 
	                                                            	if(StringUtilityClass.isNotNullAndNotEmpty(opStr)){%>
	                                                            	<%if(opStr.trim().equalsIgnoreCase(databaseStoredValue.trim())){ %>
	                                                            	<option value="<%=opStr%>" selected="selected"><%=opStr %></option>
	                                                            	<%}else{ %>
	                                                            	<option value="<%=opStr%>"><%=opStr %></option>
	                                                            	<%} %>
	                                                            	<%} %>
	                                                            	<%} %>
	                                                            <%} %>
	                                                        </select>
	                                                    </div>
	                                                </div>
	                                            	<%}else if(obj.getFieldType()!=null && CMAdditionalFields.FIELD_TYPE_MULTISELECT.equals(obj.getFieldType())){%>
	                                            	<%
	                                            	boolean optionEnabled = obj.getParentFieldId() > 0 ? false:true;
	                                            	List<String> optionList = CMAdditionalFieldsMappingBean.getSerializeStringToStringList(obj);
	                                            	%>
	                                            	<div class="col-md-6 additinal_field" id="additional_field_<%=obj.getId() %>" >
	                                                    <div class="form-group">
	                                                        <label class="control-label"><%=obj.getDisplayName() %> <%=obj.isRequiredEnabled()?"<span aria-required=\"true\" class=\"required\">* </span>":"" %></label>
	                                                        <select class="form-control select2me additional-select child-select-<%=obj.getId() %> <%=obj.isRequiredEnabled()?"required":"" %>" multiple="multiple" data-placeholder="Select..." name="enq_<%=obj.getColumnName()%>" id="select_<%=obj.getId()%>"  onchange="loadAdditionalSelectOption(this,<%=obj.getId()%>,<%=obj.getChildFieldId()%>)">
	                                                            <option> </option>
	                                                            <%if(optionList!=null && optionList.size() > 0 && optionEnabled){ %>
	                                                            	<%for(String opStr : optionList){ 
	                                                            	if(StringUtilityClass.isNotNullAndNotEmpty(opStr)){%>
	                                                            	<%if(opStr.trim().equalsIgnoreCase(databaseStoredValue.trim())){ %>
	                                                            	<option value="<%=opStr%>" selected="selected"><%=opStr %></option>
	                                                            	<%}else{ %>
	                                                            	<option value="<%=opStr%>"><%=opStr %></option>
	                                                            	<%} %>
	                                                            	<%} %>
	                                                            	<%} %>
	                                                            <%} %>
	                                                        </select>
	                                                    </div>
	                                                </div>
	                                            	<%} else if(obj.getFieldType()!=null && CMAdditionalFields.FIELD_TYPE__DATE.equals(obj.getFieldType())){%>
	                                            	<div class="col-md-6 additinal_field" id="additional_field_<%=obj.getId() %>" >
	                                                            <div class="form-group">
	                                                                <label class="control-label"><%=obj.getDisplayName() %> <%=obj.isRequiredEnabled()?"<span aria-required=\"true\" class=\"required\">* </span>":"" %></label>
	                                                                <input class="form-control form-control-inline input-medium date-picker <%=obj.isRequiredEnabled()?"required":"" %>"  type="text"  name="enq_<%=obj.getColumnName()%>" id="select_<%=obj.getId()%>" value="<%=databaseStoredValue%>">
	                                                            </div>
	                                                      	</div>
	                                            	<%} %>
	    	<%} %>
	    	<%} %>
	    	</div>
	    	<div class="row">
	    	<div class="col-md-12 text-right" style="padding-top: 25px;">
	 	<button class="btn btn-success" type="submit"> Save </button>
	</div>
	    	</div>
	    	</div>
	    	</form>
	    	<%} %>
	    	</div>
	    	</div>
	    	</div>
	    	</div>
	    	</div>
	    </div>
	
	<form id="delFileFrm" method="post" action="delete-enquiry-attached-file.html">
	<input type="hidden" name="selected_file" id="selected_file"/>
	<input type="hidden" name="enquiry_id" value="<%=enqObj.getId() %>"/>
	<input type="hidden" name="lead_member_id" value="<%=enqObj.getLeadId() %>"/>
	    </form>
	
	<form id="quotation_form" method="post" action="download-send-quotation.html">
	<input type="hidden" name="lead_member_id" id="lead_mem_id_for_print"/>
	<input type="hidden" name="enquiry_id" id="lead_enq_id_for_print"/>
	<input type="hidden" name="template_id" id="template_id_"/>
	<input type="hidden" name="type" id="type_"/>
	<input type="hidden" name="final_template_id" id="final_template_id"/>
	<input type="hidden" name="download_or_send_mail_data" id="download_or_send_mail_data">
	</form>
	    
	<jsp:include page="/whitelabel/default_template/n_footer.jsp" />
	<script type="text/javascript" src="/static/js/ajaxfileupload.js"></script>
	<script type="text/javascript">
	
	$("#sanctioned_amount").numeric();
	
	function updateLeadPriority(htmlObj, lead_priority) {
	if(lead_priority > 0) {
	var leadId = <%=enqObj.getLeadId()%>;
	var enquiryId = <%=enqObj.getId()%>;
	crm_loader_show();
	$.ajax({
	   type: "POST",	   
	   url: "/employee/update-lead-priority-ajax",    
	   data: "lead_id="+leadId+"&enquiry_id="+enquiryId+"&lead_priority="+lead_priority, 
	   success: function(msg){	
	   crm_loader_hide();
	   if(msg != '-1') {
	   $('.lead_priority_class').each(function(){
	$(this).css('background', 'none');
	$(this).css('color', 'black');
	   });
	   var btn_color = 'white';
	   var btn_text_color = 'black';
	   if(msg == '<%=CMLeadMember.HOT_LEADS%>') {
	   btn_color = '<%=CMLeadMember.HOT_LEAD_COLOR%>';
	   btn_text_color = 'white';
	   } else if(msg == '<%=CMLeadMember.WARM_LEADS%>') {
	   btn_color = '<%=CMLeadMember.WARM_LEAD_COLOR%>';
	   btn_text_color = 'black';
	   } else if(msg == '<%=CMLeadMember.COLD_LEADS%>') {
	   btn_color = '<%=CMLeadMember.COLD_LEAD_COLOR%>';
	   btn_text_color = 'white';
	   }
	   $(htmlObj).css('background', btn_color);
	   $(htmlObj).css('color', btn_text_color);
	   }
	   }
	});
	}
	}
	
	function attachFilesToEnquiryFunc(){
	$('#attachFilePopUp').modal();
	}
	
	function selectGenericTemplate(enquiryId,leadId,type,templateId){
	$("#template_id").val(type);
	$("#generic_template_id").val(templateId);
	$("#final_template_id").val(templateId);
	if (type==-25004){
	$('#quoatationsPopUp').css("width","1200px");
	$('#quoatationsPopUp').css("left","20px");
	}
	getQuotationsDetailsFunc(enquiryId,leadId);
	}
	
	function getQuotationsDetailsFunc(enquiryId,leadId){
	$('#quoatationsTemplatePopUp').fadeOut(500);
	    $("#popupDivQ").slideUp();
	    $("#lead_mem_id_for_print").val(leadId);
	    $("#lead_enq_id_for_print").val(enquiryId);
	    var filteredQuotationProdId = $('#filtered_quotation_product').val();
	    crm_loader_show();
	var selectedTemp = $("#template_id").val();
	var genericTemplateId=$("#generic_template_id").val();
	if(genericTemplateId=='undefined'){
	genericTemplateId=0;
	}
	$.ajax({
	   type: "POST",	   
	   url: "get-quotations-details-for-booking-system.html",    
	   data: "enquiry_id="+enquiryId+"&lead_member_id="+leadId+"&selected_template="+selectedTemp+"&generic_template_id="+genericTemplateId+"&quotation_filtered_product_id="+filteredQuotationProdId, 
	   success: function(msg){
	   crm_loader_hide();
	   $('#quotationsDiv').html(msg);
	   $('#quoatationsPopUp').modal();	
	   if (selectedTemp==-25004){
	      	$('#fp_quotation').css("margin-top","32px");
	      	}
	   }
	});
	}
	
	function selectTemplate(enquiryId,leadId){
	<%if(templateList != null && templateList.size()>1){%>
	selectOptionWidth('selected_template');
	$('#quoatationsTemplatePopUp').fadeIn(1000);
	    $("#popupDivQ").slideDown();
	<%}else if(templateList != null && templateList.size()==1){%>
	<%
	int templateId = 0;
	CMQuotationTemplate tempObj = templateList.get(0);
	if(tempObj != null){
	templateId = tempObj.getId();
	}
	%>
	var tempId = <%=templateId%>;
	$("#template_id").val(tempId);
	getQuotationsDetailsFunc(enquiryId,leadId);
	<%}else{%>
	$("#template_id").val(0);
	getQuotationsDetailsFunc(enquiryId,leadId);
	<%}%>
	}
	
	function download(type) {
	var templateId=$('#template_id').val();
	if (templateId==-25004){
	$('#fp_quotation').css("font-size","8px");
	}
	var printContent=$('.print_quatation').html();
	$("#template_id_").val(templateId);
	$("#type_").val(type);
	$("#download_or_send_mail_data").val(printContent);
	$("#quotation_form").submit();
	}
	
	function sendEmail(typeId){
	crm_loader_show();
	var templateId=$('#template_id').val();
	var leadId=$('#lead_mem_id_for_print').val();
	var enqId=$('#lead_enq_id_for_print').val();
	var printContent=$('.print_quatation').html();
	crm_loader_show();
	$.ajax({
	   type: "POST",	   
	   url: "download-send-quotation.html",
	   data: { lead_member_id: leadId,
	   enquiry_id:enqId,
	   type:typeId,
	   template_id:templateId,
	   download_or_send_mail_data:"'"+printContent+"'"
	   	},
	   success: function(msg){ 
	     crm_loader_hide();
	    var arr = msg.split("#");
	   	$('#quoatationsPopUp').modal('hide');
	   	$('#realestateQuoatationsPopUp').modal('hide');
	      	funEditLead();
	      	$("#attachment").html('');
	      	$("#attachment").append('<label style="margin-top: 20px;margin-left: 15px;"><input type="checkbox" checked="checked" onchange="getCheckedVal(this)" style="width: 15%;float: left;" id="checkbox_0'+'" name="checkbox_0'+'">"'+arr[0]+'"</input><a href="'+arr[1]+'">Download</a><label>');
	            $("#attachment").append('<input type="hidden" name="hiddenAttachment_0'+'" value="'+arr[1]+'">');
	            $("#attachment").show();
	$("#attachmentNo").val(2);
	$("#subject_email").val("Quotation");
	checkBoxUi();
	$("#existing_attachment").val("yes");
	   } 
	});
	crm_loader_hide();
	}
	
	function save(type){
	var templateId=$('#template_id').val();
	if (templateId==-25004){
	$('#fp_quotation').css("font-size","8px");
	}
	var printContent=$('.print_quatation').html();
	$("#download_or_send_mail_data").val(printContent);
	$("#type_").val(type);
	$("#quotation_form").submit();
	}
	
	function showQuotationCcBccFieldsFunc(){
	$("#title_div_quotation").html("Hide CC/BCC");
	$("#cc_div_quotation").toggle();
	$("#bcc_div_quotation").toggle();
	}
	
	function editContactFunc(contactId){
	var editContact_obj = editContact_array_js[contactId];
	var contactId = editContact_obj.id;
	   	var title = editContact_obj.title;
	   	var name = editContact_obj.name;
	   	var phone =  editContact_obj.phone_no;
	   	var email = editContact_obj.email;
	   	var birthDate = editContact_obj.birth_date;
	   	var birthDateStr = editContact_obj.birth_date_str;
	   	var anniversaryDate = editContact_obj.anniversary_date;
	   	var anniversaryDateStr = editContact_obj.anniversary_date_str;
	   	var additionalPhone = editContact_obj.additional_phone;
	   	var additionalEmail = editContact_obj.additional_email;
	   	var designationType = editContact_obj.designation_type ;
	   	var designation = editContact_obj.designation ;
	   	var isPrimaryContact = editContact_obj.is_primary_contact ;
	var fisrtName=editContact_obj.first_name;
	var lastName=editContact_obj.last_name;
	$('#contact_id').val(contactId);
	datePickerUi();
	$("#first_name").val(fisrtName);
	$("#last_name").val(lastName);
	selectBoxAssign('#title', title);
	   	$("#name").val(name);
	   	$("#phone").val(phone);
	   	$("#email").val(email);
	   	$("#hidden_email").val(email);
	   	$("#hidden_phone").val(phone);
	   	$("#dob").val(birthDateStr);
	   	$("#anniversary_date").val(anniversaryDateStr);
	   	$("#additional_phone").val(additionalPhone);
	   	$("#additional_email").val(additionalEmail);
	   	$("#hidden_additional_phone").val(additionalPhone);
	   	$("#hidden_additional_email").val(additionalEmail);
	   	selectBoxAssign('designation_type', designationType);
	   	$("#designation_to_update").val(designation);
	   	if(isPrimaryContact == "true"){
	   	$('#is_primary_check').attr('checked','checked');
	   	}else{
	   	$('#is_primary_check').removeAttr('checked');
	   	}
	$('#contactEditDiv').modal();
	}
	
	function deleteSelectedFileFunc(selectedFile){
	$("#selected_file").val(selectedFile);
	$('#confirmationPopUp').modal();
	}
	
	function continueFileDelFunc(){
	$("#delFileFrm").submit();
	}
	
	function cancelFunc(){
	$('#confirmationPopUp').modal('hide');
	}
	
	function bookingReject(){
	var success=true;
	var reject = $('#booking_reject_remarks').val();
	if(reject ==""){
	success = false;
	}
	
	if(success){
	return true;
	}else{
	return false;
	}
	}
	
	function funEditLead(){
	reloadEmailTextBox();
	slimScrollInit('.scroller1');
	$('#leadRowPriviewId').modal();	
	}
	
	function reloadEmailTextBox(){
	//$('#send_email_message_body').destroy();
	$(function(){
	var editor_cache = '#send_email_message_body';
	    var config = {
	    	paste:{
	           	  style:'retain'
	        },
	 ui:{
	        toolbar: {
	            items: ['undo','emphasis', 'align', 'listindent', 'format',
	                    {label: 'Insert group',
	                    items: [{
	                            id    : 'insert',
	                            label  : 'Insert Menu',
	                            items : [ 'link', 'table','fileupload']
	                        
	                    }]
	                    },
	                    { label: 'tools', items: ['find','fullscreen'] }
	            ],
	        }
	},
	images : {
	    	upload : {
	        	url : '/employee/upload-image-on-editor.html', // Handler URL
	        	basePath: '/my/application/images/', // Remote image storage path
	        	credentials: false // Optional: sends cookies with the request when true
	    	}
	}
	   };

	   textboxio.replace(editor_cache, config);
	   var editors = textboxio.get(editor_cache);
	   var editor = editors[0];
	   editor.events.loaded.addListener(function () {
	 editor.focus();
	   });
	});
	}
	
	function showCcBccFieldsFunc(){
	$("#title_div").html("Hide CC/BCC");
	$("#cc_div").toggle();
	$("#bcc_div").toggle();
	}
	
	function getEmailBody(id,attachment){
	    $("#tempImage").hide();
	    $("#show_template").show();
	    var body = unescape($('#template_body_'+id).val());
	    var emailBody= body+ $('#send_email_message_body').val();
	    $("#send_email_message_body").remove();
	var htmlString=" <textarea id=\"send_email_message_body\" name=\"email_content\">"+emailBody+"</textarea>";
	slimScrollInit('.scroller1');
	    var mySplitResult = attachment.split(",");
	    var count = 0;
	    if(""!=attachment){
	       $("#attachment").show();
	       var lenVal = mySplitResult.length;
	       var existingVal = $("#attachmentNo").val();
	       existingVal = parseInt(existingVal) + parseInt(lenVal);
	       if($("#existing_attachment").val() == "yes"){
	   	   count = 1;
	   }
	       for(i = 0; i < mySplitResult.length-1; i++){
	           var attachFile = mySplitResult[i].substring(mySplitResult[i].lastIndexOf("/")+1);
	           var extension = attachFile.lastIndexOf(".")>-1 ? attachFile.substring(attachFile.lastIndexOf(".")+1) :"";
	           attachFile = attachFile.substring(0 , attachFile.lastIndexOf("_"));
	           if (extension!=""){
	           	attachFile +="."+ extension;
	           }
	           $("#attachment").append('<label class="control-label"> Attachment :'+(i+1)+'</label> <div class=\"checkbox-list\"> <label class=\"checkbox-inline\"> <input type=\"checkbox\" id=\"checkbox_'+ count +'\" onchange="getCheckedVal(this ,'+count+')" checked="checked">'+attachFile+' </label> </div> </div> ');
	           $("#attachment").append('<input type="hidden" name="hiddenAttachment_'+count+'" id="hiddenAttachment_'+count+'" value="'+mySplitResult[i]+'">');
	           radioCheckboxInit("#checkbox_"+count);
	           count++;
	       }
	       existingVal = parseInt(mySplitResult.length);
	       $("#attachmentNo").val(existingVal);
	   }
	    $('#emailLeadTextBox').html(htmlString);	
	reloadEmailTextBox();
	$('#ephox_send_email_message_body').css('height','200px');
	}
	
	function getImages(){
	$(".note-editable").html("");
	$("#tempImage").show();
	$("#show_template").hide();
	}
	
	function getNewTemplate(){
	window.location.href="/employee/email-template.html"; 	
	}
	
	function addAttachmentFunc(){
      	var attachmentCount = $("#total_attachment_div").val();
      	if (attachmentCount == null || attachmentCount == "" || typeof attachmentCount == 'undefined'){
      	attachmentCount=0;
      	}
      	attachmentCount++;
      	var htmlStr = "<div class=\"col-md-6\" id=\"attachment_div_" + attachmentCount +"\"> <div class=\"form-group\"> <label class=\"control-label\">New Attachment </label> <div class=\"input-group\">  <input id=\"upload_attachment_"+attachmentCount +"\" name=\"upload_attachment_q_" + attachmentCount + "\" type=\"text\" class=\"form-control file-up-text\" readonly> <span class=\"input-group-btn\"> <span class=\"btn btn-primary btn-file\"> Browse&hellip; <input type=\"file\" name=\"upload_attachment_" +attachmentCount +"\"> </span> </span> </div> </div> </div>" ;
      	$("#more_attachment_div").append(htmlStr);
      	$("#total_attachment_div").val(attachmentCount);
      	$('#attachmentNoQ').val(attachmentCount);
      	}
	
	function addMoreAttachmentDivFunc(){
	var attachmentDivCount = $("#total_attachment_div").val();
	attachmentDivCount = attachmentDivCount + 1;
	$("#total_attachment_div").val(attachmentDivCount);
	var htmlStr = '<div id="attachment_div_'+attachmentDivCount+'"><div class="form-group"><label class="control-label">New Attachment :</label><br /><div class="input-group"><input type="text" id="upload_attachment_'+attachmentDivCount+'" class="form-control file-up-text" readonly><span class="input-group-btn"><span class="btn btn-primary btn-file">Browse&hellip; <input type="file" name="upload_attachment_'+attachmentDivCount+'"></span></span></div></div></div>';
	$("#more_attachment_div").append(htmlStr);
	}
	
	function addAssociateData(objectId,objectName,leadId,refId, enquiryId){
	$("#associated_object_id").val(objectId);
	var objectIds = {
	"parentObj_to_childObj" : objectId,
	"lead_id" : leadId,
	"enquiry_id" : enquiryId,
	"reference_id" : refId
	}
	$.ajax({
	url : 'get-customer-associate-object-form-page.html',
	type : 'GET',
	data : objectIds,
	success : function(htmlTable) {
	if (htmlTable != "") {
	$('#assosicated_main_new').html(htmlTable);
	$('#assosicated_main_new').find('select').each(function(){
	var getid = $(this).attr('id');
	selectBoxInit('#'+getid);
	});
	$('#assosicated_main_new').find('input[type="checkbox"]').each(function(){
	var getid = $(this).attr('id');
	radioCheckboxInit('#' +getid);
	});
	$('#assosicated_main_new').find('input[type="radio"]').each(function(){
	var getid = $(this).attr('id');
	radioCheckboxInit('#'+getid);
	});
	}
	$('.date-picker').datepicker();
	$('#lead_member_id').val(leadId);
	$('#parentObj_to_childObj').val(objectId);
	$("#associateDataPopUp").modal();
	},
	error : function(htmlTable) {
	console.log(htmlTable);
	}
	});
	}
	
	$(".completedCls").change(function(){
             $(".completedCls").each(function(){
                 if($(this).is(":checked")){
                     $('#enquiry_action_id').val(<%=completedActionId%>);
                 }else{
                	 $('#enquiry_action_id').val(0);
                 }
             });
        });
	
	function editAdditionalEnquiryFields(){
	$('#enquiryTypePopUp').modal();
	}
	
	function attachOtherDocumentsFunc(){
	$('#dsaDocPopUp').modal();
	}
	
	function createFilePathAndReturnFunc(id,saveId, msgId, addToExisting){
	var resultMsg = "";
	$(msgId).html('');
	$.ajaxFileUpload(
	{
	url:'create-ro-image-file-path-and-return',
	secureuri:false,
	fileElementId:id,
	success: function (msg, status){
	var resultMsg = msg.body.firstChild.innerHTML;
	console.log(resultMsg);
	if(resultMsg != ''){
	if(addToExisting == 'yes'){
	var newResult = $(saveId).val();
	if(newResult != ''){
	newResult += "#";
	}
	newResult += resultMsg;
	$(saveId).val(newResult);
	console.log(newResult);
	}else{
	$(saveId).val(resultMsg);
	}
	$(msgId).append('File Uploaded Successfully');
	}
	},
	error : function (error){
	console.log("Inside Error method");
	$(msgId).append('File Could Not Be Uploaded');
	}
	}
	);
	}
	
	function setEnquiryActionsFunc() {
	var selectedActionId = $('#selected_update_action_id').val();
	<%if(checkParent!=null && checkParent.size()>0){%>
	<%for(CMUpdateAction actionStatus : checkParent){%>
	if ('<%=actionStatus.getId()%>' == selectedActionId) {
	if (selectedActionId > 0) {
	$.ajax({
	type: "POST",
	url: "/employee/get-cild-action-from-parent-action.html",
	data: "selectedActionId=" + selectedActionId,
	success: function (msg) {
	console.log(msg);
	$('#showChildAction').show();
	$('#selected_child_action_id').html(msg);
	}
	});
	}
	} else {
	$('#showChildAction').hide();
	}
	<%}}%>
	<%if(sanctionAssociateObjectList!=null && sanctionAssociateObjectList.size()>0){%>
	<%for(CMAssociateObjectFieldMapping listObj : sanctionAssociateObjectList){ %>
	var check = "<%=listObj.getObjectId()%>_<%=listObj.getColumnName()%>";
	<%for(CMUpdateAction action : followUpActionList){ %>
	if (selectedActionId == 6421) {
	$('#sanctionAmountDiv').show();
	$('#tenureDiv').show();
	$('#roiDiv').show();
	$('#' + check + '').hide();
	} else if (selectedActionId == 6789) {
	<%if(listObj.getColumnName() != "attr1" || listObj.getColumnName() != "attr2" || listObj.getColumnName() != "attr3"){%>
	$('#' + check + '').show();
	$('#sanctionAmountDiv').hide();
	$('#tenureDiv').hide();
	$('#roiDiv').hide();
	<%}%>
	} else {
	$('#sanctionAmountDiv').hide();
	$('#tenureDiv').hide();
	$('#roiDiv').hide();
	$('#' + check + '').hide();
	}
	<%}%>
	<%}%>
	<%}%>

	}
	function attachDocumentsForm(){
	var additionalFieldValuve = $('#additional_field_value').val();
	var enqField = '';
	var additionalNewValue = '';
	<%String check = "";
	if(StringUtilityClass.isNotNullAndNotEmpty(enqObj.getBanquetTermsAndConditions())){ %>
	enqField = "<%=enqObj.getBanquetTermsAndConditions()%>";
           <%}%>
           if(enqField!=""){
        	   additionalNewValue = enqField.concat("#").concat(additionalFieldValuve);
           }else if(enqField==""){
        	   additionalNewValue = additionalFieldValuve;
           }
           $('#additional_field_value').val(additionalNewValue);
	$("#attachUpdateDueDateForm").submit();
	}
	</script>
	</body>
</html>