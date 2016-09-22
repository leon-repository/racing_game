var config = {
    stage:4,
    countdown: 0,
    minSpend: 30000,
    spends:{},
    sort:[],
    url:{
         // raceNew: 'json/raceNew.json',
         // receHistory: 'json/raceHistory.json'
        raceNew: 'http://120.26.75.31:8080/racing/new',
        receHistory: 'http://120.26.75.31:8080/racing/history'
    }
};

function bgTrastion(){
    $(".bg").animate({
        right: -21761 + $(window).width()
    },31000,"linear");
}

function bgMusicPlay() {
    var audio = document.getElementById("bgMusic");
    audio.play();
}

function bgMusicStop() {
    var audio = document.getElementById("bgMusic");
    audio.pause();
    audio.currentTime = 0;
}
//比赛时是否静音
function bgMusicMuted(flag){
    var audio = document.getElementById("bgMusic");
    audio.muted = flag;
}

function countdownMusicPlay() {
    var audio = document.getElementById("countdownMusic");
    audio.currentTime = 0;
    audio.play();
}

function awardMusicPlay() {
    var audio = document.getElementById("awardMusic");
    audio.currentTime = 0;
    audio.play();
}

//计算车道
function lane(){
    var cars = $('.car_game .car'),
        car_num = cars.length,
        h = $('.car_game').height(),
        top =(h - 150) / car_num - 2,
        right = 10;
    cars.removeClass('run');
    cars.removeClass('fast');
    cars.each(function(){
        var $this = $(this);
        var i = $this.index();
        $this.css({
            right: right*i + 180,
            top: 150 + top*i
        });
    })
}
lane();

//计算动画时间
function speed() {
    var sort = config.sort;
    var stage = config.stage;
    var data = {};
    minSpend = config.minSpend;
    var car1_start_margin_right = 300; //car1 起点线距离屏幕右侧的距离
    var car1_end_margin_left = 500; //car1 终点线距离屏幕右侧的距离
    var width = $(window).width();
    var ave_w = (width - car1_end_margin_left - car1_start_margin_right) / stage;
    $.each(sort, function(i, value) {
        var totalSpend = minSpend + 500 * i;
        var car = data[value] = {};
        var average = totalSpend / stage;
        var range_min = average / 2;
        var n = 0;
        var sum = 0;
        var pos = car1_start_margin_right + value * 10;
        car.totalSpend = totalSpend;
        car.average = average;
        car.per = [];
        while (n < stage - 1) {
            var rand = Math.random();
            var pos_end = pos + ave_w * (n + 1);
            car.per.push({
                spend: rand,
                end: pos_end
            });
            sum += rand;
            n++;
        }
        var m = totalSpend / 2 / sum;
        for (var i in car.per) {
            car.per[i].spend = car.per[i].spend * m + range_min;
        }
        for (var k in car.per) {
            if(car.per[i].spend);
        }
        car.per.push({
            spend: average/1.5,
            end: width
        });
    });
    return data;
}

//车辆行驶
function carAnimation(){
    var sort = config.sort;
    var cars = $('.car_game .car');
    cars.addClass('run');
    var spends = config.spends;
    var race_sort = 1;
    cars.each(function(i){
        var i = i + 1;
        var state = config.stage;
        var n = 0;
        var car = $(".car" + i);
        function travel() {
            car.animate({
                right: spends[i].per[n].end,
            }, spends[i].per[n].spend, "linear", function() {
                if(n+1 == state) {
                    car.data("sort", race_sort++);
                    if(sort[sort.length-1] == i) {
                        gameOver();
                    }
                    return;
                }
                if(spends[i].per[n+1]) {
                    if (spends[i].per[n + 1].spend > spends[i].per[n].spend) {
                        car.addClass('fast');
                    } else {
                        car.removeClass('fast');
                    }
                }
                n++;
                travel();
            });
        }
        travel();
    });
}

