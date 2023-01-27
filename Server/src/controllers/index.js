const login = require('./controller-login');
const register = require('./controller-register');
const home = require('./controller-home');
const user = require('./controller-account');
const produk = require('./controller-produk');
const barangmasuk = require('./controller-barangmasuk');
const barangkeluar = require('./controller-barangkeluar');
const cetak = require('./controller-cetak');
const countdatabarang = require('./controller-count-databarang');
const countdatauser = require('./controller-count-datauser');
const sumdatabarang= require('./controller-sum-stokbarang');
module.exports ={
	login,
	register,
	home,
	user,
	produk,
	barangmasuk,
	barangkeluar,
	cetak,
	countdatabarang,
	countdatauser,
	sumdatabarang
	
};