<{extends file="thesis/temp.tpl"}>
 
<{*新增论文，页面显示的按钮*}>                    

<{*不显示“附件上传”*}> 
<{block name="attachment_upload"}>    
    <{ if $thesis['status'] eq "填报"}> 
        <span class="col_width"><span class="red_font">附件处理</span></span>
        <span class="col_width"><a target="main" href="<{$app}>/thesis/upfile/the_id/<{$thesis.the_id}>">【附件上传】</a></span>
    <{ else }><{*$thesis['status']不为“填报”，“新增”操作的页面显示的按钮*}>
        <span class="col_width"><span class="red_font">附件处理</span></span>
        <span class="col_width"><span class="red_font">需“完成”论文后才能上传附件</span></span>  
    <{ /if }> 
    

    						
<{/block}> 

<{block name="attachment_download"}>    
    &nbsp;&nbsp;						
<{/block}>  

<{block name="button"}> 
    <input type="submit" class="button" name="opr_symbol" value="完成" formaction="<{$url}>/insert"/>&nbsp;&nbsp;
    <input type="submit" class="button" name="opr_symbol" value="提交" />&nbsp;&nbsp;
                      		
<{/block}>

<{block name="button_return"}> 
    <input type="submit" class="button" value="返 回" formaction="<{$app}>/thesis/my_index"/>&nbsp;&nbsp;
<{/block}> 
                    