$.ajax({
	type: 'POST',
	url: 'utils/checkSession.php',
	success: function (data) {
		if($.trim(data)=='success'){
			loadData();
	    	$('.login').html('<a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a>');
         	$('#loginModal').modal('hide');
         	$('header,.container,footer').css({'display':'block'});
		}else{
			$('#loginModal').modal({
			    backdrop: 'static',
			    keyboard: false
			});
		}
	}
});

$('.login').click(function(){
	$.ajax({
        type: 'POST',
        url: 'utils/logout.php',
    	success: function (data) {
            location.reload();
    	}        
    });
});

$.ajax({
	type: 'POST',
	url: 'utils/getMetaData.php',
	data: '',
	success: function (data) {
		var data = $.parseJSON(data);
		$('select[name="loc"],select[name="updateloc"]').append('<option value="">Select Location</option>');
		for (var i = 0; i < data['locations'].length; i++) {
			$('select[name="loc"],select[name="updateloc"]').append('<option value="'+data['locations'][i]['ID']+'">'+data['locations'][i]['Name']+'</option>');
		}
		$('select[name="dept"],select[name="updatedept"]').append('<option value="">Select Department</option>');
		for (var i = 0; i < data['departments'].length; i++) {
			$('select[name="dept"],select[name="updatedept"]').append('<option value="'+data['departments'][i]['ID']+'">'+data['departments'][i]['Name']+'</option>');
		}
		$('select[name="que"]').append('<option value="">Select Security Question</option>');
		$('.que').append('<option value="">Select Security Question</option>');
		for (var i = 0; i < data['securityquestions'].length; i++) {
			$('select[name="que"]').append('<option value="'+data['securityquestions'][i]['ID']+'">'+data['securityquestions'][i]['Question']+'</option>');
			$('.que').append('<option value="'+data['securityquestions'][i]['ID']+'">'+data['securityquestions'][i]['Question']+'</option>');
		}
	}        
});

$('.forgotPassword').click(function(){
	$('.hideForgot').css({'display':'none'});
	$('.showForgot').css({'display':'block'});
	$('input.showForgot').css({'display':'inline-block'});
});

$('.backtoLogin').click(function(){
	$('.hideForgot').css({'display':'block'});
	$('.showForgot').css({'display':'none'});
});

$('#login-form').click(function(){
	var username = $('input[name="username"]').val();
	var password = $('input[name="password"]').val();
	if($.trim(username) == ''){
		alert('Username should not be empty');
		return false;
	}else if($.trim(password) == ''){
		alert('Password should not be empty');
		return false;
	}else{
		$('#loginModal').modal('show');
		$.ajax({
			type: 'POST',
			url: 'utils/login.php',
			data: {username:username,password:password},
        	success: function (data) {
	             if(data!=='fail'){
	             	alert('Successfully logined');
	             	$('.login').html('<a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a>');
	             	$('#loginModal').modal('hide');
	             	$('header,.container,footer').css({'display':'block'});
	             	loadData();
	             }else{
	             	alert('Fail to Login Check your Details');
	             }
        	}        
    	});
	}
});

$('.submit-forgot').click(function(){
	var username = $('input[name="username"]').val();
	var que = $('.que').val();
	var ans = $('.ans').val();
	var password = $('input[name="passwordNew"]').val();
	if($.trim(username) == ''){
		alert('Username should not be empty');
		return false;
	}else if($.trim(que) == ''){
		alert('Select Security Question');
		return false;
	}else if($.trim(ans) == ''){
		alert('Enter Answer For Security Question');
		return false;
	}else if($.trim(password) == ''){
		alert('Password should not be empty');
		return false;
	}else{
		$('#loginModal').modal('show');
		$.ajax({
        type: 'POST',
        url: 'utils/forgotPassword.php',
        data: {username:username,securityQuestionID:que,securityQuestionAnswer:ans,password:password},
        	success: function (data) {
        		if(data!=='fail'){
	            	alert('Successfully Changed');
	            	$('.hideForgot').css({'display':'block'});
					$('.showForgot').css({'display':'none'});
	            }else{
	             	alert('Fail to Change Check your Details');
	            }
        	}        
    	});
	}
});

