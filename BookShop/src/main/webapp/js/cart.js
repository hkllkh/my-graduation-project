
/**
 * 加入购物车
 */
function buy(bid){
	$.get("books_buy.action", {bid:bid}, function(data){
		if(data=="ok")
		{
			layer.msg("添加到购物车!", {time:800}, function(){
               location.reload();
            });
		}
		else if(data=="fail")
		{
            layer.msg("库存不足,请购买其他商品!", {time:800}, function(){

            });
		}


	});
}

function shou(bid){
	$.get("books_shou.action", {bid:bid}, function(data){
		if(data=="ok")
		{
			layer.msg("添加到收藏夹!", {time:800}, function(){
               location.reload();
            });
		}
		else if(data=="fail")
		{
            layer.msg("库存不足!", {time:800}, function(){

            });
		}


	});
}

function lessen(bid){
    $.post("books_lessen.action", {bid:bid}, function(data){
        if(data=="ok"){
            layer.msg("操作成功!", {time:800}, function(){
                location.reload();
            });
        }

    });
}
/**
 * 购物车删除
 */
function deletes(bid){
    $.post("books_delete.action", {bid:bid}, function(data){
        if(data=="ok"){
            layer.msg("删除成功!", {time:800}, function(){
                location.reload();
            });
        }
    });
}

