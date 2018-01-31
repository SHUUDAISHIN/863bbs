function two(n){
    return n<=9 ? '0'+n : n
}
var _currYear = new Date().getFullYear();
var _currMonth = new Date().getMonth()+1;
var _currDate = new Date().getDate();

calender('#testc2').init({format : 'yyyy-MM-dd',
    date : [_currYear,_currMonth,_currDate],
    button : true,
    onload : function(){
        //时间DOM
        var _nowDate = new Date();
        var html ='<div id="container5" class="containerWrap" data-end="'+_nowDate.getHours()+'" data-max="23">\
                    <div class="rangeBox rangeBox1 rangeBoxNone" data-drag></div>\
                    <div class="rangeBox rangeBox2" data-drag><span class="rangeNumSpan"></span></div>\
                    <div class="rangeSlide"></div>\
                </div>\
                <div id="container6" class="containerWrap" data-end="'+_nowDate.getMinutes()+'" data-max="59">\
                    <div class="rangeBox rangeBox1 rangeBoxNone" data-drag></div>\
                    <div class="rangeBox rangeBox2" data-drag><span class="rangeNumSpan"></span></div>\
                    <div class="rangeSlide"></div>\
                </div>';
        //插入节点
        document.querySelector('.calender-button').insertAdjacentHTML("beforeBegin", html);
        var _range5 = new Range('#container5',function(a,b){
            this.querySelector('.rangeNumSpan').innerHTML=h = two(b[1]);
        });
        _range5.clickOff = true
        var _range6 = new Range('#container6',function(a,b){
            this.querySelector('.rangeNumSpan').innerHTML=m = two(b[1]);
        });
        _range6.clickOff = true
    }
},function(date){
    this.value = date + ' '+ h+':'+m
});