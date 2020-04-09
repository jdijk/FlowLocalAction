({
    init: function (cmp) {
        console.log('init');
        var action = cmp.get("c.GetCategories");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS")
            {
               cmp.set('v.items', JSON.parse(response.getReturnValue())); 
            }
        }
          
                          )
         $A.enqueueAction(action);
       
        
       
    },
    handleSelect: function (cmp, event) {
        event.preventDefault();
       cmp.set('v.CategoryName', event.getParam('name'));
       
    }

}) // eslint-disable-line
