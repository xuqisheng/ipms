<{extends file="patent/temp.tpl"}>

<{block name="note"}>
    <span class="col_width">【<span class="red_font"><{$patent.status}></span>】意见:</span>
    <input class="col_width3" list="note" name="note"/>
        <datalist id="note">
            <option value="审核通过">
        </datalist>
    
<{/block}>

<{block name="button"}>
    <input type="submit" class="button" name="opr_symbol" value="审核同意" />&nbsp;&nbsp;
    <input type="submit" class="button" name="opr_symbol" value="退回" formaction="<{$app}>/patent/ret/pat_id/<{$patent['pat_id']}>"/>&nbsp;&nbsp;  
           		
<{/block}>


