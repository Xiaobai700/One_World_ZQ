
/**
 * Created by Master ZQ on 2016/11/8.
 */
    $(function(){
    	
    	//省市二级联动菜单
    	
        /*鼠标悬停在主页的发起活动上，显示二级菜单*/
        var lis=$("ul.ul_first>li");

        lis.hover(function(){

            $(this).find("ul").show();

        },function(){

            $(this).find("ul").hide();

        })
        /*圆桌特效*/
        var imgall=$('img.img-circle');//获取所有图片

        var img_left=$('.mycircle').width();
        $('img.img-circle').css({'left':img_left/2-16});//将img移动到圆的正上方

        //获取中心坐标
        var left_index=31;
        //alert(left_index);
        var top_index=141;
        imgall.css({'transform-origin':left_index+'px '+top_index+'px'});
        for(var i=0;i<imgall.length;i++)
        {
            imgall.eq(i).css({'transform':'rotate('+(60*i+1)+'deg)'});
        }

        /*个人中心页面*/
        var zy = $('.personal_main_right_zy');
        var yb = $('.personal_main_right_yb');
        var fx = $('.personal_main_right_fx');
        var jl = $('.personal_main_right_jl');

        $('.zhu_ye').click(function(){
            /*变换背景颜色*/
            $('.yue_ban').removeClass('background_gray');
            $('.z_y_j_l').removeClass('background_gray');
            $('.f_x').removeClass('background_gray');
            $('.zhu_ye').addClass('background_gray');
            /*切换*/
            zy.show();
            yb.hide();
            fx.hide();
            jl.hide();
        })
        $('.yue_ban').click(function(){
            /*变换背景颜色*/
            $('.yue_ban').addClass('background_gray');
            $('.z_y_j_l').removeClass('background_gray');
            $('.f_x').removeClass('background_gray');
            $('.zhu_ye').removeClass('background_gray');
            /*切换*/
            yb.show();
            zy.hide();
            fx.hide();
            jl.hide();
        })
        $('.z_y_j_l').click(function(){
            /*变换背景颜色*/
            $('.z_y_j_l').addClass('background_gray');
            $('.f_x').removeClass('background_gray');
            $('.zhu_ye').removeClass('background_gray');
            $('.yue_ban').removeClass('background_gray');
            /*切换*/
            jl.show();
            zy.hide();
            fx.hide();
            yb.hide();
        })
        $('.f_x').click(function(){
            /*变换背景颜色*/
            $('.f_x').addClass('background_gray');
            $('.zhu_ye').removeClass('background_gray');
            $('.z_y_j_l').removeClass('background_gray');
            $('.yue_ban').removeClass('background_gray');
            /*切换*/
            fx.show();
            jl.hide();
            zy.hide();
            yb.hide();
        })
        /*所有分享页面*/
        var pin_lun = $('.pin_lun_xian_shi');
        $('.x_s_p_l').click(function () {
            pin_lun.show();
        });
        $('.y_c_p_l').click(function () {
            pin_lun.hide();
        });
    });
