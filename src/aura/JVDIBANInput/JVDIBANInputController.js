({ 
    init: function(cmp, event, helper) { 
        console.log('in Init');
        // Set the validate attribute to a function that includes validation logic. 
         cmp.set('v.validate', function() { 
              if(IBAN.isValid(cmp.get('v.IBAN'))) { 
                  var cmpTarget = cmp.find('txtIBAN');
                  $A.util.removeClass(cmpTarget,'NotValid')
                 
                  return { isValid: true }; 
              } 
              else { 
                  var cmpTarget = cmp.find('txtIBAN');
                  $A.util.addClass(cmpTarget,'NotValid')
                  //If the component is invalid, return the isValid parameter as false and return an error message. 
                  return { 
                      isValid: false, 
                      errorMessage: $A.get("$Label.c.NoIBANErrorMsg")
                  }; 
              }}) 
        } ,
    
    scriptloaded: function(cmp, event, helper)
    {
        console.log('in scriptloaded');
        
        
    }
})