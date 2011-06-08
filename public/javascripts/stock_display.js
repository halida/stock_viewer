function create_stock_display(name, data){
    var canvas = $(name)[0];
    var ctx = canvas.getContext("2d");
    ctx.fillStyle = '#e2f0a1';
    //ctx.fill('#000000');
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    var width = canvas.width;
    var height = canvas.height;

    var dx = width / (data.length + 1);
    var x = dx;
    var max = 0;
    var min = 100000;
    $.each(data, function(){
	    var h = this[2];
	    var l = this[3];
	    max = h > max? h : max;
	    min = l < min? l : min;
	});

    function getPos(v){
	return height - (v - min) * (height / (max - min));
    }

    $.each(data, function(){
	    var o = this[0];
	    var c = this[1];
	    var h = this[2];
	    var l = this[3];

	    ctx.fillStyle = c > o ? 'blue' : 'red';
	    var y1 = getPos(l);
	    var y2 = getPos(h);
	    ctx.fillRect(x, y2, 4, y1-y2);

	    ctx.fillRect(x-2, getPos(o), 2, 1);
	    ctx.fillRect(x+4, getPos(c), 2, 1);

	    x += dx;
	});
}
