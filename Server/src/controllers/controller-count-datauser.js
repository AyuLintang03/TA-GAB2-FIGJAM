const config = require('../configs/database');
const mysql = require('mysql');
const pool = mysql.createPool(config);

pool.on('error',(err)=> {
    console.error(err);
});

module.exports ={
    // Ambil data semua produk
    getCountDataUser(req,res){
        pool.getConnection(function(err, connection) {
            if (err) throw err;
            connection.query(
                `
                SELECT COUNT(*) FROM tbl_user;
                `
            , function (error, results) {
                if(error) throw error;  
                res.render('admin-datauser.ejs',{ 
                    datas: results[0]['COUNT(*)']
                });
            });
            connection.release();
        })
    }
}