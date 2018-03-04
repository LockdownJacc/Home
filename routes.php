<?php
/* 
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|  
*/
//////////////|------ PAGINA PRINCIPAL -------|////////
Route::get('/','home@index');
 
//--------------Nuevo Usuario -----------------//
Route::get('/registro','usuarioss@registro')->name('registro'); 

Route::post('/altaregistro','usuarioss@altaregistro')->name('altaregistro');
Route::get('/comprueba/{username}','usuarioss@comprueba');//manda al controlador para buscar el costo yy limite de usuarios para la funcion js

///////FORMULARIO DE INICIO DE SESION
Route::get('/login','usuarioss@login')->name('login');
///////VALIDACION DE SESION
Route::post('/valida','usuarioss@valida')->name('valida');
///////PAGINA DE INICIO
Route::get('/inicio','usuarioss@inicio')->name('bienvenido');

Route::get('/iniciousuario','usuarioss@iniciousu')->name('bienvenidousu');
/////////////////////////////////////////////////////////
Route::post('/iniciou','usuarioss@iniciou')->name('iniciou');
Route::get('/iniciouu','usuarioss@iniciouu')->name('iniciouu');
//////////////////////////////////////////////////////////////////////
Route::post('/iniciousu','usuarioss@iniciousuario')->name('bienvenidousuario');

Route::get('/inicioAdmin','usuarioss@inicioAdmin')->name('bienvenidoAdmin');

Route::get('/cerrarsesion','usuarioss@cerrarsesion')->name('cerrarsesion'); 

//////////////|------ CRUD USUARIOS -------|//////////
///////// FORMULARIO PARA PAG PRINCIPAL USUARIOS //////
Route::get('usuario','usuarioss@Usuario');
///////FORMULARIO PARA REG. USUARIO
Route::get('/altausu','usuarioss@newUser')->name('altausu');
///////ALTA DE USUARIO
Route::post('/recibeinfor','usuarioss@recibeinformacion')->name('recibeinfo');
////// EDITAR USUARIOS ///
Route::get('editu/{id}','usuarioss@index');
Route::put('update/{id}','usuarioss@update')->name('edit');
////// ELIMINAR USUARIOS ///
Route::get('delit/{id}','usuarioss@delite')->name('delit');
//////////////|------ CRUD USUARIOS -------|//////////

//////////////|------ CRUD EMPRESAS -------|//////////
Route::get('empresa','Empresass@index')->name('index');
Route::get('alta','Empresass@crear');
Route::post('/recibeinfor','Empresass@recibeinformacion')->name('recibeinfo');
Route::get('edita/{id_empresa}','Empresass@edita');

Route::get('delit/{id}','Empresass@delit');

//////////////|------ CRUD CONTABILIDAD -------|//////////
//////////////|------ APERTURA CONTABILIDAD -------|//////////
Route::get('contaap','Contabilidad@apertura');
Route::get('contabilidadinicio','Contabilidad@altaapertura')->name('altaapertura');


//---------------Sistema Administrador ------------------------------//
Route::get('/busempresa','Empresass@busempresa')->name('busempresa');//

Route::get('/busempre','Empresass@busempre')->name('busempre');
//------------------- CRUD EMPRESAS ---------------------------------//
Route::get('altaempresa','Empresass@altaempresa');

Route::post('/newempresa','Empresass@guardaem')->name('guardaem');

Route::get('/editaEmpresa/{id_empresa}','Empresass@editaem')->name('editaem');

Route::post('/editaEmpresas/{id_empresa}','Empresass@guardaempresa')->name('editaemp');

Route::get('/borrarempresa/{id_empresa}','Empresass@borraempresa')->name('borraempresa');

Route::get('/forzareliminacion/{id_empresa}','Empresass@forzareliminacion')->name('forzareliminacion');

//------------------- CRUD USUARIOS ---------------------------------//
Route::get('/adduser','usuarioss@adduser');
Route::get('/show','usuarioss@showuser');
Route::get('/showsub','usuarioss@showsub');
Route::post('/reciveinfo','usuarioss@reciveinfo')->name('reciveinfo');
Route::get('/delete/{id}','usuarioss@delit');
Route::get('/desac/{id}','usuarioss@desactivar');

///////////////////////////////////////////
Route::get("/buscapoliza", "Empresass@buscapoliza")->name('buscapoliza');

/////////////----------------PAGOS ----------------------/////
Route::get('pagos','usuarioss@altapago');

Route::get('/contrato/{id_contrato}','usuarioss@contrato')->name('contrato');//manda al controlador para buscar el costo yy limite de usuarios para la funcion js

Route::post('/guardapago','usuarioss@guardapago')->name('guardapago');

//----------------FORMULARIO DE INICIO DE SESION sUPER USUARIO -----------//
Route::get('/loginSU','usuarioss@loginSU')->name('loginSU');

Route::post('/validaSU','usuarioss@validaSU')->name('validaS');

Route::get('/bienvenidosu','usuarioss@inicioSU')->name('bienvenidoSU');

//---------------------Control de Pagos-----------------------//

Route::get('forcedestroy/{id}','usuarioss@forced');

route::get('controlpagos','usuarioss@control');

Route::get('anual/{id}','usuarioss@control2')->name('anual');
//-----------------Bitacora---------------------------------//
Route::get('bitacora','usuarioss@bita');

//------------------lectura-----------------------------------//
Route::get('/lecturaxml','usuarioss@lecturaxml')->name('lecturaxml'); 

//////////////////////////////////////////////////////////////////7
Route::get('dropzoneE', 'usuarioss@dropzone');
Route::post('dropzone/store', ['as'=>'dropzone.store','uses'=>'usuarioss@dropzoneStore']);
////////////////////////////////////////////////////////////////
Route::get('dropzoneR','rarController@index');
Route::post('upload','usuarioss@Recividos');

//---------------------------Descarga masiva---------------------------//
Route::get('/descargama','usuarioss@descargama')->name('descargama');

//----------------------------LECTURA XML---------------------------//

Route::get('/mmm','usuarioss@mmm');
/////////////////////////////////////////////////////
Route::get('/showdir','usuarioss@lista');
Route::get('/showfiles2/{ano}','usuarioss@files');


Route::get('variable/{id}/','usuarioss@xls');

///////////// PDF Rutas Con parametros ////////////////


Route::get('pdf/{id}/{rfc}/{nombre}/{subtotal}/{ieps}/{ivar}/{total}/{folio}/{fecha}','usuarioss@pdf');

Route::get('pdf_E/{uuid_e}/{rfc_e}/{nombre_e}/{subtotal_e}/{iva_tras_e}/{iva_rete}/{total_ingreso_e}/{folio_e}/{fechar_ch}','usuarioss@pdf_E');

/////////////////////////////////////////////////////////////////////////
Route::get('file','usuarioss@listar_archivo');

Route::get('variable/{id}/{rfc}/{nombre}','usuarioss@xls');