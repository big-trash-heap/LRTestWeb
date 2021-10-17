const Net = require("net");

const server = Net.createServer((socket) => {
    
    socket.on("error", (error) => {

        console.log(error);
    });

    socket.on("data", (buffer) => {

        console.log(buffer.toString());
    });

    console.log("+1");
    socket.end("Hello");
});


server.listen(4571);
