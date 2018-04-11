window.onload = function(){
	adddel();
	checkchoose();
	selectall();
	del();
	checkshow();
	allshow();
	totl();
	 };
	 function checkshow() {
		$(".state").each(function() {
			if($(this).val()=="1"){
				console.debug(11111);
				$(this).siblings().prop("checked",true);
			}else if($(this).val()=="0"){
				console.debug(222);
				console.debug($(this).siblings().length);
			}
		})
	 }
	 function allshow() {
		 var sum=0;
		 var selects=$('.Each');
		  for(i=0;i<selects.length;i++){
	            var select =selects.eq(i);
	            if(!select.is(":checked")){
	            	sum++;
	            }
	            }
		  if(sum==0){
			  $("#all").prop("checked",true);
		  }else{
			  $("#all").prop("checked",false);
		  }
	}
	 function checkchoose(){
	$('.Each').click(function(){
       totl();
    });
	 }
	 function selectall() {
		 $("#all").click(function() {
				all = $(this).prop("checked")
				$(".Each").each(function() {
					$(this).prop("checked",all);
				})
				totl();
	})
	}
	 function totl() {
		 //计算总价
			var sum = 0;
			var selects=$('.Each');
			  for(i=0;i<selects.length;i++){
		            var select =selects.eq(i);
		            if(select.is(":checked")){
		               var a= select.parent().siblings(".totle").text();
		                sum+=parseFloat(a);
		            }
			  }
			  $("#susum")[0].innerText=sum;
		}
		function adddel() {
			//加减以计算
		$(".add").each(function() {
			$(this).click(function() {
					var $multiadd = 0.0;
					var vall = $(this).prev().val();
					vall++;
					$(this).prev().val(vall);
					$multiadd = parseFloat(vall) * parseFloat($(this).parent().prev().text());
					$(this).parent().next().text(parseFloat($multiadd.toFixed(2)));
					totl();
			})
			})
		$(".reduc").each(function() {
		$(this).click(function() {
			var $multireduc = 0;
			var vall1 = $(this).next().val();
			vall1--;
			if(vall1 <= 0) {
				vall1 = 1;
			}
			$(this).next().val(vall1);
			$multireduc = parseFloat(vall1) * parseFloat($(this).parent().prev().text());
			$(this).parent().next().text(parseFloat($multireduc.toFixed(2)));
			totl();
		})

	})
	}
	function del() {
		$(".foot_del").click(function() {
		$(".Each").each(function() {
			if($(this).prop('checked')) {
				$(this).parents(".imfor").remove();
				totl();
				if($(".imfor").length == 0) {
					var str = '<div class="fail" style="width:400px; color: darkturquoise;font-size: 30px;margin-left: 30%;">购物车空空的，快去选购吧!</div>';
					$('.foot_del').parent().prev().append(str);
				}
			}
		})
	})	
	}