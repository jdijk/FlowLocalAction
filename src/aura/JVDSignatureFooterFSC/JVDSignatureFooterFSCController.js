({
	signatureSaved : function(component, event, helper) {
        
        console.log('signatureSaved');
        console.log(component.get('v.onFinalPage'));
        var action='';
        if (component.get('v.onFinalPage') == true)
            action='FINAL';
        else
            action='NEXT';
        console.log('action is: '+ action);
        
        var navigate = component.get('v.navigateFlow');  
        navigate(action); 
    }
    ,
    handleClick : function(component, event, helper) {
        var buttonName = event.getSource().get("v.name");
		var action ="";
        if (buttonName == 'ButtonNext')
        {
        	console.log('Sending saveSignature');
    		var saveSignatureEvent = $A.get("e.c:JVDSaveSignature");
    		saveSignatureEvent.fire();
        }
        else
        { 
            action="BACK";
        	var navigate = component.get('v.navigateFlow');  
        	navigate(action); 
        }
	}
})