$('#register-form').click(function(){
	var countLog = 0;
	$('#register .inputValidation').each(function(){
		if($(this).val()==''){
			countLog++;
			alert($(this).attr('placeholder'));
			return false;
		}
	});
	if(countLog==0){
		if(!$('input[name="gender"]').is(':checked')){
			alert('Select Gender');
		}else{
			$.ajax({
		        type: 'POST',
		        url: 'utils/register.php',
		        data: $( "#register form" ).serialize(),
		        success: function (data) {
		            if(data=='success'){
		             	alert('Successfully Registered Please login');
		             	$('input[type="text"]').val("");
		             	$('.nav-tabs a:first').tab('show');
		            }else{
		             	alert('Duplicate UserName Try Again.');
		            }
		        }        
		    });
		}
	}
});

function loadData() {
	$.ajax({
        type: 'POST',
        url: 'utils/getLoginUserDetails.php',
    	success: function (data) {
    		var data = $.parseJSON(data);
    		$('input[name="updateusername"]').val(data['Username']);
    		$('input[name="updatefname"]').val(data['FirstName']);
    		$('input[name="updatelname"]').val(data['LastName']);
    		$('input[name="updatedob"]').val(data['DOB']);
    		$('input[name="updategender"][value='+ data["Gender"] +']').prop('checked', true);
    		$('input[name="updatecontact"]').val(data['Contact']);
    		$('select[name="updatedept"]').val(data['DepartmentID']);
    		$('select[name="updatesem"]').val(data['Semester']);
    		$('select[name="updateloc"]').val(data['OriginLocation']);
    		if(data['Role']!=='Admin'){
    			$('.addRoom,.addRooms,#Queries,.nav-pills>li:last').remove();
    		}
    		$('.myRoomID').val(data['RoomID']);
    		$.ajax({
		        type: 'POST',
		        url: 'utils/getRooms.php',
		    	success: function (data) {
		    		var data = $.parseJSON(data);
		    		for (var i = 0; i < data.length; i++) {
		    			if($.trim(data[i].averageRoomRating)==''){
		    				var rating = 'Not Given';
		    			}else{
		    				var rating = parseFloat($.trim(data[i].averageRoomRating)).toFixed(2)+'/5';
		    			}
		    			if ($.trim($('.myRoomID').val())=='' && (data[i].Occupancy > data[i].currentOccupancy)) {
		    				var buttons = '<button type="button" class="btn btn-primary bookRoom">Reserve Room</button>';
		    			}else if($.trim(data[i].ID)==$.trim($('.myRoomID').val())){
		    				var buttons = '<button type="button" class="btn btn-primary checkOutRoom">Check Out</button>';
		    			}else{
		    				var buttons = '';
		    			}
		    			$('.roomsList').append('<div class="card"><div class="card-block"><p><span><b>Room Number:</b> '+data[i].ID+'</span></p><p><span><b>Floor Number:</b> '+data[i].FloorNumber+'</span></p><p><span><b>Occupancy:</b> '+data[i].Occupancy+'</span></p><p><span><b>current Occupancy:</b> '+data[i].currentOccupancy+'</span></p><p><span><b>Room Rating:</b> '+ rating +'</span></p><input type="hidden" class="roomId" value="'+data[i].ID+'"><button type="button" class="btn btn-info viewRoomDetails">View</button> '+buttons+'</div></div>');
		    		}
		    		
		    	}
		    });
		    $.ajax({
		        type: 'POST',
		        data: {roomID:$('.myRoomID').val()},
		        url: 'utils/getLoginQueries.php',
		    	success: function (data) {
		    		if(data!='fail'){
			    		var data = $.parseJSON(data);
			    		var queries='';
			    		if(data.length>0){
			    			queries+=('<div class="queriesBlock"><h3>Your Rooms Queries</h3>');
			    		}
			    		for (var i = 0; i < data.length; i++) {
			    			if($.trim(data[i].Response)!==''){
				    			var response = '<p><b>Response:</b> '+data[i].Response+'</p>';
				    		}else{
				    			var response = 'No Response';
				    		}
			    			queries+=('<div class="col-md-12 queriesList"><p><b>Name:</b> '+data[i].FirstName+' '+data[i].LastName+'</p><p><b>Query:</b> '+data[i].Query+'</p>'+response+'</div>');
			    		}
			    		if(data.length>0){
			    			queries+=('</div>');
			    		}
			    		$('#home').append(queries);
			    	}
		    	}
		    });
		    $.ajax({
		        type: 'POST',
		        url: 'utils/getQueries.php',
		    	success: function (data) {
		    		var data = $.parseJSON(data);
		    		console.log(data);
		    		var nores='';
		    		var res ='';
		    		if(data.length>0){
		    			$('#Queries').append('<div class="queriesBlock"><h3>Rooms Queries</h3></div>');
			    		for (var i = 0; i < data.length; i++) {
			    			if($.trim(data[i].Response)!==''){
				    			var response = '<p><b>Response:</b> '+data[i].Response+'</p>';
				    			res+='<div class="col-md-12 queriesList"><p><b>Name:</b> '+data[i].FirstName+' '+data[i].LastName+'</p><p><b>Room Number:</b> '+data[i].RoomID+'</p><p><b>Contact:</b> '+data[i].Contact+'</p><p><b>Query:</b> '+data[i].Query+'</p>'+response+'<input type="hidden" value="'+data[i].QueryId+'" class="queryId"></div>';
				    		}else{
				    			var response = '<div class="col-md-11"><input type="text" class="form-control response" placeholder="Enter Reply"></div><button type="button" class="btn btn-primary col-md-1 submit-Response">Reply</button>';
				    			nores+='<div class="col-md-12 queriesList"><p><b>Name:</b> '+data[i].FirstName+' '+data[i].LastName+'</p><p><b>Room Number:</b> '+data[i].RoomID+'</p><p><b>Contact:</b> '+data[i].Contact+'</p><p><b>Query:</b> '+data[i].Query+'</p>'+response+'<input type="hidden" value="'+data[i].QueryId+'" class="queryId"></div>';
				    		}
			    		}
			    		$('#Queries').append(nores+res);
		    		}
		    	}
			});
    	}
    });
}

