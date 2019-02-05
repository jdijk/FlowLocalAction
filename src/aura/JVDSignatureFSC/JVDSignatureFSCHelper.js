({
	saveSignature : function(cmp,e) {
        var canvas = document.getElementById('signature-pad');
        var context = canvas.getContext('2d');
		
        var w = canvas.width;
        var h = canvas.height;
        var data = context.getImageData(0,0,w,h);
        var compositeOperation = context.globalCompositeOperation;
        context.globalCompositeOperation = "destination-over";
        context.fillStyle = '#FFF';
        context.fillRect(0,0,w,h);
        
        var d = canvas.toDataURL();
        var split = d.split('base64,',2);
        var test = split[1].toString();
        
        var action = cmp.get("c.uploadSignature");
        action.setParams({
            "parentId": cmp.get("v.ParentRecordId"),
            "documentName" : cmp.get('v.DocumentName'),
            "content": test
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === 'SUCCESS'){
                cmp.set("v.IsSuccess", true);
                
     	 		 var saveSignatureEvent = $A.get("e.c:JVDSignatureSaveResult");
    			 saveSignatureEvent.fire();
            } else {
                cmp.set("v.IsSuccess", false);
                
            }
        });
        $A.enqueueAction(action);
	}
})