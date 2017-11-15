const express = require("express");
const bodyParser = require("body-parser");
const CookieSession = require("cookie-session");
const methodOverride = require("method-override");
const formidable = require("express-form-data");
const sessionMiddleware = require("./middleware/session");
// Conexión Base de datos
const mysql = require("mysql")
const con =mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "usuarioutp",
    database :"andapez"
})

con.connect(function(err) {
    if (err) throw err;});
//main app
const app = express();

const routerAdmin = require("./routers/routerAdmin");

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
            if(result[0].usertype=='administrador'){
            res.redirect("/admin");
            }else
                res.redirect("login");
            }
        });
});
app.use("/admin",sessionMiddleware);
app.use("/admin",routerAdmin);
app.listen(8080);
