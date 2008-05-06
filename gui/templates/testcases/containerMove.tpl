{* 
TestLink Open Source Project - http://testlink.sourceforge.net/ 
$Id: containerMove.tpl,v 1.5 2008/05/06 06:26:12 franciscom Exp $
Purpose: smarty template - form for move/copy container in test specification 

rev :
     20080105 - franciscom - 
     20070904 - franciscom - BUGID 1019
     removed checkbox copy nested data
*}
{include file="inc_head.tpl"}
{assign var='parent' value='container'}
{lang_get var="labels" 
          s="cont_move_first,sorry_further,cont_copy_first,defined_exclam,
             cont_move_second,cont_copy_second,choose_target,
             btn_move,btn_cp,as_first_testsuite,as_last_testsuite"}

<body>
{lang_get s=$level var=level_translated}
<h1 class="title">{$level_translated}{$smarty.const.TITLE_SEP}{$object_name|escape} </h1>

<div class="workBack">
<h1 class="title">{lang_get s='title_move_cp'}</h1>

{if $containers eq ''}
	{$labels.sorry_further} {$parent} {$labels.defined_exclam} 
{else}
	<form method="post" action="lib/testcases/containerEdit.php?objectID={$objectID|escape}">
		<p>
		{$labels.cont_move_first} {$level_translated} {$labels.cont_move_second} {$parent|escape}.<br />
		{$labels.cont_copy_first} {$level_translated} {$labels.cont_copy_second} {$parent|escape}.
		</p>
		<p>{$labels.choose_target} {$parent|escape}:
			<select name="containerID">
				{html_options options=$containers}
			</select>
		</p>
	
	  {* 20080105 - franciscom *}
		<p><input type="radio" name="target_position"	 
	          value="top" {$top_checked}>{$labels.as_first_testsuite}
  	<br><input type="radio" name="target_position" 
	          value="bottom" {$bottom_checked}>{$labels.as_last_testsuite}
	  <p>

	
		<p>
			<input type="checkbox" name="copyKeywords" checked="checked" value="1" />
			{lang_get s='copy_keywords'}
		</p>

		<div>
			<input type="submit" name="do_move" value="{$labels.btn_move}" />
			<input type="submit" name="do_copy" value="{$labels.btn_cp}" />
			<input type="hidden" name="old_containerID" value="{$old_containerID}" />
		</div>	

	</form>
{/if}
</div>
</body>
</html>
