<%@ include file="/WEB-INF/struts-views/common/taglibs-include.jsp"%>
<script language="javascript">
if(window.opener)
{
    window.opener.location.replace('<c:url value='/404.html'/>');
    window.close();     
}
else
{
    window.location.replace('<c:url value='/404.html'/>');
}
</script>