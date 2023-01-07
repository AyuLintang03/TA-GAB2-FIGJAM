module.exports ={
    home(req,res){
        res.render("home",{
            url: 'http://localhost:3000/home',
            userName: req.session.username,
        });
    }
    


}