$(document).on('click','.submit-Response',function(){
	var queryId = $(this).parent().find('.queryId').val();
	if($('.response').val()==''){
		alert('Enter Reply');
	}else{
		$.ajax({
	        type: 'POST',
	        url: 'utils/addResponse.php',
	        data: {queryId:queryId,response:$('.response').val()},
	    	success: function (data) {
	    		console.log(data);
	    		if(data='success'){
	    			location.reload();
	    		}else{
	    			alert(data);
	    		}
	    	}
	    });
	}
});

$(document).on('click','.addRoom',function(){
	if($(this).text()=='Add Room'){
		$('.addRoomBlock').show();
		$(this).text('Cancel');
	}else if($(this).text()=='Cancel'){
		$('.addRoomBlock').hide();
		$(this).text('Add Room');
	}
});


$(document).on('click','.submitRoom',function(){
	if($('.roomno').val()==''){
		alert('Room Number Should Not be empty');
	}else if($('.floorno').val()==''){
		alert('Floor Number Should Not be empty');
	}else if($('.occupancy').val()==''){
		alert('Occupancy Should Not be empty');
	}else{
		$.ajax({
	        type: 'POST',
	        data: {roomID:$('.roomno').val(),floorNumber:$('.floorno').val(),occupancy:$('.occupancy').val()},
	        url: 'utils/addRoom.php',
	    	success: function (data) {
	    		if(data=='success'){
	    			location.reload();
	    		}else{
	    			alert(data);
	    		}
		    }
		});
	}
});

