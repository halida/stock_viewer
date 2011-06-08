function create_stock_display(name, data){
    var canvas = $(name)[0];
    var ctx = canvas.getContext("2d");
    ctx.fillStyle = '#e2f0a1';
    //ctx.fill('#000000');
    ctx.fillRect(0, 0, canvas.width, canvas.height);
}
