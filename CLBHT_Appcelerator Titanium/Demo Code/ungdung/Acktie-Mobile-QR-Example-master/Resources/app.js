// Example for the Acktie Mobile QR Code reader (for both iOS and Android)

var qrreader = undefined;
var qrCodeWindow = undefined;
var qrCodeView = undefined;

var mon;
var maban= null;;
var mamon;
var soluong;
var ghichu;
var tuychinh; 

var winchinh = Titanium.UI.createWindow({  
    title:'Win 1',
    backgroundColor:'#fdcf93'
});
var win = Ti.UI.createWindow({backgroundColor: 'white', fullscreen: true});
var winthucdon = Ti.UI.createWindow({backgroundColor: 'white', fullscreen: true});
var listViewcafe = Ti.UI.createListView({	color: 'black',   font: { fontFamily:'Arial', fontSize: '30dp', fontWeight:'bold' }});
var listViewsinhto = Ti.UI.createListView({	color: 'black',   font: { fontFamily:'Arial', fontSize: '30dp', fontWeight:'bold' }});
var listView = Ti.UI.createListView({	color: 'black',   font: { fontFamily:'Arial', fontSize: '30dp', fontWeight:'bold' } });
var view = Titanium.UI.createView({
	top:'20%',
   width:'100%',
   height:'auto',
   layout:'horizontal' 
		
	});
var thucdon = Titanium.UI.createImageView({
		left:'10%',
		width:'40%',
		height:'auto',
		image:'images/menu.png'
	});
var chitiet = Titanium.UI.createImageView({
	
		width:'40%',
		height:'auto',
		
		image:'images/detail.png'
	});
var tinhtien = Titanium.UI.createImageView({
		left:'10%',
		width:'40%',
		height:'auto',
		
		image:'images/cash.png'
	});
var nhanvien = Titanium.UI.createImageView({
	
		width:'40%',
		height:'auto',
		
		image:'images/call.png'
		
	});

view.add(thucdon);
view.add(chitiet);
view.add(tinhtien);
view.add(nhanvien);
winchinh.add(view);
var self = Ti.UI.createWindow({
	orientationModes : [Ti.UI.PORTRAIT],
	backgroundColor : 'white',
	title : "Acktie Mobile QR",
});
//Depending on the platform, load the appropriate qr module
if (Ti.Platform.osname === 'iphone' || Ti.Platform.osname === 'ipad') {
	qrreader = require('com.acktie.mobile.ios.qr');
} else if (Ti.Platform.osname === 'android') {
	qrreader = require('com.acktie.mobile.android.qr');
}

/**
 * Read QR from a Photo Album
 * NOTE: Android does not currently support reading from the Image Gallery
 */



// Add Scan button from right nav bar on iPad
if (Ti.Platform.osname === 'ipad') {
	var navButton = Titanium.UI.createButton({
		title : 'Scan from Album'
	});
	self.rightNavButton = navButton;

	navButton.addEventListener('click', function() {
		qrreader.scanQRFromAlbum({
			navBarButton : navButton, //Only for the iPad
			success : success,
			cancel : cancel,
			error : error,
		});
	});
}




/**
 * Read QR code from Camera feed continuously until user press the done button.
 */



function success(data) {
	if (data != undefined && data.data != undefined) {
		Titanium.Media.vibrate();
		//alert(data.data);
		maban = data.data;
		winchinh.open();
	
		
	}
};

function cancel() {
	alert("Cancelled");
};

// Only used with scanning from photo gallery
function error() {
	alert("error");
};

function scanQRFromCamera(options) {
	
	qrCodeWindow = Titanium.UI.createWindow({
		
		
		navBarHidden: true,
		exitOnClose : false,
		backgroundColor : 'black',
		width : '100%',
		height : '100%',
	});
	qrCodeView = qrreader.createQRCodeView(options);

	var closeButton = Titanium.UI.createButton({
		title : "close",
		bottom : 0,
	    right : 0
	});
	

	closeButton.addEventListener('click', function() {
		qrCodeView.stop();
		qrCodeWindow.close();
	});

	

	qrCodeWindow.add(qrCodeView);
	qrCodeWindow.add(closeButton);

	if (Ti.Platform.osname !== 'ipad' && (options.useFrontCamera === undefined || (options.useFrontCamera != undefined && !options.useFrontCamera))) {
		
	}

	// NOTE: Do not make the window Modal for android.  It screws stuff up.  Not sure why
	if (Ti.Platform.osname !== 'android') {
		qrCodeWindow.open({modal:true});
	}
	else
	{
		qrCodeWindow.open();
	}
}

