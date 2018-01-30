/**
 * 校验选中的文件类型是否符合要求
 */
function selectFile(obj) {
	var filename = $(obj).val().substr($(obj).val().lastIndexOf("\\") + 1);
	console.log(filename);
	$("#filename").val(filename);
	if (filename == "") {
		return;
	}
	var suffix = filename.substr(filename.lastIndexOf(".") + 1).toLowerCase();
	if (!isFileTypeSupport(suffix)) {
		// Uploading(obj);
		$("#msg").html("不支持的文件类型！");
		return;
	}
}
/**
 *  判断是否是支持的文件类型 
 */
function isFileTypeSupport(suffix) {
	var allowExtention = ".txt,.pdf,.ppt,.pptx,.xls,.xlsx,.doc,.docx,.7z,.rar,.zip"; // 允许上传文件的后缀名
	// 判断上传文件格式是否符合要求
	if (allowExtention.indexOf(suffix) <= -1) {
		return false;
	} else {
		return true;
	}
}
/**
 * 检验关键词栏的输入类型
 */
/*function checkCrucial(obj) {
	var keyword = $(obj).val();
	var arr = keyword.split(",");
	if(arr.length>5){
		$("#msg3").html("关键词数量超出5个！");
	}
	var re = /^[A-Za-z0-9\u4e00-\u9fa5\W]+$/;
	for(var i = 0 ; i<= arr.length ; i++){
    	if(!re.test(arr[i])){
    		$("#msg3").html("请输入正确的名称格式！");
    		return ;
    	}
	}
	
}*/

/**
 * 上传提交前简单判断各栏null否
 */
function Uploading(){
	if($("#sfile").val()==""){
		$("#msg").html("请选择文件！");
		return ;
	}
	if($("#rsname").val()==""){
		$("#msg2").html("请输入名称！");
		return ;
	}
	/* var re = /^[A-Za-z0-9\u4e00-\u9fa5\W]+$/;
	if(!re.test($("#rsname").val())){
		$("#msg2").html("请输入正确的名称格式！");
		return ;
	} */
	var keyword = $("#keyword").val();
	var arr = keyword.split(",");
	if(arr.length>5){
		$("#msg3").html("关键词数量超出5个！");
		return ;
	}
	if($(".area").html()==null){
		$("#msg4").html("请填写内容！");
		return ;
	}
	if(!$(".protocol").prop("checked")){
		return ;
	}
	document.myform.action = "file/upload";
	document.myform.submit();
}