$(document).on('click','.checkOutRoom',function(){
	$(this).parent().append('<div class="checkOutBlock"><div class="form-group"><label class="control-label">Give Rating:</label><select class="form-control rating"><option>Give Rating</option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option></select></div><div class="form-group"><button type="button" class="btn btn-primary submitCheckOut">Submit</button> <button type="button" class="btn btn-info cancelCheckout">Cancel</button></div></div>');
});

$(document).on('click','.cancelCheckout',function(){
	$('.checkOutBlock').remove();
});

$(document).on('click','.bookRoom',function(){
	var roomID = $(this).parent().find('input.roomId').val();
	$.ajax({
        type: 'POST',
        url: 'utils/reserveRoom.php',
        data: {roomID:roomID},
    	success: function (data) {
    		if($.trim(data)=='success'){
	    		location.reload();
	    	}else{
	    		alert('Reservations Failed');
	    	}
    	}
    });
    
});

$(document).on('click','.submitCheckOut',function(){
	if ($.trim($('.rating').val())=='Give Rating') {
		alert('Give Rating');
	}else{
		$.ajax({
		    type: 'POST',
		    url: 'utils/addRating.php',
		    data: {rating:$.trim($('.rating').val()),roomID:$('.myRoomID').val()},
		    success: function (data) {
		    	if($.trim(data)=='success'){
    				$.ajax({
					    type: 'POST',
					    url: 'utils/checkoutRoom.php',
					    data: '',
					    success: function (data) {
					    	if($.trim(data)=='success'){
					    		location.reload();
					    	}else{
					    		alert('Fail to Check Out');
					    	}
					    }
					});
		    	}else{
		    		alert('Fail to Check Out');
		    	}
		    }
		});
	}
});

$('.updateProfile').click(function(){
	var countLog = 0;
	$('#home .inputValidation').each(function(){
		if($(this).val()==''){
			countLog++;
			alert($(this).attr('placeholder'));
			return false;
		}
	});
	if(countLog==0){
		if(!$('input[name="updategender"]').is(':checked')){
			alert('Select Gender');
		}else{
			$.ajax({
		        type: 'POST',
		        url: 'utils/updateUser.php',
		        data: $( "#home form" ).serialize(),
		        success: function (data) {
		            if(data=='success'){
		             	alert('Updated Successfully');
		             	location.reload();
		            }else{
		             	alert('Fail to Updated Details.');
		            }
		        }        
		    });
		}
	}
});

$('.changePassword').click(function(){
	$('#home form').css({'display':'none'});
	$('.updatePasswordBlock').css({'display':'block'});
});

$('.backtoProfile').click(function(){
	$('#home form').css({'display':'block'});
	$('.updatePasswordBlock').css({'display':'none'});
});


$('.updatePassword').click(function(){
	var oldpass = $.trim($('.oldpass').val()),
	    newpass = $.trim($('.newpass').val()),
	    conpass = $.trim($('.conpass').val()),
	    username = $('input[name="updateusername"]').val();
	if(oldpass==''){
		alert('Enter Old Password');
	}else if(newpass==''){
		alert('Enter New Password');
	}else if(conpass==''){
		alert('Enter Conmfirm Password');
	}else if(conpass!==newpass){
		alert('New Password and Conmfirm Password not Matched');
	}else{
		$.ajax({
	        type: 'POST',
	        url: 'utils/updatePassword.php',
	        data: {username:username,password:oldpass,newPassword:newpass},
	        success: function (data) {
	            if(data=='success'){
	             	alert('Updated Successfully');
	             	location.reload();
	            }else{
	             	alert('Fail to Updated Details.');
	            }
	        }        
	    });
	}	
});

