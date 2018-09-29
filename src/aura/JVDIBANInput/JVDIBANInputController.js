({ 
    init: function(cmp, event, helper) { 
        // Set the validate attribute to a function that includes validation logic. 
        
         cmp.set('v.validate', function() { 
              if(IBAN.isValid(cmp.get('v.IBAN'))) { 
            
                  return { isValid: true }; 
              } 
              else { 
                  //If the component is invalid, return the isValid parameter as false and return an error message. 
                  return { 
                      isValid: false, 
                      errorMessage: $A.get('$Label.c.NoIBANErrorMsg')
                  }; 
              }}) 
        } ,
    
    scriptloaded: function(cmp, event, helper)
    {       
        
    },
    
})