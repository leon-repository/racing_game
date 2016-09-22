(function(){
    $.ajax({
        //url : './json/data.php',
        url : '/stake/count',
        type: 'get',
        dataType:'json',
    }).done(function(res){
        if(res.result == 'SUCCESS'){
            var data = res.data;
            //console.log(data);
            var arr1 = [],arr2=[];

            for(var i=0; i<data.length; i++){
                if(i<8){
                    arr1.push(data[i]);
                }else{
                    arr2.push(data[i]);
                }
            }
            var html = '';
            html+= template('tableTemp',{data:arr1});
            html+='<br><br>';
            html+= template('tableTemp',{data:arr2});
            $('#table-box').html(html);
        }
    })
})()