$(document).on('click','.viewRoomDetails',function(){
	var roomID = $(this).parent().find('input.roomId').val();
	$.ajax({
        type: 'POST',
        url: 'utils/getRoomData.php',
        data: {roomID:roomID},
    	success: function (data) {
    		var data = $.parseJSON(data);
    		console.log(data);
    		$('.roomDetails').html('');
    		$('.roomDetails').append('<h3>Rooms Details</h3>');
    		for (var i = 0; i < data['roomDetails'].length; i++) {
    			$('.roomDetails').append('<span class="col-md-3"><b>Room Number:</b> '+data['roomDetails'][i].ID+'</span> <span class="col-md-3"><b>Floor Number:</b> '+data['roomDetails'][i].FloorNumber+'</span><span class="col-md-3"><b>Occupancy:</b> '+data['roomDetails'][i].Occupancy+'</span><span class="col-md-3"><b>current Occupancy:</b> '+data['roomDetails'][i].currentOccupancy+'</span>');
    		}
    		if(data['reservations'].length>0){
    			$('.roomDetails').append('<div class="memberBlock"><h3>Rooms Members</h3></div>');
	    		for (var i = 0; i < data['reservations'].length; i++) {
	    			var dept = $("select[name='dept'] option[value='"+data['reservations'][i].DepartmentID+"']").text(),
	    				loc = $("select[name='loc'] option[value='"+data['reservations'][i].OriginLocation+"']").text();
	    			$('.roomDetails').append('<div class="col-md-4 memberList"><p><b>First Name:</b> '+data['reservations'][i].FirstName+'</p><p><b>Last Name:</b> '+data['reservations'][i].LastName+'</p><p><b>Contact:</b> '+data['reservations'][i].Contact+'</p><p><b>Gender:</b> '+data['reservations'][i].Gender+'</p><p><b>Department:</b> '+dept+'</p><p><b>Origin Location:</b> '+loc+'</p></div>');
	    		}
    		}
    		if(data['queries'].length>0){
    			$('.roomDetails').append('<div class="queriesBlock"><h3>Rooms Queries</h3></div>');
	    		for (var i = 0; i < data['queries'].length; i++) {
	    			if($.trim(data['queries'][i].Response)!==''){
		    			var response = '<p><b>Response:</b> '+data['queries'][i].Response+'</p>';
		    		}else{
		    			var response = 'No Response';
		    		}
	    			$('.roomDetails').append('<div class="col-md-12 queriesList"><p><b>Name:</b> '+data['queries'][i].FirstName+' '+data['queries'][i].LastName+'</p><p><b>Query:</b> '+data['queries'][i].Query+'</p>'+response+'</div>');
	    		}
    		}
    		if($('.myRoomID').val()==data['roomDetails'][0].ID){
	    		$('.roomDetails').append('<h3>Add Queriers</h3><div class=""><div class="form-group"><label for="comment">Query:</label><textarea class="form-control" rows="3" id="comment"></textarea></div><div class="form-group"><button type="button" class="btn btn-default sendQuery">Add Query</button></div></div>');
    		}
    	}
    });
});

$(document).on('click','.sendQuery',function(){
	if($.trim($('#comment').val())==''){
		alert('Query Field should not be empty');
	}else{
		$.ajax({
		    type: 'POST',
		    url: 'utils/addQuery.php',
		    data: {query:$.trim($('#comment').val()),roomID:$('.myRoomID').val()},
		    success: function (data) {
		    	if($.trim(data)=='success'){
		    		location.reload();
		    	}else{
		    		alert('Fail to add Query');
		    	}
		    }
		});
	
	}
});

$('.nav-pills a').click(function(e){
  e.preventDefault();
  $(this).tab('show');
});

// store the currently selected tab in the hash value
$("ul.nav-pills > li > a").on("shown.bs.tab", function(e) {
  var id = $(e.target).attr("href").substr(1);
  window.location.hash = id;
});

// on load of the page: switch to the currently selected tab
var hash = window.location.hash;
$('.nav-pills a[href="' + hash + '"]').tab('show');