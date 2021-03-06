const express = require("express");
const bodyParser = require("body-parser");
const CookieSession = require("cookie-session");
const methodOverride = require("method-override");
const formidable = require("express-form-data");
const sessionMiddleware = require("./middleware/session");
const rMiddleware= require("./middleware/r");

// Conexión Base de datos
const mysql = require("mysql")
const con =mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database :"andapez"
})

con.connect(function(err) {
    if (err) throw err;});
//main app
const app = express();

const routerAdmin = require("./routers/routerAdmin");
const routerD = require("./routers/routerD");
const routerW = require("./routers/routerW");

app.use(methodOverride("_method"));
app.set("view engine","pug");

app.use("/public",express.static('public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(CookieSession({
    name: "session" ,
    keys : ["llave1","llave2"]
}));
app.use(formidable.parse({keepExtensions :true}));

app.get("/",function(req,res) {
    res.render("index");
});
app.get("/login",function(req,res) {
    res.render("login");
});

app.post("/sessions",function(req,res) {
    let sql = "SELECT * FROM usuarios WHERE username= ? AND password= ?";
    con.query(sql,[req.body.username,req.body.password],function (err,result){
        if(err) throw err;
        if(result.length == 0){
            res.redirect("/login");
        }else{
            req.session.userID = result[0].DNI;
            req.session.userType = result[0].usertype;
            if(result[0].usertype=='administrador'){
                res.redirect("/admin");
            }else if(result[0].usertype=='diseñador'){
                res.redirect("/designer");
            }else if(result[0].usertype=='obrero'){
                res.redirect("/worker");
            }else
                res.redirect("login");
            }
        });
});
app.use("/admin",rMiddleware);
app.use("/admin",sessionMiddleware);
app.use("/admin",routerAdmin);
app.use("/designer",sessionMiddleware);
app.use("/designer",rMiddleware);
app.use("/designer",routerD);
app.use("/worker",sessionMiddleware);
app.use("/worker",rMiddleware);
app.use("/worker",routerW);
app.listen(8080);
