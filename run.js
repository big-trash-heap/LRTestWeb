const Net = require("net");



const server = Net.Server();


const player = {
    "x": 200,
    "y": 200,
    "buttons": {
        "w": false, // 0
        "a": false, // 1
        "s": false, // 2
        "d": false, // 3
    },
    "socket": null,
}


server.on("connection", (socket) => {

    socket.on("data", (buffer) => {
        
        const type = buffer.readUInt8(0);
        if (type == 1) {
            const mask = buffer.readUInt8(1);
            const buts = player.buttons;
            buts.w = (mask & 1) > 0;
            buts.a = (mask & 2) > 0;
            buts.s = (mask & 4) > 0;
            buts.d = (mask & 8) > 0;
        }
    });

    let buffer = Buffer.alloc(5);
    buffer.writeUInt8(15, 0);
    buffer.writeInt16LE(player.x, 1);
    buffer.writeInt16LE(player.y, 3);
    socket.write(buffer);

    player.socket = socket;
})


server.listen(4571);


setInterval(() => {
    
    const xmove = player.buttons.d - player.buttons.a;
    const ymove = player.buttons.s - player.buttons.w;
    if (xmove != 0 || ymove != 0) {

        player.x += xmove * 4;
        player.y += ymove * 4;

        let buffer = Buffer.alloc(5);
        buffer.writeUInt8(10, 0);
        buffer.writeInt16LE(player.x, 1);
        buffer.writeInt16LE(player.y, 3);
        player.socket.write(buffer);
    }

}, 1000 / 60)

/*
const Net = require("net");



// const server = Net.createServer((socket) => {

    
// });


const server = Net.createServer((socket) => {
    
    /*
        error
        data

    */
   /*
    socket.on("error", () => {

        console.log("er");
    });

    socket.on("close", () => {

        console.log("cl");
    });

    socket.on("data", (buffer) => {
        
        let type = buffer.readUInt8(0);
        if (type == 255) socket.close();
        console.log(type, buffer.toString());
    });

    console.log("+1");
    
    socket.write("hello");
    socket.write("world");
    
}).on("close", () => {
    console.log("close")
});


server.listen(4571);
*/