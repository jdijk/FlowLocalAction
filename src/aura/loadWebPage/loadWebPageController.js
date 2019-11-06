/*
 * Copyright (c) 2018, salesforce.com, inc.
 * All rights reserved.
 * Licensed under the BSD 3-Clause license.
 * For full license text, see LICENSE.txt file in the repo root  or https://opensource.org/licenses/BSD-3-Clause
 */
 ({
	invoke : function(component, event, helper) {
        return new Promise(function(resolve, reject) {

            var args = event.getParam("arguments");
            var callback = args.callback;
           
            var url = component.get("v.url");
            //document.location.href=url;
           
            window.open( url, '_blank' );
 
            resolve();
           
 		});
    }     
})
