$(function(){

	var dropimage = $('.dropimage');

	dropimage.on('dragover', function(e){
		e.stopPropagation();
		e.preventDefault();
		e.stopImmediatePropagation();
		$(this).addClass("dragoverhighlight");
	});


	dropimage.on('dragleave', function(e){
		e.stopPropagation();
		e.preventDefault();
		e.stopImmediatePropagation();
		$(this).removeClass("dragoverhighlight");
	});

	dropimage.on('drop', function(e){
		e.stopPropagation();
		e.preventDefault();
		e.stopImmediatePropagation();
		$(this).removeClass("dragoverhighlight");

		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];
		console.log(file);

		upload(file);

	});


	function upload(file){
		xhr=new XMLHttpRequest();

		xhr.open('post','drop.php',true);

		xhr.setRequestHeader('Content-Type',"multipart/form-data");
		xhr.setRequestHeader('X-File-Name',file.fileName);
		xhr.setRequestHeader('X-File-Size',file.fileSize);
		xhr.setRequestHeader('X-File-Type',file.fileType);

		xhr.send(file);

		//Manque progressbar ici


		//Upload complete check

		xhr.onreadystatechange = function(e){
			if(xhr.readyState===4)
			{
				if (xhr.status==200)
				{
					if ($("#drop1 img").length){
						if ($("#drop2 img").length){
							if ($("#drop3 img").length){
								if ($("#drop4 img").length){
									if ($("#drop5 img").length){
										console.log("full!")
									}
									else{
										$("#drop5").html("<img src='"+xhr.responseText+"' class='dropimg'/>");
										$('#dropImage5').val(xhr.responseText);
										$("#drop5").css("padding","0px");

										xhr.upload.addEventListener("progress",function(e){
											var progress = (e.loaded/e.total)*100;
											$('#dropprogress5').show();
											$('#dropprogress5').css('width',progress+"%");
											if(progress==100)
												$('#dropprogress5').addClass("bg-success");
										},false);
									}
								}else
								{
									$("#drop4").html("<img src='"+xhr.responseText+"' class='dropimg'/>");
									$('#dropImage4').val(xhr.responseText);
									$("#drop4").css("padding","0px");

									xhr.upload.addEventListener("progress",function(e){
										var progress = (e.loaded/e.total)*100;
										$('#dropprogress4').show();
										$('#dropprogress4').css('width',progress+"%");
										if(progress==100)
											$('#dropprogress4').addClass("bg-success");
									},false);
								}
							}else{
								$("#drop3").html("<img src='"+xhr.responseText+"' class='dropimg'/>");
								$('#dropImage3').val(xhr.responseText);
								$("#drop3").css("padding","0px");

								xhr.upload.addEventListener("progress",function(e){
									var progress = (e.loaded/e.total)*100;
									$('#dropprogress3').show();
									$('#dropprogress3').css('width',progress+"%");
									if(progress==100)
										$('#dropprogress3').addClass("bg-success");
								},false);
							}
						}else{
							$("#drop2").html("<img src='"+xhr.responseText+"' class='dropimg'/>");
							$('#dropImage2').val(xhr.responseText);
							$("#drop2").css("padding","0px");

							xhr.upload.addEventListener("progress",function(e){
								var progress = (e.loaded/e.total)*100;
								$('#dropprogress2').show();
								$('#dropprogress2').css('width',progress+"%");
								if(progress==100)
									$('#dropprogress2').addClass("bg-success");
							},false);
						}
					}else{
						$("#drop1").html("<img src='"+xhr.responseText+"' class='dropimg'/>");
						$('#dropImage1').val(xhr.responseText);
						$("#drop1").css("padding","0px");

						xhr.upload.addEventListener("progress",function(e){
							var progress = (e.loaded/e.total)*100;
							$('#dropprogress1').show();
							$('#dropprogress1').css('width',progress+"%");
							if(progress==100)
								$('#dropprogress1').addClass("bg-success");
						},false);
					}
				}
			}
		}
	}
});