//倒计时
function countDown() {
    var cd = setInterval(function(){
        config.countdown--;
        $('.car_game .count').show();
        if(config.countdown == 0){
            clearInterval(cd);
            $('.car_game .count').html('go').fadeOut();
            bgTrastion();
            carAnimation();
            bgMusicPlay();
            raceSort();
        }
        $('.car_game .count').html(config.countdown);
        if(config.countdown < 5)
            countdownMusicPlay();
    }, 1000);
}
function countTime(serverTime, startTime){
     return parseInt((startTime - serverTime) / 1000);
}

//赛车实时排序
function raceActualTimeSort() {
    var cars = $('.car_game .car');
    var sort = [];
    cars.each(function(i){
        var $this = $(this);
        var right = $this.css('right');
        var obj = {};
        obj.name = i + 1;
        obj.value = parseInt(right);
        obj.sort = $this.data('sort');
        sort.push(obj);
    });
    sort.sort(function(a, b){
        if(a.value < b.value) {
            return 1;
        }
        else if(a.value > b.value) {
            return -1;
        } else {
            if(a.sort > b.sort) {
                return 1;
            } else {
                return -1;
            }
        }
    });
    var tmpl = '';
    $.each(sort, function(i, item){
       tmpl+='<span class="text_bg text_bg_'+item.name+'">'+item.name+'</span>';
    });
    $('.race-sort').empty().append(tmpl);

    // var lastCar = config.sort[config.sort.length - 1];
    // var last_pos = parseInt($('.car_game .car'+lastCar).css('right'));
    // var last_end = $(window).width() - 300;
    // if(last_pos >= last_end) {
    //     cars.stop(true, false);
    //     gameOver();
    // }
}

var race;
function raceSort() {
    race = setInterval(raceActualTimeSort, 50);
}

function play() {
    config.spends = speed();
    award();
}

function ready() {
    $('.award').fadeOut();
    $(".bg").css('right', 0);
    lane();
}

//比赛结束
function gameOver() {
    raceActualTimeSort();
    clearInterval(race);
    bgMusicStop();
    $('.award').show();
    awardMusicPlay();
    setTimeout(function(){
        ready();
        loadRaceHistory();
        loadRaceNew();
    }, 10000);
    // alert('GAME OVER!!!');
}

//音效开关
$(document).on('click', '.bgMusicMuted.close', function () {
    bgMusicMuted(false);
    $(this).html('静音');
    $(this).addClass('open').removeClass('close');
});
$(document).on('click', '.bgMusicMuted.open', function (){
    bgMusicMuted(true);
    $(this).html('音效');
    $(this).addClass('close').removeClass('open');
});

//颁奖
function award() {
    var award = $('.award');
    award.find('.award_123').find('div').removeClass(function(index, css) {
        return (css.match (/\bcar\S+/g) || []).join(' ');
    });
    award.find('.st1').addClass('car'+config.sort[0]+'-big');
    award.find('.nd2').addClass('car'+config.sort[1]+'-big');
    award.find('.rd3').addClass('car'+config.sort[2]+'-big');
}

function loadRaceNew() {
    $.ajax({
        url: config.url.raceNew,
        dataType: 'json',
        success: function(data) {
            if(!data || data.result != 'SUCCESS') {
                setTimeout(function () {
                    loadRaceNew()
                }, 2000);
                return;
            }
            if(!data.data.isCanStart) {
                $('.car_game .count').show().html('比赛未开始');
                setTimeout(function () {
                    loadRaceNew()
                }, 2000);
                return;
            }
            if(!data.data.racingResult) {
                setTimeout(function () {
                    loadRaceNew()
                }, 2000);
            } else {
                config.sort = data.data.racingResult;
                play();
            }
            if(!config.countdown) {
                var serverTime = data.data.serverTime;
                var startTime = data.data.startTime;
                config.countdown = countTime(serverTime, startTime);
                countDown();
            }
        }
    });
}
loadRaceNew();

function loadRaceHistory() {
    $.ajax({
        url: config.url.receHistory,
        dataType: 'json',
        success: function(data) {
            if(!data) return;
            var html1 = template('raceTemp', data.data[0]);
            $('.race-sort').html(html1);
            var html2 = template('lastHistoryTemp', data.data[0]);
            $('.last_result').html(html2);
            var html3 = template('raceHistoryTemp', data);
            $('#raceHistory').html(html3);

        }
    });
}
loadRaceHistory();