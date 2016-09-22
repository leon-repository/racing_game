(function(){
    //定义押注的数据信息
    var yzTableData = {
        'one' : [
            {'codeName':'大','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'小','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'单','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'双','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'龙','codeValue':1.94,'key':'commonStake'},
            {'codeName':'虎','codeValue':1.94,'key':'commonStake'},
            {'codeName':'1','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'2','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'3','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'4','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'5','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'6','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'7','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'8','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'9','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'10','codeValue':9.7,'key':'appointStakeList'}
        ],
        'two' : [
            {'codeName':'大','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'小','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'单','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'双','codeValue':1.94,'key':'rankingStakeList'},
            {'codeName':'1','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'2','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'3','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'4','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'5','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'6','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'7','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'8','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'9','codeValue':9.7,'key':'appointStakeList'},
            {'codeName':'10','codeValue':9.7,'key':'appointStakeList'}
        ],
        'three' : [
            {
                'codeName':{
                    'firstSecond3':3,
                    'firstSecond4':4,
                    'firstSecond5':5,
                    'firstSecond6':6
                },
                'codeValue':{
                    'firstSecond3':41,
                    'firstSecond4':41,
                    'firstSecond5':21,
                    'firstSecond6':21
                }
            },
            {
                'codeName':{
                    'firstSecond7':7,
                    'firstSecond8':8,
                    'firstSecond9':9,
                    'firstSecond10':10
                },
                'codeValue':{
                    'firstSecond7':12,
                    'firstSecond8':12,
                    'firstSecond9':10.3,
                    'firstSecond10':10.3
                }
            },
            {
                'codeName':{
                    'firstSecond11':11,
                    'firstSecond12':12,
                    'firstSecond13':13,
                    'firstSecond14':14
                },
                'codeValue':{
                    'firstSecond11':8.3,
                    'firstSecond12':10.3,
                    'firstSecond13':10.3,
                    'firstSecond14':12
                }
            },
            {
                'codeName':{
                    'firstSecond15':15,
                    'firstSecond16':16,
                    'firstSecond17':17,
                    'firstSecond18':18
                },
                'codeValue':{
                    'firstSecond15':12,
                    'firstSecond16':21,
                    'firstSecond17':21,
                    'firstSecond18':41
                }
            },
            {
                'codeName':{
                    'firstSecond19':19,
                    'firstSecond20':'',
                    'firstSecond21':'',
                    'firstSecond22':'',
                },
                'codeValue':{
                    'firstSecond19':41,
                    'firstSecond20':'',
                    'firstSecond21':'',
                    'firstSecond22':'',
                }
            },
            {
                'codeName':{
                    'firstSecondBig':'冠亚大',
                    'firstSecondSmall':'冠亚小',
                    'firstSecondOdd':'冠亚单',
                    'firstSecondEven':'冠亚双'
                },
                'codeValue':{
                    'firstSecondBig':2,
                    'firstSecondSmall':1.63,
                    'firstSecondOdd':1.63,
                    'firstSecondEven':2
                }
            }
        ]
    };

    var sendData = {
          "commonStake": {//普通押注
                "firstUp": 0,//第一名龙金额
                "firstDowm": 0,//第一名虎金额
                "secondUp": 0,//第二名龙金额
                "secondDowm": 0,//第二名虎金额
                "thirdUp": 0,//第三名龙金额
                "thirdDowm": 0,//第三名虎金额
                "fourthUp": 0,//第四名龙金额
                "fourthDowm": 0,//第四名虎金额
                "fifthUp": 0,//第五名龙金额
                "fifthDowm": 0,//第五名虎金额
                "firstSecondOdd": 0,//冠亚和单金额
                "firstSecondEven": 0,//冠亚和双金额
                "firstSecondBig": 0,//冠亚和大金额
                "firstSecondSmall": 0,//冠亚和小金额
                "firstSecond3": 0,//冠亚和结果3金额
                "firstSecond4": 0,//冠亚和结果4金额
                "firstSecond5": 0,//冠亚和结果5金额
                "firstSecond6": 0,//冠亚和结果6金额
                "firstSecond7": 0,//冠亚和结果7金额
                "firstSecond8": 0,//冠亚和结果8金额
                "firstSecond9": 0,//冠亚和结果9金额
                "firstSecond10": 0,//冠亚和结果10金额
                "firstSecond11": 0,//冠亚和结果11金额
                "firstSecond12": 0,//冠亚和结果12金额
                "firstSecond13": 0,//冠亚和结果13金额
                "firstSecond14": 0,//冠亚和结果14金额
                "firstSecond15": 0,//冠亚和结果15金额
                "firstSecond16": 0,//冠亚和结果16金额
                "firstSecond17": 0,//冠亚和结果17金额
                "firstSecond18": 0,//冠亚和结果18金额
                "firstSecond19": 0//冠亚和结果19金额
            },
            "appointStakeList": [//车辆名次指定押注
                {//车号为1的名次押注
                    "carNum": 1,//车号1，死值
                    "first": 0,//第一名金额
                    "second": 0,//第二名金额
                    "third": 0,//第三名金额
                    "fourth": 0,//第四名金额
                    "fifth": 0,//第五名金额
                    "sixth": 0,//第六名金额
                    "seventh": 0,//第七名金额
                    "eighth": 0,//第八名金额
                    "ninth": 0,//第九名金额
                    "tenth": 0//第十名金额
                },
                {//车号为2的名次押注
                    "carNum": 2,//车号2，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为3的名次押注
                    "carNum": 3,//车号3，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为4的名次押注
                    "carNum": 4,//车号4，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为5的名次押注
                    "carNum": 5,//车号5，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为6的名次押注
                    "carNum": 6,//车号6，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为7的名次押注
                    "carNum": 7,//车号7，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为8的名次押注
                    "carNum": 8,//车号8，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为9的名次押注
                    "carNum": 9,//车号9，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                },
                {//车号为10的名次押注
                    "carNum": 10,//车号10，死值
                    "first": 0,
                    "second": 0,
                    "third": 0,
                    "fourth": 0,
                    "fifth": 0,
                    "sixth": 0,
                    "seventh": 0,
                    "eighth": 0,
                    "ninth": 0,
                    "tenth": 0
                }
            ],
            "rankingStakeList": [//名次情况押注
                {//排名第一的具体情况
                    "rankingNum": 1,//第1名，死值
                    "big": 0,//大金额
                    "small": 0,//小金额
                    "odd": 0,//单金额
                    "even": 0//双金额
                },
                {//排名第二的具体情况
                    "rankingNum": 2,//第2名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第三的具体情况
                    "rankingNum": 3,//第3名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第四的具体情况
                   "rankingNum": 4,//第4名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第五的具体情况
                    "rankingNum": 5,//第5名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第六的具体情况
                    "rankingNum": 6,//第6名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第七的具体情况
                    "rankingNum": 7,//第7名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第八的具体情况
                    "rankingNum": 8,//第8名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第九的具体情况
                   "rankingNum": 9,//第9名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                },
                {//排名第十的具体情况
                    "rankingNum": 10,//第10名，死值
                    "big": 0,
                    "small": 0,
                    "odd": 0,
                    "even": 0
                }
            ]
    };

    //全局配置控制
    var config = {
        racingNum : '',  //本次期号
        setInterval : 1000,  //多少时间请求一次
        url : '/stake/config', //实时请求url
        yazhuUrl : '/stake/invoke',  //押注url
        modifyUrl : '/stake/result?racingNum=',
        newflag : true,
        stage : false  //是否所处于修改结果阶段，控制重复渲染
    };

    function bindEvent(){
        //渲染分组表格
        $('#table-box_1').html(template('tabelOne',{flag:true,data:yzTableData.one})).show();
        $('#table-box_2').html(template('tabelOne',{flag:false,data:yzTableData.two}));
        $('#table-box_3').html(template('tabelTwo',{data:yzTableData.three}));
        $('.group-item').click(function() {
            $(this).addClass('active').siblings('button').removeClass('active');
            var group = $(this).attr('data-group');
            if(group === 'one'){
                // var json = {};
                // // 是 1-5
                // json.flag = true;
                // json.data = yzTableData.one;
                $('.table-box').hide();
                $('#table-box_1').show();
            }else if(group === 'two'){
                // var json = {};
                // // 是 1-5
                // json.flag = false;
                // json.data = yzTableData.two;
                $('.table-box').hide();
                $('#table-box_2').show();
            }else if(group === 'three'){
                // var json = {};
                // json.data = yzTableData.three;
                $('.table-box').hide();
                $('#table-box_3').show();
            }
        });
        //点击进行押注操作
        $('.table-box').on('click','table td',function(){
            if($('.table-box').hasClass('disabled')){
                return;
            }
            if($(this).attr('data-keycode') == 'firstSecond20'||$(this).attr('data-keycode') == 'firstSecond21'||$(this).attr('data-keycode') == 'firstSecond22'){ //空td 不操作
                return;
            }
            if(!$(this).data('selected')){
                $(this).data('selected',true);
                $(this).addClass('selected');
            }else{
                $(this).data('selected',false);
                $(this).removeClass('selected');
            }
            return false;
        });

        //修改比赛结果
        $('#domodify').on('click',function(){
            $('.modify-notice').html('');
            var arr = [];
            $('.drag-item').each(function() {
                arr.push( $(this).html() );
            });

            //console.log(arr);
            var arrStr = '[';
            arrStr+=arr.join(',');
            arrStr+=']';

            $.ajax({
                url: config.modifyUrl+config.racingNum,
                type:'put',
                data : {racingResult:arrStr},
                dataType : 'json',
            }).done(function(res){
                if(res.result){ //成功
                    $('.modify-notice').html('修改成功');
                }else{
                    $('.modify-notice').html('修改失败，请重试');
                }
            }).fail(function(){
                $('.modify-notice').html('网络异常，请重新');
            })

        });


        //重置押注
        $('.reset').on('click',function(){
            $('.table-box table td').removeClass('selected');
            //初始化数据
            initSendData(sendData);
        });

        //押注
        $('.sub').on('click',function(){
            var moneyVal = $(this).parent().prev().find('.form-control').val();
            var re = /^[0-9]*[1-9][0-9]*$/;
            if(!moneyVal || !re.test(moneyVal)){
                alert('请输入合法金额，正整数');
                return;
            }
            if(!$('.table-box td').hasClass('selected')){
                alert('您还没有押注');
                return;
            }

            //console.log( makeParams(moneyVal) );
            var json = JSON.stringify(makeParams(moneyVal));
            //提交数据
            $.ajax({
                url: config.yazhuUrl,
                type:'post',
                data: {stake:json},
                dataType : 'json',
            }).done(function(res){
                if(res.result === 'SUCCESS'){
                    alert('押注成功');
                    $('.form-control').val('');
                    $('.table-box td').removeClass('selected');
                    initSendData(sendData);
                }else{
                    alert('押注失败，请重试');
                }
            }).fail(function(){
                //console.log('请求失败，请重试');
            })
        })

    }


    //组织发送数据
    function makeParams(num){
        var keyCode = ['big','small','odd','even']; //大小单双
        var keyCodeUp = ['firstUp','secondUp','thirdUp','fourthUp','fifthUp'];//龙
        var keyCodeDown = ['firstDowm','secondDowm','thirdDowm','fourthDowm','fifthDowm'];//虎
        var sortArr = ['first','second','third','fourth','fifth','sixth','seventh','eighth','ninth','tenth'];

        num = parseInt(num);
        $('.table-box td').each(function(){
            if($(this).hasClass('selected')){
                var gropItem = $(this).parents('table').parent().attr('id'); //属于1-5 or 6-10 or 冠亚组合
                if(gropItem == 'table-box_1'){
                    var key = $(this).attr('data-key'); //key 值
                    var carSort = $(this).attr('data-sort'); // 名次
                    var tr = $(this).attr('data-trid') // 行号与 大小单双龙虎对应
                    //console.log(tr,'tr');
                    //console.log('1-5组');
                    switch (parseInt(tr)) {
                        case 1:  //大小单双
                        case 2:
                        case 3:
                        case 4:
                            //console.log('大小单双');
                            sendData[key][carSort-1][keyCode[tr-1]] = num;
                            break;
                        case 5:
                            //console.log('龙');
                            sendData[key][keyCodeUp[carSort-1]] = num;
                            break;
                        case 6:
                            //console.log('虎');
                            sendData[key][keyCodeDown[carSort-1]] = num;
                            break;
                        default :
                            //console.log('1-10名');
                            sendData[key][tr-7][sortArr[carSort-1]] = num;
                            break;
                    }

                }else if(gropItem=='table-box_2'){
                    var key = $(this).attr('data-key'); //key 值
                    var carSort = $(this).attr('data-sort'); // 名次
                    var tr = $(this).attr('data-trid') // 行号与 大小单双龙虎对应
                    //console.log(tr,'tr');
                    //console.log('6-10');
                    switch (parseInt(tr)) {
                        case 1:  //大小单双
                        case 2:
                        case 3:
                        case 4:
                            //console.log('大小单双5-10');
                            sendData[key][carSort-1][keyCode[tr-1]] = num;
                            break;
                        default :
                            //console.log('1-10名');
                            sendData[key][tr-5][sortArr[carSort-1]] = num;
                            break;
                    }
                }else{
                    //console.log('冠亚组合');
                    var keyItem = $(this).attr('data-key');
                    var keyCodeItem = $(this).attr('data-keycode');
                    sendData[keyItem][keyCodeItem] = num;
                }

            }
        })

        return sendData;
    }
    //console.log( initSendData(sendData) );
    //初始化数据
    function initSendData(dataJson){
        $.each(dataJson, function(key, obj) {
            switch (key) {
                case 'commonStake':
                    $.each(obj, function(k, v) {
                        obj[k] = 0;
                    });
                    break;
                case 'appointStakeList':
                case 'rankingStakeList':
                    $.each(obj, function(index, val) {
                        $.each(val,function(k,v){
                            if(k !== 'carNum' && k !== 'rankingNum'){
                                val[k] = 0;
                            }
                        })
                    });
                    break;
                default:
                    return false;
            }
        });

        return dataJson;
    }


    //拖拽排序
    function dragSpan(){
        var range = { x: 0, y: 0 };//鼠标元素偏移量
        var lastPos = { x: 0, y: 0, x1: 0, y1: 0 }; //拖拽对象的四个坐标
        var tarPos = { x: 0, y: 0, x1: 0, y1: 0 }; //目标元素对象的坐标初始化
        var theDiv = null, move = false, choose = false; //拖拽对象 拖拽状态 选中状态
        var theDivHalf = 0,theDivWidth=0, oldColor=''; //拖拽对象的高度、颜色的初始化。
        var tarDiv = null, tarFirst, tempDiv; //要插入的目标元素的对象, 临时的虚线对象
        var initPos = {x: 0, y: 0};
        $(".drag-item").each(function(){
            $(this).mousedown(function (event){
                choose = true;
                //拖拽对象
                theDiv = $(this);
                //记录拖拽元素初始位置
                initPos.x = theDiv.offset().left;
                //initPos.y = theDiv.offset().top;
                //鼠标元素相对偏移量
                range.x = event.pageX - theDiv.offset().left;
                range.y = event.pageY - theDiv.offset().top;
                // theDivId = theDiv.index();
                theDivWidth = theDiv.width();
                theDivHalf = theDivWidth/2;
                oldColor = theDiv.css('background-color');
                theDiv.attr("class", "drag-item-dash");
                theDiv.css({left:initPos.x,'background-color':oldColor});
                 // 创建新元素 插入拖拽元素之前的位置(虚线框)
                $("<div class='dash'></div>").insertBefore(theDiv);
                tempDiv = $(".dash");
            });
       });
       $(document).mouseup(function(event) {
           if(!choose){return false;}
           if(!move){
                theDiv.attr("class", "drag-item");
                tempDiv.remove(); // 删除新建的虚线div
                choose = false;
                return false;
            }
            theDiv.insertBefore(tempDiv); // 拖拽元素插入到 虚线div的位置上
            theDiv.attr("class", "drag-item");//恢复对象的初始样式
            theDiv.css('background-color',oldColor);
            tempDiv.remove(); // 删除新建的虚线div
            move = false;
            choose = false;
            $(document).off('mouseup,mousemove');
        }).mousemove(function(event) {
            if(!choose) return false;
            move = true;
            lastPos.x = event.pageX - range.x;
            //lastPos.y = event.pageY - range.y;
            lastPos.x1 = lastPos.x + theDivWidth;
            // 拖拽元素随鼠标移动
            theDiv.css({left: lastPos.x + 'px','background-color':oldColor});
            // 拖拽元素随鼠标移动 查找插入目标元素
            var $main = $('.drag-item'); // 局部变量：按照重新排列过的顺序 再次获取 各个元素的坐标，
            $main.each(function (){
                tarDiv = $(this);
                tarPos.x = tarDiv.offset().left;
                tarPos.y = tarDiv.offset().top;
                tarPos.x1 = tarPos.x + tarDiv.width()/2;
                tarFirst = $main.eq(0); // 获得第一个元素
                tarFirstX = tarFirst.offset().left + theDivHalf ; // 第一个元素对象的中心纵坐标
                //拖拽对象 移动到第一个位置
                if (lastPos.x <= tarFirstX) {
                    tempDiv.insertBefore(tarFirst);
                }
                //判断要插入目标元素的 坐标后， 直接插入
                if (lastPos.x >= tarPos.x - theDivHalf && lastPos.x1 >= tarPos.x1 ) {
                    tempDiv.insertAfter(tarDiv);
                }
            });
         });
    }



    //顶部信息展示
    function renderHeaderInfo(json){
        $('#header-info').html(template('notice-title',json));
    }

    //实时获取在线信息
    function getInfo(){
        function action(){
            $.ajax({
                url : config.url,
                type: 'get',
                dataType : 'json'
            }).done(function(res){
                var resData = res;

                if(resData.result==='ERROR'){
                    //console.log('赞无比赛结果');
                    $('.notice-info').html('暂无比赛结果');
                    $('.table-box').addClass('disabled');
                    toast('赞无比赛结果');
                    return;
                }
                if(resData.result==='SUCCESS' && resData.data.stage == 4){ // 不可押注
                    //console.log('不可押注');
                    $('.toast').hide();

                    $('.mask').hide();
                    $('#modifying').hide();

                    $('.notice-info').html('现在禁止押注');
                    //此处禁止表格
                    $('.table-box').addClass('disabled');

                    config.newflag = false;

//                    return;
                }

                if(resData.result==='SUCCESS' && resData.data.stage == 2){ //计算最优结果
                    //console.log('计算最优结果中..');
                    config.racingNum = resData.data.racingNum;
                    $('.toast').hide();
                    $('.modify-notice').html('');

                    $('.table-box').addClass('disabled');
                    $('.notice-info').html('现在正在计算最优结果');
                    computerResult();
                    config.stage = false; //准备渲染这次的最优结果标志
                    //console.log(config.stage);
//                    return;
                }

                if(resData.result==='SUCCESS' && resData.data.stage == 3){ //改比赛结果
                    //console.log('修改比赛结果');
                    config.racingNum = resData.data.racingNum;
                    $('.toast').hide();
                    $('.table-box').addClass('disabled');
                    $('.notice-info').html('现在可以修改比赛结果');
                    modifyResult(resData.data.result);
//                    return;
                }


                if(resData.result==='SUCCESS' && resData.data.stage == 1){          //押注阶段
                    //console.log('押注时间');

                    //存储本次期号
                    config.racingNum = resData.data.racingNum;

                    //初始化数据
                    if(!config.newflag){
                        $('.table-box table td').removeClass('selected');
                        initSendData(sendData);
                        config.newflag = true;
                    }


                    $('.toast').hide();
                    $('.mask').hide();
                    $('#computering').hide();
                    $('#modifying').hide();
                    $('.table-box').removeClass('disabled');
                    $('.notice-info').html('现在是押注时间');
                }
                var json = resData.data;
                //计数封盘时间
                //console.log(json.endStakeTime - json.serverTime);
                json.stopTime = toMinSec(json.endStakeTime);
                //计算开奖时间
                //console.log(json.startTime - json.serverTime);
                json.startTime = toMinSec(json.startRacingTime);
                //渲染顶部信息
                renderHeaderInfo(json);
            }).fail(function(){
                //console.log('请求异常');
            });
            setTimeout(action,config.setInterval);
        }
        setTimeout(action,config.setInterval);
    }

    //tosat
    function toast(str){
        $('.toast').html(str).show();
    }

    //计算最优结果
    function computerResult(){
        $('.mask').show();
        $('#computering').show();
        $('#modifying').hide();
    }

    //修改比赛结果
    function modifyResult(resArr){
        $('.mask').show();
        $('#computering').hide();
        $('#modifying').show();
        if(!config.stage){ //避免重复渲染
            config.stage = true;
            $('.drag-box').html('');
            var html = '';
            $.each(resArr, function(index, val) {
                html+= '<span class="drag-item color-'+val+'">'+val+'</span>';
            });
            $('.drag-box').html(html);

            //console.log('drag');
            //拖拽排序
            dragSpan();
        }

    }

    //将毫秒数转为分秒数
    function toMinSec(time){
    	if(time<=0){
    		return "00:00";
    	}
        var totalSec = time/1000;
        var min = parseInt(totalSec/60);
        var sec = parseInt(totalSec%60);
        if(min<10){
            min = '0'+min;
        }
        if(sec<10){
            sec = '0'+sec;
        }
        return min+':'+sec;
    }

    //页面加载初始化
    function init(){
        getInfo();
        bindEvent();
    }
    init();


})()
