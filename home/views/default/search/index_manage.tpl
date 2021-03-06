<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
        <title>用户中心</title>
		<meta name="Author" content="HY" />	
		<link rel="stylesheet" type="text/css" href="<{$res}>/css/global.css">
		<link rel="stylesheet" type="text/css" href="<{$res}>/css/layout.css">
		<link rel="stylesheet" type="text/css" href="<{$res}>/css/print.css">
		<link rel="stylesheet" type="text/css" href="<{$res}>/css/main.css">
		<script src="<{$public}>/js/ajax3.0.js"></script>
        <script src="<{$res}>/js/menu.js"></script>
	
    
    
	</head>
    
    <body>

<body style="background:white;margin:1px;">
    <div id="main">   
    <div class="head-dark-box">
            <{if $smarty.session.groupname eq "超级管理员" or $smarty.session.groupname eq "批准人" or $smarty.session.groupname eq "维护人"}>
                <div class="tit"><span class="red_font">研究院专利</span> —— 搜索结果</span>&nbsp;--
                &nbsp;类型:(<{$type}>)&nbsp;状态:(<{$status}>)&nbsp;部门:(<{$dept}>)&nbsp;专利作者:(<{$authors}>--<{$authortype}>)&nbsp;项目信息:(<{$prj_info}>--<{$prj_infotype}>)
                </div>
                
            <{elseif $smarty.session.groupname eq "审核人" or $smarty.session.groupname eq "撰写人"}>
                <div class="tit"><span class="red_font">部门专利</span> —— 搜索结果</span>&nbsp;--
                &nbsp;类型:(<{$type}>)&nbsp;状态:(<{$status}>)&nbsp;部门:(<{$dept}>)&nbsp;专利作者:(<{$authors}>--<{$authortype}>)&nbsp;项目信息:(<{$prj_info}>--<{$prj_infotype}>)
                </div>
                
            <{else}>
                <div class="tit"><span class="red_font">出错</div>
            <{/if}>
            
        </div>
    
    <{*搜索输入区*}>    
    <div class="search-box">
        <form action="<{$app}>/search/index_manage" method="post"> 
            <{*选择大类中的小类*}>
            类型：<select name="ser_type">
                <option value="<{$type}>" selected="selected"><{$type}></option>
                <option value="实用新型专利">实用新型专利</option>
                <option value="发明专利">发明专利</option>
                <option value="外观设计专利">外观设计专利</option>
                <option value="软件版权">软件版权</option>
                <option value="著作权">著作权</option>
                <option value="集成电路图">集成电路图</option>
                <option value="不限">(不限)</option>
            </select>&nbsp;&nbsp;
            
            <{*选择状态*}>
            状态：<select name="ser_status">
                <option value="<{$status}>" selected="selected"><{$status}></option>
                <option value="填报">填报</option>
                <option value="提交">提交</option>
                <option value="修改">修改</option>
                <option value="退回">退回</option>
                <option value="审核">审核</option>
                <option value="批准">批准</option>
                <option value="申报">申报</option>
                <option value="授权">授权</option>
                <option value="放弃">放弃</option>
                <option value="驳回">驳回</option>
                <option value="维护">维护</option>
                <option value="不限">(不限)</option>
            </select>&nbsp;&nbsp;  
                                
            题目：<input type="text"  name="ser_topic" size="30" value="<{$topic}>" maxlength="100">&nbsp;&nbsp;

            <{if $smarty.session.groupname eq "超级管理员" or $smarty.session.groupname eq "批准人" or $smarty.session.groupname eq "维护人"}>
                提交部门：<input type="text"  name="ser_dept" size="25" value="<{$dept}>" maxlength="100">&nbsp;&nbsp;
            <{elseif $smarty.session.groupname eq "审核人" or $smarty.session.groupname eq "撰写人"}>
                提交部门：<input class="text-box-readonly" type="text" name="ser_dept" size="25" value="<{$dept}>" maxlength="100" readonly="readonly">&nbsp;&nbsp;
            <{else}>
                <div class="tit"><span class="red_font">出错</div>
            <{/if}>

            <br/> <{*换行*}>
            <br/> <{*换行*}>
                        
            专利作者：<input type="text"  name="ser_authors" size="20" value="<{$authors}>" maxlength="20" >搜索...
            <{if $authortype eq "writer"}>
                <input type="radio" name="ser_authortype" value="writer" checked="checked">撰写人|
                <input type="radio" name="ser_authortype" value="author">第一作者|
                <input type="radio" name="ser_authortype" value="authorother">其他作者|&nbsp;&nbsp;
             <{elseif $authortype eq "author"}>
                <input type="radio" name="ser_authortype" value="writer" >撰写人|
                <input type="radio" name="ser_authortype" value="author" checked="checked">第一作者|
                <input type="radio" name="ser_authortype" value="authorother">其他作者|&nbsp;&nbsp;
            <{elseif $authortype eq "authorother"}>
                <input type="radio" name="ser_authortype" value="writer"">撰写人|
                <input type="radio" name="ser_authortype" value="author">第一作者|
                <input type="radio" name="ser_authortype" value="authorother" checked="checked">其他作者|&nbsp;&nbsp;    
            <{else}>   
                <input type="radio" name="ser_authortype" value="writer" checked="checked">撰写人|
                <input type="radio" name="ser_authortype" value="author">第一作者|
                <input type="radio" name="ser_authortype" value="authorother">其他作者|&nbsp;&nbsp;
            <{/if}>
            
            <{*
            专利撰写人：<input type="text"  name="ser_writer" size="15" value="<{$writer}>" maxlength="15" >&nbsp;&nbsp; 
            专利作者：<input type="text"  name="ser_authors" size="15" value="<{$authors}>" maxlength="15" >&nbsp;&nbsp;
            *}> 
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            开始日期：<input type="text"  name="ser_start_date" size="10" value="<{$start_date}>" maxlength="10" placeholder="yyyy-mm-dd">&nbsp;&nbsp;
            结束日期：<input type="text"  name="ser_end_date" size="10" value="<{$end_date}>" maxlength="10" placeholder="yyyy-mm-dd">&nbsp;&nbsp;
            
            <br/> <{*换行*}>
            <br/> <{*换行*}>
            <br/> <{*换行*}>

            重要信息：<input type="text"  name="ser_prj_info" size="20" value="<{$prj_info}>" maxlength="22" >搜索...
             <{if $prj_infotype eq "prj_topic"}>
                <input type="radio" name="ser_prj_infotype" value="prj_topic" checked="checked">项目名称|
                <input type="radio" name="ser_prj_infotype" value="prj_num" >项目编号|
                <input type="radio" name="ser_prj_infotype" value="pat_keyword" >专利关键词|
             <{elseif $prj_infotype eq "prj_num"}>
                <input type="radio" name="ser_prj_infotype" value="prj_topic">项目名称|
                <input type="radio" name="ser_prj_infotype" value="prj_num" checked="checked">项目编号|
                <input type="radio" name="ser_prj_infotype" value="pat_keyword" >专利关键词|
            <{elseif $prj_infotype eq "pat_keyword"}>
                <input type="radio" name="ser_prj_infotype" value="prj_topic">项目名称|
                <input type="radio" name="ser_prj_infotype" value="prj_num" >项目编号|
                <input type="radio" name="ser_prj_infotype" value="pat_keyword" checked="checked">专利关键词|
            <{else}>   
                <input type="radio" name="ser_prj_infotype" value="prj_topic" checked="checked">项目名称|
                <input type="radio" name="ser_prj_infotype" value="prj_num" >项目编号|
                <input type="radio" name="ser_prj_infotype" value="pat_keyword" >专利关键词|
            <{/if}>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...&nbsp;<input type="submit" value="搜 索">&nbsp;
            <input type="reset" value="重 置"/>
        </form>                    
        
    </div> 
        
        <div class="msg-box">
				<div class="mar">
                    <ul class="viewmess">
                    	<li class="dark-row">
                            <span class="list_width width_font" style="width:30px">序号</span>
                            <span class="list_width width_font" style="width:150px">题&nbsp;&nbsp;目</span>
                            <span class="list_width width_font" style="width:90px">类&nbsp;&nbsp;型</span>
        					<span class="list_width width_font" style="width:60px">状&nbsp;&nbsp;态</span>
                            <span class="list_width width_font" style="width:100px">部&nbsp;&nbsp;门</span>
                            
                            <{*日期列*}>
                            <{ if $status eq "不限"}>
                                <span class="list_width width_font" style="width:90px">填报日期</span>
                            <{ else }>
                                <span class="list_width width_font" style="width:90px"><{$status}>日期</span>
                            <{ /if}>
                            
                            <{*专利作者列*}>
                            <{if $authortype eq "writer" }>
                                <span class="list_width width_font" style="width:120px">撰写人</span>
                            <{ elseif $authortype eq "author" }>
                                <span class="list_width width_font" style="width:120px">第一作者</span>
                            <{ elseif $authortype eq "authorother" }>
                                <span class="list_width width_font" style="width:120px">其他作者</span>
                            <{ else }>
                                <span class="list_width width_font" style="width:120px">专利作者</span>
                            <{ /if}>
                            
                            <{*专利相关重要信息列*}>
                            <{if $prj_infotype eq "prj_topic" }>
                                <span class="list_width width_font" style="width:150px">项目名称</span>
                            <{ elseif $prj_infotype eq "prj_num" }>
                                <span class="list_width width_font" style="width:150px">项目编号</span>
                            <{ elseif $prj_infotype eq "pat_keyword" }>
                                <span class="list_width width_font" style="width:150px">专利关键词</span>
                            <{ else }>
                                <span class="list_width width_font" style="width:150px">项目名称</span>
                            <{ /if}>
          
                        </li>
                        <{*从search.class.php的index操作中分配的$sets*}>
                        <{ section name=doc loop=$sets }>
        						<li class="<{if $smarty.section.doc.index is even}>light-row<{else}>dark-row<{/if}>" style="padding-top:5px; padding-bottom:5px">
        							<span class="list_width" style="width:30px"><{ $smarty.section.doc.index + 1 }></span>
        							
                                    <{*专利名称可链接到该专利的状态页面operate_status.tpl，同时传送pat_id、登录用户的uid值*}>
                                    <span class="list_width" style="width:150px"><a href="<{$app}>/patent/operate_status/pat_id/<{ $sets[doc].pat_id }>/uid/<{$uid}>" target="_self">【<{ $sets[doc].topic }>】</a></span>
                                 
                                    <span class="list_width" style="width:90px"><{ $sets[doc].type }></span>
                                    
                                    <{*专利状态可链接到该专利的整个审批过程，即是显示ipms_process表中oprobjid=pat_id的所有记录 *}>
                                    <span class="list_width" style="width:60px"><a href="<{$app}>/process/index/oprobjid/<{ $sets[doc].pat_id }>/topic/<{ $sets[doc].topic }>" target="_blank">【<{ $sets[doc].status}>】</a></span>
        							<span class="list_width" style="width:100px"><{ $sets[doc].dept}></span>
                                    <span class="list_width" style="width:90px"><{ $sets[doc].date}></span>
                                    <span class="list_width" style="width:120px"><{ $sets[doc].authors}></span>
                                    <span class="list_width" style="width:150px"><{ $sets[doc].prj_info}></span>
        				
        						</li>
        				<{ sectionelse }>
        						<li class="light-row">
        							没有专利
        						</li>	
        				
                        <{ /section }>
                        
                        <li class="dark-row" style="text-align:right">
                            <{$fpage}>
                        </li>
                        
                    </ul>
                </div> 
	       </div>
    </div>   

	<div class="nav"> </div>
    
    <{if $flush}>
    	<script>
    		window.top.frames["menu"].location.reload(true);
    	</script>
    <{/if}>
    </body>
    </body>
</html>

				