if (Ti.Platform.osname === 'android') {
	var activity = Ti.Android.currentActivity;
	activity.addEventListener('pause', function(e) {
		Ti.API.info('Inside pause');
		if (qrCodeView != undefined) {
			qrCodeView.stop();
		}

		if (qrCodeWindow != undefined) {
			qrCodeWindow.close();
		}
	});
}




var main_window = Ti.UI.createWindow();
main_window.open();
main_window.addEventListener('open', function(e){ 

 var options = {

		backgroundColor : 'black',
		width : '100%',
		height : '90%',
		top : 0,
		left : 0,
		success : success,
		cancel : cancel,
	};

	scanQRFromCamera(options);
	
	
 });


thucdon.addEventListener('click',function(e)
{
	///////////////////////////////THUCDON//////////////////////////////////////////////////////////////////////////////////////////////


// for textSearch, use the change event to update the search value
// search.addEventListener('change', function(e){
//     listView.searchText = e.value;
// });

// for textSearch, add the search bar or text field as a header view
// var listView = Ti.UI.createListView({headerView: search, caseInsensitiveSearch: true});
var listSection = Ti.UI.createListSection();
var thucdon = ['Cafe', 'Sinh Tố' ];

var data = [];
for (var i = 0; i < thucdon.length; i++) {
    data.push({
        properties: {title: thucdon[i], searchableText: thucdon[i],	color: 'black',   font: { fontFamily:'Arial', fontSize: '30dp', fontWeight:'bold' } }
    });
}
listSection.setItems(data);
listView.addEventListener('noresults', function(e){
    alert("No results found!");
});
listView.sections = [listSection];



				var listSectioncafe = Ti.UI.createListSection();
				var cafe = ['Cafe Kem', 'Cafe Baileys', 'Cafe Sữa Đá', 'Cafe Đá', 'Cafe Sữa Nóng', 'Bạc Xỉu Nóng', 'Bạc Xỉu Đá'];
				var data = [];
				for (var i = 0; i < cafe.length; i++)
				{
				data.push({
   				 properties: {title: cafe[i], searchableText: cafe[i],	color: 'black',   font: { fontFamily:'Arial', fontSize: '30dp', fontWeight:'bold' } } 
   				 })	;
				}
				listSectioncafe.setItems(data);
				listViewcafe.sections = [listSectioncafe];
				
				
				
				var listSectionsinhto = Ti.UI.createListSection();
				var sinhto = ['Sinh Tố Mít', 'Sinh Tố Dâu', 'Sinh Tố Xoài', 'Sinh Tố Mãng Cầu', 'Sinh Tố Bơ', 'Sinh Tố Sapo', 'Sinh Tố Đu Đủ'];
				var data = [];
				for (var i = 0; i < sinhto.length; i++)
				{
				data.push({
   				 properties: {title: sinhto[i], searchableText: sinhto[i],	color: 'black',   font: { fontFamily:'Arial', fontSize: '30dp', fontWeight:'bold' } } 
   				 })	;
				}
				listSectionsinhto.setItems(data);
			    listViewsinhto.sections = [listSectionsinhto];
				
win.add(listView);
win.open();				


		
	listView.addEventListener('itemclick', function(e){
		var item = e.section.getItemAt(e.itemIndex);
		 e.section.updateItemAt(e.itemIndex, item);  
		 if(e.itemIndex == 0)
		 {
		 	mon='cf';
		 	winthucdon.remove(listViewsinhto);
		 	winthucdon.add(listViewcafe);
		 	
		 	winthucdon.open();
		 }
		 else if(e.itemIndex == 1)
		 {
		 	mon='st';
		 	winthucdon.remove(listViewcafe);
		 	winthucdon.add(listViewsinhto);
		 	
		 	winthucdon.open();
		 }
			
	   // alert( " Item Index: " + e.itemIndex);
	   
		});


});	

	//////////////////////////////KETTHUCTHUCDON////////////////////////////////////////////////////////////////////////////////////////////////////////

	//tinhtien event ///
	tinhtien.addEventListener('click',function(e)
{
	
	win.close();	
winthucdon.close();
var url = "http://192.168.200.253/Coffee.asmx/TinhTien";
var client = Ti.Network.createHTTPClient({
// function called when the response data is available
onload : function(e) {
result = this.responseXML;
alert('Đã Tính Tiền , Chờ Xíu Ngen');

},
// function called when an error occurs, including a timeout
onerror : function(e) {
Ti.API.debug(e.error);
alert('error');
},
timeout : 5000 // in milliseconds
});

// Prepare the connection.
client.open("POST", url);
   
     //param
 		var params = {
            MaBan : maban
           
            
        };
     // Send the request.
     client.send(params);
	 
   });   
	/////ketthuc event tinh tien//
	
	///goi nhan vien event
		nhanvien.addEventListener('click',function(e)
{
		win.close();	
		winthucdon.close();
		var url = "http://192.168.200.253/Coffee.asmx/GoiPhucVu";
		var client = Ti.Network.createHTTPClient({
		// function called when the response data is available
		onload : function(e) {
		result = this.responseXML;
		alert('Đã Gọi Nhân Viên , Chờ Xíu Ngen');
		winthucdon.close();
		},
		// function called when an error occurs, including a timeout
		onerror : function(e) {
		Ti.API.debug(e.error);
		alert('error');
		},
		timeout : 5000 // in milliseconds
		});
		
		// Prepare the connection.
		client.open("POST", url);
		     //param
		 		var params = {
		            MaBan : maban
		           
		            
		        };
		     // Send the request.
		  client.send(params);
			
		     
   });   
   
	//ket thuc goi nhan vien event	
	
