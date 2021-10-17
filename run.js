const HTTP = require("http");

HTTP_SERVER = HTTP.createServer((req, res) => {

    res.end("Hello!");
});

HTTP_SERVER.listen(80);
