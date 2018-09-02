function clear_fields() {
	
for( var n = 0; n < document.forms.length; n++ ) {
 
   for(var i = 0; i < document.forms[n].elements.length; i++) {
         
           if( document.forms[n].elements[i].type == 'text') {
                document.forms[n].elements[i].value = '';
           }
    }

}
}
function laChuoiRong(str)
{
	if( str=='' || str==null)
	{
		return true;
	}
	else
	{
		return false;
	}
}
function laEmail(str) 
{               
    var at="@"
    var dot="."
    var lat=str.indexOf(at)
    var lstr=str.length
    var ldot=str.indexOf(dot)
     // Neu @ khong co, hoac o vi tri dau tien hoac o vi tri cuoi cung
   	if (lat==-1 || lat==0 || lat == lstr)
   	{
   		return false
   	}              
    //neu dau (.) khong co, hoac o vi tri dau tien, hoac o vi tri cuoi cung 
    if (ldot==-1 || ldot==0 || ldot==lstr){
		return false
	}       
    //Neu @ xuat hien nhieu hon l lan   
    if (str.indexOf(at,(lat+1))!=-1){
            return false
    }
    //Vi tri @ ben canh dau cham (.)              
    if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot)
	{        
    	return false
    }           
                       
    //Kiem tra neu email co khoang trang
    if (str.indexOf(" ")!=-1){     
		return false
    }                 
	return true                    
}    

function laSoNguyen(str)
{
	if(!isNaN(str) )
	{
		if (parseInt(str) != str)
		{
			return false;				
		}
		else if( str < 0 )
		{
			return false;
		}
	}
	else
	{
		return false;
	}
	
	return true;
}
function KiemTraDT(str){
	var idDT = document.getElementById(str);
	var str = idDT.value;
	var pattern = /[0-9]{9}/;
	var kq = pattern.test(str);
	if(!kq)
	/*{
		//alert('B?n ?ã nh?p sai CMND!!!');
		//idCMND.value="";
		//idCMND.focus();
		return false;
	}*/
	return true;
}
function laNgay(udt)
{
		if(udt.indexOf("/") == -1){
			return false;
		}
		dt1 = udt.split("/")
		mm1 = parseInt(dt1[0]);
		dd1 = parseInt(dt1[1]);
		yy1 = parseInt(dt1[2]);
		if(isNaN(dd1) || isNaN(mm1) || isNaN(yy1)){
			return false;
		}
		dt2 = new Date(mm1+'/'+dd1+'/'+yy1);
		dd2 = dt2.getDate();
		mm2 = dt2.getMonth()+1;
		yy2 = dt2.getFullYear();
		
		//alert(dd1+'/'+mm1+'/'+yy1);
		//alert(dd2+'/'+mm2+'/'+yy2);
		if(!(dd1==dd2 && mm1==mm2 && yy1==yy2))
		{
			return false;
		}
		return true;
}
//X? lý s?
function laso(n)
    {
        if (isNaN(Number(n)))
            return false;
        else if(n<0)
            return flase;
            
return true;
}