//su kien listviewcafe
	listViewcafe.addEventListener('itemclick', function(e){
	var item = e.section.getItemAt(e.itemIndex);
	e.section.updateItemAt(e.itemIndex, item);  
	
	mamon=''+mon+''+e.itemIndex;
	

var url = "http://192.168.200.253/Coffee.asmx/GoiMon";
var client = Ti.Network.createHTTPClient({
// function called when the response data is available
onload : function(e) {
result = this.responseXML;
alert('Đã Gọi Nước , Chờ Xíu Ngen');
winthucdon.close();
},
// function called when an error occurs, including a timeout
onerror : function(e) {
Ti.API.debug(e.error);
alert('error');
},
timeout : 5000 // in milliseconds
});

// Prepare the connection.
client.open("POST", url);
   
     //param
 		var params = {
            MaBan : maban,
            mon:mamon,
            phu:'1',
            soluong:'1',
            TuyChinh:'khong co tuy chinh'
            
        };
     // Send the request.
     client.send(params);
	
	
   // alert( " Item Index: " + e.itemIndex);
});
	//
//su kien listviewsinhto
	listViewsinhto.addEventListener('itemclick', function(e){
	var item = e.section.getItemAt(e.itemIndex);
	e.section.updateItemAt(e.itemIndex, item);  
	
	mamon=''+mon+''+e.itemIndex;
	

var url = "http://192.168.200.253/Coffee.asmx/GoiMon";
var client = Ti.Network.createHTTPClient({
// function called when the response data is available
onload : function(e) {
result = this.responseXML;
alert('Đã Gọi Nước , Chờ Xíu Ngen');
winthucdon.close();
},
// function called when an error occurs, including a timeout
onerror : function(e) {
Ti.API.debug(e.error);
alert('error');
},
timeout : 5000 // in milliseconds
});

// Prepare the connection.
client.open("POST", url);
   
     //param
 		var params = {
            MaBan : maban,
            mon:mamon,
            phu:'1',
            soluong:'1',
            TuyChinh:'khong co tuy chinh'
            
        };
     // Send the request.
     client.send(params);
	
	
   // alert( " Item Index: " + e.itemIndex);
});



///////////popup



